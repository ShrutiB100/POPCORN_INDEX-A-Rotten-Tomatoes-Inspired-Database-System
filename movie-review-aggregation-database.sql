create database POPCORN_INDEX;
use POPCORN_INDEX;

create table features (
    feature_id int auto_increment primary key,
    title varchar(255) not null,
    release_year int not null,
    type varchar(50) not null
);

create table franchises (
    franchise_id int auto_increment primary key,
    name varchar(255) not null,
    studio varchar(255)
);

create table franchise_features (
    feature_id int,
    franchise_id int,
    franchise_number int,
    primary key (feature_id, franchise_id),
    foreign key (feature_id) references features(feature_id),
    foreign key (franchise_id) references franchises(franchise_id)
);

create table feature_genres (
    feature_id int,
    genre_name varchar(50),
    score int,
    primary key (feature_id, genre_name),
    foreign key (feature_id) references features(feature_id)
);

create table critics (
    critic_id int auto_increment primary key,
    name varchar(255) not null unique,
    publication varchar(255),
    is_top_critic boolean default false
);

create table critic_influence (
    critic_id int primary key,
    weight decimal(3,2) default 1.00,
    foreign key (critic_id) references critics(critic_id)
);

create table reviews (
    review_id int auto_increment primary key,
    feature_id int not null,
    critic_id int not null,
    review_text text,
    review_date date not null,
    sentiment varchar(10)not null,
    foreign key (feature_id) references features(feature_id),
    foreign key (critic_id) references critics(critic_id),
    check (sentiment in ('positive', 'negative'))
);

create table scores (
    review_id int primary key not null, 
    score_value decimal(4,1),
    max_score int,
    foreign key (review_id) references reviews(review_id)
);

create table review_votes (
    vote_id int auto_increment primary key,
    review_id int not null,
    is_positive boolean,
    foreign key (review_id) references reviews(review_id)
);

create table feature_release (
    feature_id int primary key,
    release_date date,
    country varchar(100),
    foreign key (feature_id) references features(feature_id)
);

create table actors (
    actor_id int auto_increment primary key,
    name varchar(255) not null unique,
    gender varchar(10),
    ethnicity varchar(50)
);

create table feature_actors (
    feature_id int,
    actor_id int,
    role varchar(255),
    primary key (feature_id, actor_id, role),
    foreign key (feature_id) references features(feature_id),
    foreign key (actor_id) references actors(actor_id)
);

INSERT INTO features (title, release_year, type) VALUES
('The Godfather', 1972, 'movie'),
('The Godfather Part II', 1974, 'movie'),
('The Dark Knight', 2008, 'movie'),
('Pulp Fiction', 1994, 'movie'),
('Forrest Gump', 1994, 'movie'),
('Inception', 2010, 'movie'),
('Fight Club', 1999, 'movie'),
('The Matrix', 1999, 'movie'),
('The Matrix Reloaded', 2003, 'movie'),
('The Matrix Revolutions', 2003, 'movie'),
('Interstellar', 2014, 'movie'),
('Gladiator', 2000, 'movie'),
('Titanic', 1997, 'movie'),
('Avatar', 2009, 'movie'),
('Avatar: The Way of Water', 2022, 'movie'),
('The Shawshank Redemption', 1994, 'movie'),
('Schindler''s List', 1993, 'movie'),
('The Silence of the Lambs', 1991, 'movie'),
('Saving Private Ryan', 1998, 'movie'),
('Jurassic Park', 1993, 'movie'),
('The Lost World: Jurassic Park', 1997, 'movie'),
('Jurassic World', 2015, 'movie'),
('Star Wars: A New Hope', 1977, 'movie'),
('Star Wars: The Empire Strikes Back', 1980, 'movie'),
('Star Wars: Return of the Jedi', 1983, 'movie'),
('Star Wars: The Force Awakens', 2015, 'movie'),
('Star Wars: The Last Jedi', 2017, 'movie'),
('Star Wars: The Rise of Skywalker', 2019, 'movie'),
('The Avengers', 2012, 'movie'),
('Avengers: Age of Ultron', 2015, 'movie'),
('Avengers: Infinity War', 2018, 'movie'),
('Avengers: Endgame', 2019, 'movie'),
('Iron Man', 2008, 'movie'),
('Iron Man 2', 2010, 'movie'),
('Iron Man 3', 2013, 'movie'),
('Captain America: The First Avenger', 2011, 'movie'),
('Captain America: The Winter Soldier', 2014, 'movie'),
('Captain America: Civil War', 2016, 'movie'),
('Thor', 2011, 'movie'),
('Thor: Ragnarok', 2017, 'movie'),
('Black Panther', 2018, 'movie'),
('Doctor Strange', 2016, 'movie'),
('Guardians of the Galaxy', 2014, 'movie'),
('Guardians of the Galaxy Vol. 2', 2017, 'movie'),
('Spider-Man: Homecoming', 2017, 'movie'),
('Spider-Man: Far From Home', 2019, 'movie'),
('Spider-Man: No Way Home', 2021, 'movie'),
('The Lion King', 1994, 'movie'),
('Frozen', 2013, 'movie'),
('Frozen II', 2019, 'movie'),
('Toy Story', 1995, 'movie'),
('Toy Story 2', 1999, 'movie'),
('Toy Story 3', 2010, 'movie'),
('Toy Story 4', 2019, 'movie'),
('Finding Nemo', 2003, 'movie'),
('Finding Dory', 2016, 'movie'),
('Shrek', 2001, 'movie'),
('Shrek 2', 2004, 'movie'),
('Shrek the Third', 2007, 'movie'),
('Shrek Forever After', 2010, 'movie'),
('Harry Potter and the Sorcerer''s Stone', 2001, 'movie'),
('Harry Potter and the Chamber of Secrets', 2002, 'movie'),
('Harry Potter and the Prisoner of Azkaban', 2004, 'movie'),
('Harry Potter and the Goblet of Fire', 2005, 'movie'),
('Harry Potter and the Order of the Phoenix', 2007, 'movie'),
('Harry Potter and the Half-Blood Prince', 2009, 'movie'),
('Harry Potter and the Deathly Hallows Part 1', 2010, 'movie'),
('Harry Potter and the Deathly Hallows Part 2', 2011, 'movie'),
('The Lord of the Rings: The Fellowship of the Ring', 2001, 'movie'),
('The Lord of the Rings: The Two Towers', 2002, 'movie'),
('The Lord of the Rings: The Return of the King', 2003, 'movie'),
('The Hobbit: An Unexpected Journey', 2012, 'movie'),
('The Hobbit: The Desolation of Smaug', 2013, 'movie'),
('The Hobbit: The Battle of the Five Armies', 2014, 'movie'),
('The Conjuring', 2013, 'movie'),
('The Conjuring 2', 2016, 'movie'),
('Annabelle', 2014, 'movie'),
('Annabelle: Creation', 2017, 'movie'),
('It', 2017, 'movie'),
('It Chapter Two', 2019, 'movie'),
('Joker', 2019, 'movie'),
('The Batman', 2022, 'movie'),
('Batman Begins', 2005, 'movie'),
('The Dark Knight Rises', 2012, 'movie'),
('Deadpool', 2016, 'movie'),
('Deadpool 2', 2018, 'movie'),
('Logan', 2017, 'movie'),
('X-Men', 2000, 'movie'),
('X2: X-Men United', 2003, 'movie'),
('X-Men: Days of Future Past', 2014, 'movie'),
('The Social Network', 2010, 'movie'),
('Whiplash', 2014, 'movie'),
('La La Land', 2016, 'movie'),
('Parasite', 2019, 'movie'),
('The Wolf of Wall Street', 2013, 'movie'),
('Django Unchained', 2012, 'movie'),
('Once Upon a Time in Hollywood', 2019, 'movie'),
('Mad Max: Fury Road', 2015, 'movie');

