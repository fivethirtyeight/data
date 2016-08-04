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

if __name__ == '__main__':
    unittest.main()
