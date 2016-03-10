#!/usr/bin/python
# -*- coding: utf-8 -*-

import random
import numpy
import math
import string
import operator
from collections import defaultdict



# candidates to pay attention to
candidates = ["TRUMP", "CRUZ", "RUBIO", "KASICH"]

# n-gram lengths to iterate through
min_N = 1       # inclusive
max_N = 15      # exclusive



####
####  HELPER FUNCTIONS
####

# returns a dict mapping each n-gram that appears in the corpus to its frequency in the corpus
def ngram_freqs(corpus, n):
    
    # generate a list of all n-grams in the corpus
    ngrams = []
    for i in range(n, len(corpus)):
        if not "<BR>" in tuple(corpus[i-n:i]):
            ngrams += [tuple(corpus[i-n:i])]
    
    # count the frequency of each n-gram
    freq_dict = defaultdict(int)
    for ngram in ngrams:
        freq_dict[ngram] += 1
    
    return freq_dict

# combines two dicts by performing the provided operation on their values
def combine_dicts(a, b, op=operator.add):
    return dict(a.items() + b.items() + [(k, op(a[k], b[k])) for k in set(b) & set(a)])

# checks whether two n-grams overlap too much to include both
def overlap(a, b):
    max_overlap = min(3, len(a), len(b))
    overlap = False
    
    # the begnning of a is in b
    if '-'.join(a[:max_overlap]) in '-'.join(b):
        overlap = True
    # the end of a is in b
    if '-'.join(a[-max_overlap:]) in '-'.join(b):
        overlap = True
    # the begnning of b is in a
    if '-'.join(b[:max_overlap]) in '-'.join(a):
        overlap = True
    # the end of b is in a
    if '-'.join(b[-max_overlap:]) in '-'.join(a):
        overlap = True
    
    return overlap

####
####  ANALYSIS FUNCTIONS
####

# returns a list of corpora, each a sequential list of all words said by one candidate
def corpus_list_from_file(filename):
    
    # load all words from the file into memory
    words = open(filename).read().split()
    
    # initialize the list of corpora
    corpus_list = []
    for candidate in candidates:
        corpus_list += [[]]
    
    # iterate through words, putting them in the correct corpus
    speaker_index = -1
    
    for word in words:
        
        # change of speaker
        if word[-1] == ":" and word.isupper():
            # name of the new speaker
            speaker = word[:-1]
            
            # speaker is one of the candidates
            if speaker in candidates:
                speaker_index = candidates.index(speaker)
            
            # speaker is moderator or candidate not listed
            else:
                speaker_index = -1
            
            # add a speaking break indicator
            corpus_list[speaker_index] += ["<BR>"]
        
        # regular word
        elif word[0] is not "(" and word[-1] is not ")":
            
            # remove punctuation and convert to lowercase
            word = word.translate(string.maketrans("",""), string.punctuation).lower()
            
            if speaker_index >= 0:
                if word is not "":
                    corpus_list[speaker_index] += [word]
    
    return corpus_list

# returns a list of dicts, each mapping an n-gram to its frequency in the respective corpus
def freq_dicts_from_corpus_list(corpus_list):
    
    # initialize the list of dicts
    freq_dicts = []
    for candidate in range(len(candidates)):
        freq_dicts += [defaultdict(int)]
    
    # iteratively add all n-grams
    for n in range(min_N, max_N):
        for candidate in range(len(candidates)):
            corpus = corpus_list[candidate]
            dict_to_add = ngram_freqs(corpus, n)
            freq_dicts[candidate] = combine_dicts(freq_dicts[candidate], dict_to_add)
    
    return freq_dicts

# returns a list of dicts, each mapping an n-gram to its tf-idf in the respective corpus
# see https://en.wikipedia.org/wiki/Tf-idf for further information
def tfidf_dicts_from_freq_dicts(freq_dicts):
    
    # initialize the list of dicts
    tfidf_dicts = []
    for candidate in range(len(candidates)):
        tfidf_dicts += [defaultdict(int)]
    
    # create a dict that maps an n-gram to the number of corpora containing that n-gram
    num_containing = defaultdict(int)
    for candidate in range(len(candidates)):
        for ngram in freq_dicts[candidate]:
            num_containing[ngram] += 1
    
    # calculate tf-idf for each n-gram in each corpus
    for candidate in range(len(candidates)):
        for ngram in freq_dicts[candidate]:
            tf = freq_dicts[candidate][ngram]
            idf = math.log(len(candidates) / num_containing[ngram])
            
            # normalize by length of n-gram
            tfidf_dicts[candidate][ngram] = tf * idf * len(ngram)
            
            # kill anything ending in "and" "or" "of" "with"
            if ngram[-1] in ["and", "or", "of", "with"]:
                tfidf_dicts[candidate][ngram] = 0

    return tfidf_dicts

# kills any phrase (tfidf=0) contained inside a larger phrase with a higher score
def prune_substrings(tfidf_dicts, prune_thru=1000):
    
    pruned = tfidf_dicts
    
    for candidate in range(len(candidates)):
        # growing list of n-grams in list form
        so_far = []
        
        ngrams_sorted = sorted(tfidf_dicts[candidate].items(), key=operator.itemgetter(1), reverse=True)[:prune_thru]
        for ngram in ngrams_sorted:
            # contained in a previous aka 'better' phrase
            for better_ngram in so_far:
                if overlap(list(better_ngram), list(ngram[0])):
                    #print "PRUNING!! "
                    #print list(better_ngram)
                    #print list(ngram[0])
                    
                    pruned[candidate][ngram[0]] = 0
            # not contained, so add to so_far to prevent future subphrases
            else:
                so_far += [list(ngram[0])]
    
    return pruned 

# sorts the n-grams for a candidate by tf-idf
def top_ngrams_for_candidate(tfidf_dicts, candidate, count=20):
    return sorted(tfidf_dicts[candidate].items(), key=operator.itemgetter(1), reverse=True)[:count]


def main():
    corpus_list = corpus_list_from_file("gop_debate_all.txt")
    freq_dicts = freq_dicts_from_corpus_list(corpus_list)
    tfidf_dicts = tfidf_dicts_from_freq_dicts(freq_dicts)
    tfidf_dicts = prune_substrings(tfidf_dicts)
    
    # print the top ngrams sorted by tfidf
    for candidate in range(len(candidates)):
        print candidates[candidate]
        for ngram in top_ngrams_for_candidate(tfidf_dicts, candidate, 400):
            print ngram
    
    
    
if __name__ == '__main__':
    main()
    