INSERT INTO franchises (name, studio) VALUES
('The Godfather', 'Paramount Pictures'),
('The Matrix', 'Warner Bros.'),
('Jurassic Park', 'Universal Pictures'),
('Star Wars', 'Lucasfilm'),
('Marvel Cinematic Universe', 'Marvel Studios'),
('Toy Story', 'Pixar'),
('Finding Nemo', 'Pixar'),
('Shrek', 'DreamWorks Animation'),
('Harry Potter', 'Warner Bros.'),
('The Lord of the Rings', 'New Line Cinema'),
('The Hobbit', 'Warner Bros.'),
('The Conjuring Universe', 'Warner Bros.'),
('It', 'Warner Bros.'),
('The Dark Knight Trilogy', 'Warner Bros.'),
('Batman (Standalone)', 'Warner Bros.'),
('Deadpool', '20th Century Fox'),
('X-Men', '20th Century Fox'),
('Avatar', '20th Century Studios'),
('Frozen', 'Disney'),
('The Lion King', 'Disney');

INSERT INTO franchise_features (feature_id, franchise_id, franchise_number) VALUES
(1,1,1),(2,1,2),
(8,2,1),(9,2,2),(10,2,3),
(20,3,1),(21,3,2),(22,3,3),
(23,4,1),(24,4,2),(25,4,3),
(26,4,4),(27,4,5),(28,4,6),
(29,5,1),(30,5,2),(31,5,3),(32,5,4),
(33,5,1),(34,5,2),(35,5,3),
(36,5,1),(37,5,2),(38,5,3),
(39,5,1),(40,5,2),
(41,5,1),(42,5,1),
(43,5,1),(44,5,2),
(45,5,1),(46,5,2),(47,5,3),
(51,6,1),(52,6,2),(53,6,3),(54,6,4),
(55,7,1),(56,7,2),
(57,8,1),(58,8,2),(59,8,3),(60,8,4),
(61,9,1),(62,9,2),(63,9,3),(64,9,4),
(65,9,5),(66,9,6),(67,9,7),(68,9,8),
(69,10,1),(70,10,2),(71,10,3),
(72,11,1),(73,11,2),(74,11,3),
(75,12,1),(76,12,2),(77,12,3),(78,12,4),
(79,13,1),(80,13,2),
(83,14,1),(3,14,2),(84,14,3),
(82,15,1),
(86,16,1),(87,16,2),
(89,17,1),(90,17,2),(91,17,3),
(14,18,1),(15,18,2),
(49,19,1),(50,19,2),
(48,20,1);

INSERT INTO feature_genres (feature_id, genre_name, score) VALUES
(1,'crime',1),(1,'drama',1),
(2,'crime',1),(2,'drama',1),
(3,'action',1),(3,'crime',1),(3,'drama',1),
(4,'crime',1),(4,'drama',1),
(5,'drama',1),(5,'romance',1),
(6,'action',1),(6,'science_fiction',1),
(7,'drama',1),
(8,'action',1),(8,'science_fiction',1),
(9,'action',1),(9,'science_fiction',1),
(10,'action',1),(10,'science_fiction',1),
(11,'science_fiction',1),(11,'drama',1),
(12,'action',1),(12,'drama',1),
(13,'romance',1),(13,'drama',1),
(14,'science_fiction',1),(14,'action',1),
(15,'science_fiction',1),(15,'action',1),
(16,'drama',1),
(17,'drama',1),(17,'history',1),
(18,'thriller',1),
(19,'war',1),(19,'drama',1),
(20,'action',1),(20,'science_fiction',1),
(21,'action',1),(21,'science_fiction',1),
(22,'action',1),(22,'science_fiction',1),
(23,'science_fiction',1),(23,'adventure',1),
(24,'science_fiction',1),(24,'adventure',1),
(25,'science_fiction',1),(25,'adventure',1),
(26,'science_fiction',1),(26,'action',1),
(27,'science_fiction',1),(27,'action',1),
(28,'science_fiction',1),(28,'action',1),
(29,'action',1),(29,'science_fiction',1),
(30,'action',1),(30,'science_fiction',1),
(31,'action',1),(31,'science_fiction',1),
(32,'action',1),(32,'science_fiction',1),
(33,'action',1),
(34,'action',1),
(35,'action',1),
(36,'action',1),
(37,'action',1),
(38,'action',1),
(39,'fantasy',1),(39,'action',1),
(40,'fantasy',1),(40,'action',1),
(41,'action',1),
(42,'fantasy',1),
(43,'action',1),(43,'comedy',1),
(44,'action',1),(44,'comedy',1),
(45,'action',1),
(46,'action',1),
(47,'action',1),
(48,'animation',1),(48,'drama',1),
(49,'animation',1),(49,'fantasy',1),
(50,'animation',1),(50,'fantasy',1),
(51,'animation',1),(51,'comedy',1),
(52,'animation',1),(52,'comedy',1),
(53,'animation',1),(53,'drama',1),
(54,'animation',1),(54,'drama',1),
(55,'animation',1),
(56,'animation',1),
(57,'animation',1),(57,'comedy',1),
(58,'animation',1),(58,'comedy',1),
(59,'animation',1),(59,'comedy',1),
(60,'animation',1),(60,'comedy',1),
(61,'fantasy',1),
(62,'fantasy',1),
(63,'fantasy',1),
(64,'fantasy',1),
(65,'fantasy',1),
(66,'fantasy',1),
(67,'fantasy',1),
(68,'fantasy',1),
(69,'fantasy',1),(69,'adventure',1),
(70,'fantasy',1),(70,'adventure',1),
(71,'fantasy',1),(71,'adventure',1),
(72,'fantasy',1),
(73,'fantasy',1),
(74,'fantasy',1),
(75,'horror',1),
(76,'horror',1),
(77,'horror',1),
(78,'horror',1),
(79,'horror',1),
(80,'horror',1),
(81,'drama',1),
(82,'action',1),
(83,'action',1),
(84,'action',1),
(85,'action',1),
(86,'action',1),(86,'comedy',1),
(87,'action',1),(87,'comedy',1),
(88,'action',1),(88,'drama',1),
(89,'action',1),
(90,'action',1),
(91,'action',1),
(92,'drama',1),
(93,'drama',1),
(94,'romance',1),(94,'drama',1),
(95,'drama',1),
(96,'drama',1),
(97,'drama',1),
(98,'action',1);

