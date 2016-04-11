SELECT * FROM Actor;
SELECT * FROM Director;
SELECT * FROM Movie;
SELECT * FROM Topic;

--MOVIE WITH TOPICS--
SELECT m.movieid,m.mname,t.description
FROM movietopics mt
INNER JOIN movie m
ON m.movieid = mt.movieid
INNER JOIN topic t
ON t.topicid = mt.topicid;

--MOVIE WITH DIRECTORS--
SELECT movie.movieid, movie.mname,director.lastname,director.firstname
FROM movie
INNER JOIN directs
ON directs.movieid = movie.movieid
INNER JOIN director
ON directs.directorid = director.directorid;
