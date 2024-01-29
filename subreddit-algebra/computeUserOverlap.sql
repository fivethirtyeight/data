# Calculating overlap between /r/The_Donald and /r/Conservative commenters
SELECT sub_a, sub_b, percent, sub_ac, sub_bc
FROM (
SELECT sub_a, sub_b, percent, COUNT(*) OVER(PARTITION BY sub_a) sub_ac, sub_bc
FROM(
SELECT a.subreddit sub_a, b.subreddit sub_b, INTEGER(100*COUNT(*)/FIRST(authors)) percent, COUNT(*) OVER(PARTITION BY sub_b) sub_bc
FROM (
 SELECT author, subreddit, authors
 FROM FLATTEN((
   SELECT UNIQUE(author) author, a.subreddit subreddit, FIRST(authors) authors
   FROM [fh-bigquery:reddit_comments.all_starting_201501] a
   JOIN [subreddit-vectors:subredditoverlaps.subr_rank_all_starting_201501] b
   ON a.subreddit=b.subreddit
   WHERE rank_authors>0 and rank_authors<500
   GROUP EACH BY 2  
 ),author)
) a
JOIN EACH (
 SELECT author, subreddit
 FROM FLATTEN((
   SELECT UNIQUE(author) author, subreddit
   FROM [fh-bigquery:reddit_comments.all_starting_201501]
   WHERE subreddit IN (SELECT subreddit FROM [subreddit-vectors:subredditoverlaps.subr_rank_all_starting_201501] 
     WHERE rank_authors>0 and rank_authors<500
   )
   GROUP BY 2
 ),author)
) b
ON a.author=b.author
WHERE a.subreddit!=b.subreddit
AND (a.subreddit='The_Donald' OR b.subreddit='The_Donald')
GROUP EACH BY 1,2
HAVING percent>5
)
)
ORDER BY 3 DESC