INSERT INTO critics (name, publication, is_top_critic) VALUES
('James Berardinelli','ReelViews',true),
('Peter Travers','Rolling Stone',true),
('Manohla Dargis','New York Times',true),
('A.O. Scott','New York Times',true),
('Richard Roeper','Chicago Sun-Times',true),
('Mark Kermode','BBC',true),
('Owen Gleiberman','Variety',true),
('Todd McCarthy','Hollywood Reporter',true),
('Stephanie Zacharek','TIME',true),
('Brian Tallerico','RogerEbert.com',true),
('User Critic 1','Independent',false),
('User Critic 2','Independent',false),
('User Critic 3','Independent',false),
('User Critic 4','Independent',false),
('User Critic 5','Independent',false);

INSERT INTO critic_influence (critic_id, weight) VALUES
(1,1.50),(2,1.40),(3,1.50),(4,1.50),(5,1.30),
(6,1.40),(7,1.30),(8,1.30),(9,1.20),(10,1.20),
(11,1.00),(12,1.00),(13,0.90),(14,0.90),(15,0.80);

INSERT INTO reviews (feature_id, critic_id, review_text, review_date, sentiment) VALUES
(1,1,'A landmark cinematic achievement with powerful storytelling','2020-01-01','positive'),
(1,11,'Slow pacing but still compelling overall','2020-01-02','negative'),
(2,2,'A masterful sequel that deepens the original story','2020-01-03','positive'),
(2,12,'Overly long but well acted','2020-01-04','negative'),
(3,3,'One of the greatest superhero films ever made','2020-01-05','positive'),
(3,13,'Too dark for some audiences','2020-01-06','negative'),
(4,4,'Sharp dialogue and unforgettable performances','2020-01-07','positive'),
(4,14,'Style over substance at times','2020-01-08','negative'),
(5,5,'Emotionally rich and timeless storytelling','2020-01-09','positive'),
(5,15,'Overly sentimental narrative','2020-01-10','negative'),
(6,6,'Visually stunning and thought provoking','2020-01-11','positive'),
(6,11,'Confusing narrative structure','2020-01-12','negative'),
(7,7,'Bold and subversive filmmaking','2020-01-13','positive'),
(7,12,'Not for everyone','2020-01-14','negative'),
(8,8,'Revolutionary sci-fi action film','2020-01-15','positive'),
(8,13,'Dated effects by modern standards','2020-01-16','negative'),
(9,9,'Expands the universe with ambition','2020-01-17','positive'),
(9,14,'Overcomplicated plot','2020-01-18','negative'),
(10,10,'A satisfying conclusion to the trilogy','2020-01-19','positive'),
(10,15,'Lacks emotional depth','2020-01-20','negative'),
(11,1,'A breathtaking journey through space and time','2020-01-21','positive'),
(11,11,'Overly complex for casual viewers','2020-01-22','negative'),
(12,2,'Epic storytelling with powerful performances','2020-01-23','positive'),
(12,12,'Predictable narrative arc','2020-01-24','negative'),
(13,3,'A visually stunning romance epic','2020-01-25','positive'),
(13,13,'Too melodramatic at times','2020-01-26','negative'),
(14,4,'Groundbreaking visual effects and world building','2020-01-27','positive'),
(14,14,'Weak story beneath visuals','2020-01-28','negative'),
(15,5,'Immersive and visually spectacular sequel','2020-01-29','positive'),
(15,15,'Narrative feels stretched','2020-01-30','negative'),
(16,6,'A deeply moving and hopeful story','2020-01-31','positive'),
(16,11,'Slow pacing may deter some viewers','2020-02-01','negative'),
(17,7,'A powerful historical masterpiece','2020-02-02','positive'),
(17,12,'Emotionally overwhelming','2020-02-03','negative'),
(18,8,'Tense and gripping thriller','2020-02-04','positive'),
(18,13,'Disturbing subject matter','2020-02-05','negative'),
(19,9,'A visceral and realistic war film','2020-02-06','positive'),
(19,14,'Too intense for some viewers','2020-02-07','negative'),
(20,10,'A thrilling adventure with groundbreaking effects','2020-02-08','positive'),
(20,15,'Characters feel secondary to spectacle','2020-02-09','negative'),
(21,1,'Entertaining sequel with memorable moments','2020-02-10','positive'),
(21,11,'Fails to capture original magic','2020-02-11','negative'),
(22,2,'Exciting revival of the franchise','2020-02-12','positive'),
(22,12,'Relies too much on nostalgia','2020-02-13','negative'),
(23,3,'A timeless space adventure classic','2020-02-14','positive'),
(23,13,'Simple story by modern standards','2020-02-15','negative'),
(24,4,'Darker and more mature sequel','2020-02-16','positive'),
(24,14,'Slower pacing than expected','2020-02-17','negative'),
(25,5,'A satisfying and emotional conclusion','2020-02-18','positive'),
(25,15,'Less impactful than its predecessor','2020-02-19','negative'),
(26,6,'A thrilling continuation with fresh characters','2020-02-20','positive'),
(26,11,'Feels derivative of earlier entries','2020-02-21','negative'),
(27,7,'Bold storytelling that challenges expectations','2020-02-22','positive'),
(27,12,'Divisive narrative choices','2020-02-23','negative'),
(28,8,'A visually impressive finale','2020-02-24','positive'),
(28,13,'Lacks coherence in storytelling','2020-02-25','negative'),
(29,9,'A fun and ambitious superhero team-up','2020-02-26','positive'),
(29,14,'Overcrowded with characters','2020-02-27','negative'),
(30,10,'Entertaining sequel with strong action','2020-02-28','positive'),
(30,15,'Fails to surpass the original','2020-02-29','negative'),
(31,1,'Epic scale and emotional stakes','2020-03-01','positive'),
(31,11,'Too many plot threads','2020-03-02','negative'),
(32,2,'A satisfying and emotional conclusion','2020-03-03','positive'),
(32,12,'Relies heavily on fan service','2020-03-04','negative'),
(33,3,'A groundbreaking origin story','2020-03-05','positive'),
(33,13,'Standard superhero formula','2020-03-06','negative'),
(34,4,'Solid sequel with strong performances','2020-03-07','positive'),
(34,14,'Lacks originality','2020-03-08','negative'),
(35,5,'A darker and more personal story','2020-03-09','positive'),
(35,15,'Uneven pacing throughout','2020-03-10','negative'),
(36,6,'Classic hero origin done well','2020-03-11','positive'),
(36,11,'Predictable storyline','2020-03-12','negative'),
(37,7,'A tense and engaging political thriller','2020-03-13','positive'),
(37,12,'Too serious for its genre','2020-03-14','negative'),
(38,8,'A compelling clash of heroes','2020-03-15','positive'),
(38,13,'Overstuffed narrative','2020-03-16','negative'),
(39,9,'A fun and charismatic adventure','2020-03-17','positive'),
(39,14,'Tonal inconsistency','2020-03-18','negative'),
(40,10,'A colorful and humorous reinvention','2020-03-19','positive'),
(40,15,'Too comedic for some fans','2020-03-20','negative'),
(41,1,'A culturally significant superhero film','2020-03-21','positive'),
(41,11,'Overhyped by critics','2020-03-22','negative'),
(42,2,'Visually inventive and engaging','2020-03-23','positive'),
(42,12,'Complex plot may confuse viewers','2020-03-24','negative'),
(43,3,'A fun and energetic space adventure','2020-03-25','positive'),
(43,13,'Relies too much on humor','2020-03-26','negative'),
(44,4,'A strong sequel with emotional depth','2020-03-27','positive'),
(44,14,'Less fresh than the original','2020-03-28','negative'),
(45,5,'A charming and relatable superhero story','2020-03-29','positive'),
(45,15,'Feels small in scale','2020-03-30','negative'),
(46,6,'A globe-trotting superhero adventure','2020-03-31','positive'),
(46,11,'Predictable twists','2020-04-01','negative'),
(47,7,'A multiverse spectacle done right','2020-04-02','positive'),
(47,12,'Overwhelming fan service','2020-04-03','negative'),
(48,8,'A timeless animated masterpiece','2020-04-04','positive'),
(48,13,'Simple narrative structure','2020-04-05','negative'),
(49,9,'A beautifully animated musical','2020-04-06','positive'),
(49,14,'Songs overshadow story','2020-04-07','negative'),
(50,10,'A visually stunning sequel','2020-04-08','positive'),
(50,15,'Less memorable than original','2020-04-09','negative'),
(51,1,'A groundbreaking animated classic','2020-04-10','positive'),
(51,11,'Feels dated compared to modern animation','2020-04-11','negative'),
(52,2,'A worthy sequel with heart and humor','2020-04-12','positive'),
(52,12,'Lacks the originality of the first','2020-04-13','negative'),
(53,3,'Emotionally resonant and beautifully crafted','2020-04-14','positive'),
(53,13,'Too heavy for younger audiences','2020-04-15','negative'),
(54,4,'A touching conclusion to a beloved series','2020-04-16','positive'),
(54,14,'Feels unnecessary as a sequel','2020-04-17','negative'),
(55,5,'A heartfelt underwater adventure','2020-04-18','positive'),
(55,15,'Predictable storyline','2020-04-19','negative'),
(56,6,'Charming and funny with great characters','2020-04-20','positive'),
(56,11,'Less impactful than its predecessor','2020-04-21','negative'),
(57,7,'A hilarious and imaginative fairy tale','2020-04-22','positive'),
(57,12,'Humor does not always land','2020-04-23','negative'),
(58,8,'A fun sequel with expanded world','2020-04-24','positive'),
(58,13,'Relies too much on jokes','2020-04-25','negative'),
(59,9,'Entertaining but chaotic','2020-04-26','positive'),
(59,14,'Lacks focus and direction','2020-04-27','negative'),
(60,10,'A satisfying end to the saga','2020-04-28','positive'),
(60,15,'Not as strong as earlier entries','2020-04-29','negative'),
(61,1,'Magical and captivating introduction','2020-04-30','positive'),
(61,11,'Simplistic storytelling','2020-05-01','negative'),
(62,2,'A darker and more engaging sequel','2020-05-02','positive'),
(62,12,'Overly long runtime','2020-05-03','negative'),
(63,3,'A bold stylistic shift for the series','2020-05-04','positive'),
(63,13,'Confusing tone','2020-05-05','negative'),
(64,4,'Exciting and action-packed installment','2020-05-06','positive'),
(64,14,'Too many subplots','2020-05-07','negative'),
(65,5,'A strong continuation with emotional weight','2020-05-08','positive'),
(65,15,'Feels repetitive','2020-05-09','negative'),
(66,6,'A mature and darker chapter','2020-05-10','positive'),
(66,11,'Slow pacing','2020-05-11','negative'),
(67,7,'A tense and gripping build-up','2020-05-12','positive'),
(67,12,'Incomplete as a standalone film','2020-05-13','negative'),
(68,8,'A thrilling and emotional finale','2020-05-14','positive'),
(68,13,'Relies on spectacle','2020-05-15','negative'),
(69,9,'An epic fantasy adventure begins','2020-05-16','positive'),
(69,14,'Slow start','2020-05-17','negative'),
(70,10,'A strong middle chapter','2020-05-18','positive'),
(70,15,'Drags in parts','2020-05-19','negative'),
(71,1,'A powerful and emotional conclusion','2020-05-20','positive'),
(71,11,'Overly long ending','2020-05-21','negative'),
(72,2,'A charming return to Middle-earth','2020-05-22','positive'),
(72,12,'Unnecessary expansion','2020-05-23','negative'),
(73,3,'Visually stunning with strong performances','2020-05-24','positive'),
(73,13,'Bloated runtime','2020-05-25','negative'),
(74,4,'An action-packed finale','2020-05-26','positive'),
(74,14,'Lacks emotional depth','2020-05-27','negative'),
(75,5,'A chilling and effective horror film','2020-05-28','positive'),
(75,15,'Relies on jump scares','2020-05-29','negative'),
(76,6,'A strong sequel with deeper scares','2020-05-30','positive'),
(76,11,'Feels repetitive compared to the first','2020-05-31','negative'),
(77,7,'A creepy and atmospheric horror story','2020-06-01','positive'),
(77,12,'Predictable horror tropes','2020-06-02','negative'),
(78,8,'An effective origin story with tension','2020-06-03','positive'),
(78,13,'Relies too heavily on clichés','2020-06-04','negative'),
(79,9,'A terrifying and well-acted horror film','2020-06-05','positive'),
(79,14,'Too reliant on shock value','2020-06-06','negative'),
(80,10,'A satisfying continuation with strong visuals','2020-06-07','positive'),
(80,15,'Overlong and less focused','2020-06-08','negative'),
(81,1,'A bold and unsettling character study','2020-06-09','positive'),
(81,11,'Too bleak and uncomfortable','2020-06-10','negative'),
(82,2,'A gritty and engaging detective story','2020-06-11','positive'),
(82,12,'Overly long runtime','2020-06-12','negative'),
(83,3,'A strong reboot with solid performances','2020-06-13','positive'),
(83,13,'Feels generic at times','2020-06-14','negative'),
(84,4,'A masterclass in superhero filmmaking','2020-06-15','positive'),
(84,14,'Overpraised by critics','2020-06-16','negative'),
(85,5,'A powerful and emotional conclusion','2020-06-17','positive'),
(85,15,'Too long and drawn out','2020-06-18','negative'),
(86,6,'A hilarious and irreverent superhero film','2020-06-19','positive'),
(86,11,'Humor can be excessive','2020-06-20','negative'),
(87,7,'A fun and action-packed sequel','2020-06-21','positive'),
(87,12,'Less fresh than the original','2020-06-22','negative'),
(88,8,'A gritty and emotional superhero drama','2020-06-23','positive'),
(88,13,'Too dark in tone','2020-06-24','negative'),
(89,9,'A solid start to a beloved franchise','2020-06-25','positive'),
(89,14,'Aged poorly in some aspects','2020-06-26','negative'),
(90,10,'A strong sequel with great action','2020-06-27','positive'),
(90,15,'Messy narrative','2020-06-28','negative'),
(91,1,'An ambitious and thrilling installment','2020-06-29','positive'),
(91,11,'Too complex for its own good','2020-06-30','negative'),
(92,2,'A sharp and engaging biographical drama','2020-07-01','positive'),
(92,12,'Lacks emotional depth','2020-07-02','negative'),
(93,3,'An intense and gripping character study','2020-07-03','positive'),
(93,13,'Overly stressful viewing experience','2020-07-04','negative'),
(94,4,'A beautiful and heartfelt musical','2020-07-05','positive'),
(94,14,'Story feels predictable','2020-07-06','negative'),
(95,5,'A brilliant and socially relevant film','2020-07-07','positive'),
(95,15,'Pacing issues in the middle','2020-07-08','negative'),
(96,6,'A wild and entertaining true story','2020-07-09','positive'),
(96,11,'Glorifies questionable behavior','2020-07-10','negative'),
(97,7,'A powerful and stylish western','2020-07-11','positive'),
(97,12,'Overly violent at times','2020-07-12','negative'),
(98,8,'A nostalgic and well-crafted drama','2020-07-13','positive'),
(98,13,'Lacks a strong narrative focus','2020-07-14','negative');

