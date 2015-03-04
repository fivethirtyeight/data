"""This program will determine the most popular ethnic food based on demographics."""

import csv
import numpy as np
import string

def manage_data(filename):	
	empty = []
	with open(filename,"rU") as csvfile:
		spamreader = csv.reader(csvfile,  quotechar = '|')
		for row in spamreader:
			lines = ', '.join(row)
			lines = lines.split(",")
			empty.append(lines)
		return empty[:3]

def get_numpy_array(csv_file):                                                                                                                                             
	"""returns a numpy array built from the csv file. To stop numpy from crapping itself, uneven rows and columns are padded with empty strings so that all rows and            columns have the same number of elements"""                                                                                                                                 
	data = []                                                                                                                                                               
	f = open(csv_file, "rU")                                                                                                                                                     
	for row in csv.reader(f):                                                                                                                                              
		data.append(row)                                                                                                                                                    
	length = len(sorted(data,key=len, reverse=True)[0])                                                                                                                     
	return np.array([x+['']*(length-len(x)) for x in data])  


def make_lists(filename):
	l = []
	data = manage_data(filename)
	for line in data:
		l.append(line)
	return l

def find_ranking(filename):
	number = ['1','2','3','4','5']
	l = get_numpy_array(filename)
	results = np.zeros((l.shape[1],1))
	for i in range(l.shape[0]):
		for j in range(l.shape[1]):
			if l[i,j] in number:
				results[i] = results[i] + int(l[i,j])
	print results

	#print dataset.shape
	#for i in range(len(dataset)) # width and then height


def make_dictionary(filename):
	d = {}
	data = manage_data(filename)
	for line in data:
		d[line[0]] = line[1:]
	print d

#compile the rankings per country excluding n/a
#sum the ith element of evert list to retrive country rank
def rank_country(filename):
	d = make_dictionary(filename)
	countries = ['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland']
	ranking = []
	for key in d:
		value = d.get(key)
		for index in range(3,42):
			print value


find_ranking("food-world-cup-data.csv")
#manage_data("food-world-cup-data.csv")
#rank_country("food-world-cup-data.csv")
#make_dictionary("food-world-cup-data.csv")
#make_array("food-world-cup-data.csv")