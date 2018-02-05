import unittest
import robopol2
import math


class TestRobopol(unittest.TestCase):
    def test_ngram_freqs(self):
        corpus = 'the quick brown fox jumps over the lazy dog'.split()
        self.assertDictEqual(
            robopol2.ngram_freqs(corpus, 1),
            {
                ('the',): 2,
                ('quick',): 1,
                ('brown',): 1,
                ('fox',): 1,
                ('jumps',): 1,
                ('over',): 1,
                ('lazy',): 1,
                ('dog',): 1,
            }
        )
        self.assertEqual(
            robopol2.ngram_freqs(corpus, 2),
            {
                ('the', 'quick',): 1,
                ('quick', 'brown',): 1,
                ('brown', 'fox',): 1,
                ('fox', 'jumps', ): 1,
                ('jumps', 'over', ): 1,
                ('over', 'the', ): 1,
                ('the', 'lazy', ): 1,
                ('lazy', 'dog'): 1,
            }
        )

        corpus = 'A A B A A C'.split()
        robopol2.ngram_freqs(corpus, 2)
        self.assertEqual(
            robopol2.ngram_freqs(corpus, 2),
            {
                ('A', 'A',): 2,
                ('A', 'B',): 1,
                ('B', 'A',): 1,
                ('A', 'C', ): 1,
            }
        )


    def test_tfidf_dicts_from_freq_dicts(self):
        freq_dicts = [
                {'A': 2, 'B': 1},
                {'B': 2, 'C': 2},
                {'B': 1},
                {},
        ]
        self.assertEqual(
            robopol2.tfidf_dicts_from_freq_dicts(freq_dicts),
            [
                {'A': 2.0 * math.log(4.0 / 1.0) * 1.0, 'B': 1.0 * math.log(4.0 / 3.0) * 1.0},
                {'B': 2.0 * math.log(4.0 / 3.0) * 1.0, 'C': 2.0 * math.log(4.0 / 1.0) * 1.0},
                {'B': 1.0 * math.log(4.0 / 3.0) * 1.0},
                {},
            ]
        )


if __name__ == '__main__':
    unittest.main()