INSERT INTO scores (review_id, score_value, max_score) VALUES
(1,9.5,10),(2,6.0,10),
(3,9.0,10),(4,6.5,10),
(5,9.2,10),(6,5.5,10),
(7,8.8,10),(8,5.0,10),
(9,9.0,10),(10,6.0,10),
(11,9.3,10),(12,5.5,10),
(13,8.7,10),(14,5.0,10),
(15,9.1,10),(16,5.5,10),
(17,8.9,10),(18,5.0,10),
(19,9.2,10),(20,5.5,10),
(21,8.8,10),(22,5.0,10),
(23,9.0,10),(24,5.5,10),
(25,8.7,10),(26,5.0,10),
(27,9.3,10),(28,5.5,10),
(29,8.9,10),(30,5.0,10),
(31,9.4,10),(32,5.5,10),
(33,9.0,10),(34,5.0,10),
(35,8.8,10),(36,5.5,10),
(37,9.2,10),(38,5.0,10),
(39,8.9,10),(40,5.5,10),
(41,9.3,10),(42,5.0,10),
(43,8.7,10),(44,5.5,10),
(45,9.1,10),(46,5.0,10),
(47,8.8,10),(48,5.5,10),
(49,9.0,10),(50,5.0,10),
(51,8.9,10),(52,5.5,10),
(53,9.2,10),(54,5.0,10),
(55,8.7,10),(56,5.5,10),
(57,9.1,10),(58,5.0,10),
(59,8.8,10),(60,5.5,10),
(61,9.3,10),(62,5.0,10),
(63,8.9,10),(64,5.5,10),
(65,9.2,10),(66,5.0,10),
(67,8.8,10),(68,5.5,10),
(69,9.0,10),(70,5.0,10),
(71,9.4,10),(72,5.5,10),
(73,8.9,10),(74,5.0,10),
(75,9.1,10),(76,5.5,10),
(77,8.7,10),(78,5.0,10),
(79,9.2,10),(80,5.5,10),
(81,8.8,10),(82,5.0,10),
(83,9.0,10),(84,5.5,10),
(85,8.9,10),(86,5.0,10),
(87,9.3,10),(88,5.5,10),
(89,8.7,10),(90,5.0,10),
(91,9.2,10),(92,5.5,10),
(93,8.8,10),(94,5.0,10),
(95,9.1,10),(96,5.5,10),
(97,8.9,10),(98,5.0,10),
(99,9.4,10),(100,5.5,10),
(101,8.8,10),(102,5.0,10),
(103,9.0,10),(104,5.5,10),
(105,8.9,10),(106,5.0,10),
(107,9.2,10),(108,5.5,10),
(109,8.7,10),(110,5.0,10),
(111,9.3,10),(112,5.5,10),
(113,8.8,10),(114,5.0,10),
(115,9.1,10),(116,5.5,10),
(117,8.9,10),(118,5.0,10),
(119,9.2,10),(120,5.5,10),
(121,8.7,10),(122,5.0,10),
(123,9.0,10),(124,5.5,10),
(125,8.9,10),(126,5.0,10),
(127,9.3,10),(128,5.5,10),
(129,8.8,10),(130,5.0,10),
(131,9.2,10),(132,5.5,10),
(133,8.7,10),(134,5.0,10),
(135,9.1,10),(136,5.5,10),
(137,8.9,10),(138,5.0,10),
(139,9.4,10),(140,5.5,10),
(141,8.8,10),(142,5.0,10),
(143,9.0,10),(144,5.5,10),
(145,8.9,10),(146,5.0,10),
(147,9.2,10),(148,5.5,10),
(149,8.7,10),(150,5.0,10),
(151,9.3,10),(152,5.5,10),
(153,8.8,10),(154,5.0,10),
(155,9.1,10),(156,5.5,10),
(157,8.9,10),(158,5.0,10),
(159,9.2,10),(160,5.5,10),
(161,8.7,10),(162,5.0,10),
(163,9.0,10),(164,5.5,10),
(165,8.9,10),(166,5.0,10),
(167,9.3,10),(168,5.5,10),
(169,8.8,10),(170,5.0,10),
(171,9.2,10),(172,5.5,10),
(173,8.7,10),(174,5.0,10),
(175,9.1,10),(176,5.5,10),
(177,8.9,10),(178,5.0,10),
(179,9.4,10),(180,5.5,10),
(181,8.8,10),(182,5.0,10),
(183,9.0,10),(184,5.5,10),
(185,8.9,10),(186,5.0,10),
(187,9.2,10),(188,5.5,10),
(189,8.7,10),(190,5.0,10),
(191,9.3,10),(192,5.5,10),
(193,8.8,10),(194,5.0,10),
(195,9.1,10),(196,5.5,10);

