SET SEARCH_PATH = 'project';

CREATE TABLE Country (
	CountryId CHAR(2),
	Cdescription CHAR(10),
	PRIMARY KEY (CountryId)
);

CREATE TABLE Users(
	UserId CHAR(5),
	Pass CHAR(10) NOT NULL,
	Last_name CHAR(20),
	First_name CHAR(20),
	Email CHAR(50) NOT NULL,
	Year_born INTEGER,
	Gender CHAR(1) DEFAULT 'U', -- The gender is 'M' for male, 'F' for female, and 'U' for undisclosed
	Rating_count INTEGER DEFAULT 0,
	PRIMARY KEY (UserId),
	CHECK (UserId LIKE 'U%' AND Year_born>1900 AND Year_born<2016 AND (Gender='M' OR Gender='F' or Gender='U') AND Rating_count<=10));

CREATE TABLE Movie(
	MovieId CHAR(5),
	Mname CHAR(50) NOT NULL,
	Date_relased DATE,
	CountryId CHAR(2),
	PRIMARY KEY (MovieId),
	FOREIGN KEY (CountryId) REFERENCES Country,
	CHECK (MovieId LIKE 'M%')
);

CREATE TABLE Watches(
	UserId CHAR(5),
	MovieId CHAR(5),
	TimeWatched INTEGER,
	DateWatched Date,
	PRIMARY KEY (UserId, MovieId, TimeWatched),
	FOREIGN KEY (UserId) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (MovieId) REFERENCES Movie,
	CHECK (TimeWatched>0)
);

CREATE TABLE Rates(
	UserId CHAR(5),
	MovieId CHAR(5),
	Rating INTEGER,
	PRIMARY KEY (UserId, MovieId),
	FOREIGN KEY (UserId) REFERENCES Users,
	FOREIGN KEY (MovieId) REFERENCES Movie,
	CHECK (Rating>=0 AND Rating<=10)
);

CREATE TABLE Topic(
	TopicId CHAR(5),
	Description CHAR(20) NOT NULL,
	PRIMARY KEY (TopicId),
	CHECK (TopicId LIKE 'T%')
);

CREATE TABLE LikeTopics(
	UserId CHAR(5),
	TopicId CHAR(5),
	PRIMARY KEY (UserId, TopicId),
	FOREIGN KEY (UserId) REFERENCES Users,
	FOREIGN KEY (TopicId) REFERENCES Topic
);

CREATE TABLE MovieTopics(
	MovieId CHAR(20),
	TopicId CHAR(5),
	PRIMARY KEY (MovieId, TopicId),
	FOREIGN KEY (MovieId) REFERENCES Movie,
	FOREIGN KEY (TopicId) REFERENCES Topic
);

CREATE TABLE Language(
	LanguageId CHAR(2),
	Description CHAR(20) NOT NULL,
	PRIMARY KEY (LanguageId)
);

CREATE TABLE MovieLanguages(
	MovieId CHAR(5),
	LanguageId CHAR(2),
	Subtitle CHAR(1),
	PRIMARY KEY (MovieId, LanguageId),
	FOREIGN KEY (MovieId) REFERENCES Movie,
	FOREIGN KEY (LanguageId) REFERENCES Language,
	CHECK (Subtitle='Y' OR Subtitle='N')
);

CREATE TABLE Studio(
	StudioId CHAR(5),
	Sname CHAR(20) NOT NULL,
	CountryId CHAR(2),
	PRIMARY KEY (StudioId),
	FOREIGN KEY (CountryId) REFERENCES Country,
	CHECK (StudioId LIKE 'S%')
);

CREATE TABLE Sponsors(
	MovieId CHAR(5),
	StudioId CHAR(5),
	PRIMARY KEY (MovieId, StudioId),
	FOREIGN KEY (MovieId) REFERENCES Movie,
	FOREIGN KEY (StudioId) REFERENCES Studio
);

CREATE TABLE Director(
	DirectorId CHAR(5),
	lastname CHAR(20) NOT NULL,
	firstname CHAR(20) NOT NULL,
	CountryId CHAR(2),
	PRIMARY KEY (DirectorId),
	FOREIGN KEY (CountryId) REFERENCES Country,
	CHECK (DirectorId LIKE 'D%')
);

CREATE TABLE Directs(
	MovieId CHAR(5),
	DirectorId CHAR(5),
	PRIMARY KEY (MovieId, DirectorId),
	FOREIGN KEY (MovieId) REFERENCES Movie,
	FOREIGN KEY (DirectorId) REFERENCES Director
);

CREATE TABLE Actor(
	ActorId CHAR(5),
	last_name CHAR(20) NOT NULL,
	first_name CHAR(20) NOT NULL,
	CountryId CHAR(2),
	PRIMARY KEY (ActorId),
	FOREIGN KEY (CountryId) REFERENCES Country,
	CHECK (ActorId LIKE 'A%')
);

CREATE TABLE Plays(
	MovieId CHAR(5),
	ActorId CHAR(5),
	Role CHAR(20),
	PRIMARY KEY (MovieId, ActorId),
	FOREIGN KEY (MovieId) REFERENCES Movie,
	FOREIGN KEY (ActorId) REFERENCES Actor
);
