import unittest
import robopol2


class TestRobopol(unittest.TestCase):
    def test_ngram_freqs(self):
        corpus = 'the quick brown fox jumps over the lazy dog'.split()
        self.assertEqual(
            robopol2.ngram_freqs(corpus, 1),
            {
                ('the',): 1,
                ('quick',): 1,
                ('brown',): 1,
                ('fox',): 1,
                ('jumps',): 1,
                ('over',): 1,
                ('the',): 1,
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

if __name__ == '__main__':
    unittest.main()