INSERT INTO review_votes (review_id, is_positive) VALUES
(1,true),(2,false),
(3,true),(4,false),
(5,true),(6,false),
(7,true),(8,false),
(9,true),(10,false),
(11,true),(12,false),
(13,true),(14,false),
(15,true),(16,false),
(17,true),(18,false),
(19,true),(20,false),
(21,true),(22,false),
(23,true),(24,false),
(25,true),(26,false),
(27,true),(28,false),
(29,true),(30,false),
(31,true),(32,false),
(33,true),(34,false),
(35,true),(36,false),
(37,true),(38,false),
(39,true),(40,false),
(41,true),(42,false),
(43,true),(44,false),
(45,true),(46,false),
(47,true),(48,false),
(49,true),(50,false),
(51,true),(52,false),
(53,true),(54,false),
(55,true),(56,false),
(57,true),(58,false),
(59,true),(60,false),
(61,true),(62,false),
(63,true),(64,false),
(65,true),(66,false),
(67,true),(68,false),
(69,true),(70,false),
(71,true),(72,false),
(73,true),(74,false),
(75,true),(76,false),
(77,true),(78,false),
(79,true),(80,false),
(81,true),(82,false),
(83,true),(84,false),
(85,true),(86,false),
(87,true),(88,false),
(89,true),(90,false),
(91,true),(92,false),
(93,true),(94,false),
(95,true),(96,false),
(97,true),(98,false),
(99,true),(100,false),
(101,true),(102,false),
(103,true),(104,false),
(105,true),(106,false),
(107,true),(108,false),
(109,true),(110,false),
(111,true),(112,false),
(113,true),(114,false),
(115,true),(116,false),
(117,true),(118,false),
(119,true),(120,false),
(121,true),(122,false),
(123,true),(124,false),
(125,true),(126,false),
(127,true),(128,false),
(129,true),(130,false),
(131,true),(132,false),
(133,true),(134,false),
(135,true),(136,false),
(137,true),(138,false),
(139,true),(140,false),
(141,true),(142,false),
(143,true),(144,false),
(145,true),(146,false),
(147,true),(148,false),
(149,true),(150,false),
(151,true),(152,false),
(153,true),(154,false),
(155,true),(156,false),
(157,true),(158,false),
(159,true),(160,false),
(161,true),(162,false),
(163,true),(164,false),
(165,true),(166,false),
(167,true),(168,false),
(169,true),(170,false),
(171,true),(172,false),
(173,true),(174,false),
(175,true),(176,false),
(177,true),(178,false),
(179,true),(180,false),
(181,true),(182,false),
(183,true),(184,false),
(185,true),(186,false),
(187,true),(188,false),
(189,true),(190,false),
(191,true),(192,false),
(193,true),(194,false),
(195,true),(196,false);

INSERT INTO feature_release (feature_id, release_date, country) VALUES
(1,'1972-03-15','USA'),
(2,'1974-12-20','USA'),
(3,'2008-07-24','USA'),
(4,'1994-10-14','USA'),
(5,'1994-07-06','USA'),
(6,'2010-07-16','USA'),
(7,'1999-10-15','USA'),
(8,'1999-03-31','USA'),
(9,'2003-05-15','USA'),
(10,'2003-11-05','USA'),
(11,'2014-11-07','USA'),
(12,'2000-05-05','USA'),
(13,'1997-12-19','USA'),
(14,'2009-12-18','USA'),
(15,'2022-12-16','USA'),
(16,'1994-09-23','USA'),
(17,'1993-12-15','USA'),
(18,'1991-02-14','USA'),
(19,'1998-07-24','USA'),
(20,'1993-06-11','USA'),
(21,'1997-05-23','USA'),
(22,'2015-06-12','USA'),
(23,'1977-05-25','USA'),
(24,'1980-05-21','USA'),
(25,'1983-05-25','USA'),
(26,'2015-12-18','USA'),
(27,'2017-12-15','USA'),
(28,'2019-12-20','USA'),
(29,'2012-05-04','USA'),
(30,'2015-05-01','USA'),
(31,'2018-04-27','USA'),
(32,'2019-04-26','USA'),
(33,'2008-05-02','USA'),
(34,'2010-05-07','USA'),
(35,'2013-05-03','USA'),
(36,'2011-07-22','USA'),
(37,'2014-04-04','USA'),
(38,'2016-05-06','USA'),
(39,'2011-05-06','USA'),
(40,'2017-11-03','USA'),
(41,'2018-02-16','USA'),
(42,'2016-11-04','USA'),
(43,'2014-08-01','USA'),
(44,'2017-05-05','USA'),
(45,'2017-07-07','USA'),
(46,'2019-07-02','USA'),
(47,'2021-12-17','USA'),
(48,'1994-06-24','USA'),
(49,'2013-11-27','USA'),
(50,'2019-11-22','USA'),
(51,'1995-11-22','USA'),
(52,'1999-11-24','USA'),
(53,'2010-06-18','USA'),
(54,'2019-06-21','USA'),
(55,'2003-05-30','USA'),
(56,'2016-06-17','USA'),
(57,'2001-05-18','USA'),
(58,'2004-05-19','USA'),
(59,'2007-05-18','USA'),
(60,'2010-05-21','USA'),
(61,'2001-11-16','UK'),
(62,'2002-11-15','UK'),
(63,'2004-06-04','UK'),
(64,'2005-11-18','UK'),
(65,'2007-07-11','UK'),
(66,'2009-07-15','UK'),
(67,'2010-11-19','UK'),
(68,'2011-07-15','UK'),
(69,'2001-12-19','New Zealand'),
(70,'2002-12-18','New Zealand'),
(71,'2003-12-17','New Zealand'),
(72,'2012-12-14','New Zealand'),
(73,'2013-12-13','New Zealand'),
(74,'2014-12-17','New Zealand'),
(75,'2013-07-19','USA'),
(76,'2016-06-10','USA'),
(77,'2014-10-03','USA'),
(78,'2017-08-11','USA'),
(79,'2017-09-08','USA'),
(80,'2019-09-06','USA'),
(81,'2019-10-04','USA'),
(82,'2022-03-04','USA'),
(83,'2005-06-15','USA'),
(84,'2012-07-20','USA'),
(85,'2016-02-12','USA'),
(86,'2018-05-18','USA'),
(87,'2017-03-03','USA'),
(88,'2000-07-14','USA'),
(89,'2003-05-02','USA'),
(90,'2014-05-23','USA'),
(91,'2010-10-01','USA'),
(92,'2014-10-10','USA'),
(93,'2016-12-09','USA'),
(94,'2019-05-30','South Korea'),
(95,'2013-12-25','USA'),
(96,'2012-12-25','USA'),
(97,'2019-07-26','USA'),
(98, '2015-05-15', 'Australia');

INSERT INTO actors (name, gender, ethnicity) VALUES
('Marlon Brando','male','white'),
('Al Pacino','male','white'),
('Christian Bale','male','white'),
('John Travolta','male','white'),
('Tom Hanks','male','white'),
('Leonardo DiCaprio','male','white'),
('Brad Pitt','male','white'),
('Keanu Reeves','male','white'),
('Laurence Fishburne','male','black'),
('Hugo Weaving','male','white'),
('Matthew McConaughey','male','white'),
('Russell Crowe','male','white'),
('Kate Winslet','female','white'),
('Sam Worthington','male','white'),
('Cliff Curtis','male','white'),
('Tim Robbins','male','white'),
('Liam Neeson','male','white'),
('Jodie Foster','female','white'),
('Matt Damon','male','white'),
('Sam Neill','male','white'),
('Jeff Goldblum','male','white'),
('Chris Pratt','male','white'),
('Mark Hamill','male','white'),
('Harrison Ford','male','white'),
('Carrie Fisher','female','white'),
('Daisy Ridley','female','white'),
('Adam Driver','male','white'),
('John Boyega','male','black'),
('Robert Downey Jr.','male','white'),
('Scarlett Johansson','female','white'),
('Chris Evans','male','white'),
('Chris Hemsworth','male','white'),
('Mark Ruffalo','male','white'),
('Jeremy Renner','male','white'),
('Don Cheadle','male','black'),
('Sebastian Stan','male','white'),
('Anthony Mackie','male','black'),
('Paul Bettany','male','white'),
('Tom Hiddleston','male','white'),
('Tessa Thompson','female','black'),
('Chadwick Boseman','male','black'),
('Benedict Cumberbatch','male','white'),
('Vin Diesel','male','white'),
('Zoe Saldana','female','black'),
('Tom Holland','male','white'),
('Zendaya','female','black'),
('Jacob Batalon','male','asian'),
('Matthew Broderick','male','white'),
('Idina Menzel','female','white'),
('Kristen Bell','female','white'),
('Tim Allen','male','white'),
('Joan Cusack','female','white'),
('Michael Keaton','male','white'),
('Tony Hale','male','white'),
('Albert Brooks','male','white'),
('Ellen DeGeneres','female','white'),
('Mike Myers','male','white'),
('Eddie Murphy','male','black'),
('Cameron Diaz','female','white'),
('Antonio Banderas','male','latino'),
('Daniel Radcliffe','male','white'),
('Emma Watson','female','white'),
('Rupert Grint','male','white'),
('Gary Oldman','male','white'),
('Ralph Fiennes','male','white'),
('Alan Rickman','male','white'),
('Helena Bonham Carter','female','white'),
('Maggie Smith','female','white'),
('Elijah Wood','male','white'),
('Karl Urban','male','white'),
('Viggo Mortensen','male','white'),
('Martin Freeman','male','white'),
('Richard Armitage','male','white'),
('Luke Evans','male','white'),
('Vera Farmiga','female','white'),
('Patrick Wilson','male','white'),
('Annabelle Wallis','female','white'),
('Stephanie Sigman','female','latino'),
('Bill Skarsgård','male','white'),
('James McAvoy','male','white'),
('Joaquin Phoenix','male','latino'),
('Robert Pattinson','male','white'),
('Michael Caine','male','white'),
('Tom Hardy','male','white'),
('Ryan Reynolds','male','white'),
('Josh Brolin','male','white'),
('Hugh Jackman','male','white'),
('Famke Janssen','female','white'),
('Patrick Stewart','male','white'),
('Ian McKellen','male','white'),
('Jesse Eisenberg','male','white'),
('Miles Teller','male','white'),
('Emma Stone','female','white'),
('Song Kang-ho','male','asian'),
('Jonah Hill','male','white'),
('Jamie Foxx','male','black'),
('Margot Robbie','female','white'),
('Nicholas Hoult','male','white');

INSERT INTO feature_actors (feature_id, actor_id, role) VALUES
(1,1,'mafia patriarch'),
(2,2,'crime family heir'),
(3,3,'batman vigilante'),
(4,4,'hitman philosopher'),
(5,5,'man with extraordinary life story'),
(6,6,'dream infiltration specialist'),
(7,7,'underground fighter'),
(8,8,'cyberpunk hacker neo'),
(9,9,'resistance hero neo'),
(10,10,'machine war savior'),
(11,11,'space explorer and father'),
(12,12,'roman general turned gladiator'),
(13,13,'aristocratic survivor'),
(14,14,'alien world marine'),
(15,15,'tonowari'),
(16,16,'wrongfully imprisoned banker'),
(17,17,'holocaust rescuer'),
(18,18,'fbi trainee investigator'),
(19,19,'wwii captain'),
(20,20,'dinosaur park scientist'),
(21,21,'chaotic mathematician'),
(22,22,'dinosaur trainer'),
(23,23,'jedi farmboy'),
(24,24,'smuggler pilot'),
(25,25,'jedi knight'),
(26,26,'scavenger turned hero'),
(27,27,'conflicted dark side warrior'),
(28,28,'resistance leader'),
(29,29,'genius billionaire iron man'),
(30,30,'black widow'),
(31,31,'captain america'),
(32,32,'thor'),
(33,33,'hulk'),
(34,34,'hawkeye'),
(35,35,'rhodes'),
(36,36,'bucky'),
(37,37,'falcon'),
(38,38,'vision'),
(39,39,'god of thunder'),
(40,40,'cosmic gladiator thor'),
(41,41,'wakandan king hero'),
(42,42,'mystic sorcerer'),
(43,43,'space outlaw leader'),
(44,44,'galactic team leader'),
(45,45,'teenage spider hero'),
(46,46,'mj'),
(47,47,'spider man best friend'),
(48,48,'lion king heir simba'),
(49,49,'ice queen elsa'),
(50,50,'anna'),
(51,51,'buzz lightyear'),
(52,52,'jessie'),
(53,53,'ken'),
(54,54,'forky'),
(55,55,'clownfish father'),
(56,56,'dory'),
(57,57,'ogre hero shrek'),
(58,58,'donkey'),
(59,59,'princess fiona'),
(60,60,'puss in boots'),
(61,61,'young wizard harry potter'),
(62,62,'hermoine granger'),
(63,63,'ron weasley'),
(64,64,'sirius black'),
(65,65,'voldermort'),
(66,66,'severus snape'),
(67,67,'belatrix lestrange'),
(68,68,'minerva'),
(69,69,'baggins'),
(70,70,'eomer'),
(71,71,'argorn'),
(72,72,'bibo baggins'),
(73,73,'thorin oakenshield'),
(74,74,'bard'),
(75,75,'paranormal investigator'),
(76,76,'demon case investigator'),
(77,77,'haunted doll victim'),
(78,78,'doll origin survivor'),
(79,79,'shape shifting clown'),
(80,80,'bill denbrough'),
(81,81,'joker'),
(82,82,'dark knight detective'),
(83,83,'alfred penyworth'),
(84,84,'bane'),
(85,85,'wade wilson'),
(86,86,'cable'),
(87,87,'wolverine'),
(88,88,'jean grey'),
(89,89,'prof charles'),
(90,90,'magneto'),
(91,91,'mark zuckerburg'),
(92,92,'andrew neiman'),
(93,93,'aspiring actress'),
(94,94,'father'),
(95,95,'donnie azoff'),
(96,96,'django'),
(97,97,'sharon tate'),
(98,98,'nux');

create view hitmeter as
select
    r.feature_id,
    count(*) as total_reviews,
    sum(case when r.sentiment = 'positive' then 1 else 0 end) as positive_reviews,
    (sum(case when r.sentiment = 'positive' then 1 else 0 end) * 100.0 / count(*)) as score
from reviews r
group by r.feature_id;
select * from hitmeter;

create view certified_fresh as
select
    f.feature_id,
    f.title,
    h.score
from features f, hitmeter h
where f.feature_id = h.feature_id
and h.score >= 60;
select * from certified_fresh;

create view feature_average_score as
select
    r.feature_id,
    avg(s.score_value) as avg_score
from reviews r, scores s
where r.review_id = s.review_id
group by r.feature_id;
select * from feature_average_score;

create view top_critic_stat as
select
    r.feature_id,
    count(*) as total_reviews,
    sum(case when c.is_top_critic = true then 1 else 0 end) as top_reviews
from reviews r, critics c
where r.critic_id = c.critic_id
group by r.feature_id;
select * from top_critic_stat;

create view weighted_score as
select
    r.feature_id,
    sum(ci.weight * s.score_value) / sum(ci.weight) as weighted_avg
from reviews r, scores s, critic_influence ci
where r.review_id = s.review_id
and r.critic_id = ci.critic_id
group by r.feature_id;
select * from weighted_score;

create view trending_films as
select
    f.title,
    count(*) as recent_reviews
from features f
join reviews r on f.feature_id = r.feature_id
where r.review_date >= date_sub(
    (select max(review_date) from reviews),
    interval 30 day
)
group by f.feature_id, f.title
order by recent_reviews desc;
select * from trending_films;

drop trigger if exists validate_score;

delimiter $$

create trigger validate_score
before insert on scores
for each row
begin
    if new.score_value is null 
       or new.max_score is null
       or new.score_value < 0 
       or new.score_value > new.max_score then
        signal sqlstate '45000'
        set message_text = 'Score must be between 0 and max_score';
    end if;
end$$

delimiter ;

drop trigger if exists prevent_duplicate_review;

delimiter $$

create trigger prevent_duplicate_review
before insert on reviews
for each row
begin
    if exists (
        select 1
        from reviews r
        where r.feature_id = new.feature_id
        and r.critic_id = new.critic_id
        limit 1
    ) then
        signal sqlstate '45000'
        set message_text = 'Duplicate review not allowed for same critic and film';
    end if;
end$$

delimiter ;

alter table reviews
add constraint unique_review unique (feature_id, critic_id);

drop trigger if exists validate_review_date;

delimiter $$

create trigger validate_review_date
before insert on reviews
for each row
begin
    declare rel_date date;

    select fr.release_date
    into rel_date
    from feature_release fr
    where fr.feature_id = new.feature_id
    limit 1;

    if rel_date is not null and new.review_date < rel_date then
        signal sqlstate '45000'
        set message_text = 'Review cannot be before film release date';
    end if;
end$$

delimiter ;

delimiter $$

create function get_hitmeter_score(p_feature_id int)
returns decimal(5,2)
deterministic
begin
    declare result decimal(5,2);

    select
        (sum(case when sentiment = 'positive' then 1 else 0 end) * 100.0 / nullif(count(*), 0))
    into result
    from reviews
    where feature_id = p_feature_id;

    return result;
end$$

delimiter ;

select
    f.title,
    h.score
from features f, hitmeter h
where f.feature_id = h.feature_id
order by h.score desc;

select
    f.title,
    avg(s.score_value) as avg_score
from features f, reviews r, scores s
where f.feature_id = r.feature_id
and r.review_id = s.review_id
group by f.feature_id, f.title
order by avg_score desc;

select
    c.name,
    count(*) as total_reviews
from critics c, reviews r
where c.critic_id = r.critic_id
group by c.critic_id, c.name
order by total_reviews desc;

select
    f.title,
    count(*) as total_reviews,
    sum(case when c.is_top_critic = true then 1 else 0 end) as top_reviews
from features f, reviews r, critics c
where f.feature_id = r.feature_id
and r.critic_id = c.critic_id
group by f.feature_id, f.title
order by top_reviews desc;

create index idx_reviews_feature on reviews(feature_id);
create index idx_reviews_critic on reviews(critic_id);
create index idx_reviews_date on reviews(review_date);
create index idx_scores_review on scores(review_id);
create index idx_feature_critic on reviews(feature_id, critic_id);