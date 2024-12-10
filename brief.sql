--rida sersif
--ridasersif1@gmail.com


--Création de la base de données
CREATE DATABASE streaming_service;

USE streaming_service;

--création de la table 'subscriptions'

CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,  
    subscription_type ENUM('Basic','Premium') NOT NULL,         
    price DECIMAL(10, 2) NOT NULL,                
);
--création de la table 'users'

CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATE NOT NULL,
    subscription_id INT ,
    FOREIGN KEY( subscription_id) REFERENCES subscriptions(subscription_id)
    );
--création de la table 'movie'
    CREATE TABLE movie(
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    duration INT NOT NULL,
    rating VARCHAR(10)   
)
--création de la table 'watch_history'
CREATE TABLE watch_history (
    watch_history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,  
    movie_id INT,  
    watch_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    completion_percentage INT DEFAULT 0,  
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);
--création de la table 'review'
CREATE TABLE review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating INT NOT NULL,
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);
--insertion des information des subscriptions
INSERT INTO subscriptions (subscription_id, subscription_type, price)
VALUES
(1, 'basic', 10.00),
(2, 'premium', 20.00),
(3, 'basic', 10.00),
(4, 'premium', 20.00),
(5, 'basic', 10.00),
(6, 'premium', 20.00),
(7, 'basic', 10.00),
(8, 'premium', 20.00),
(9, 'basic', 10.00),
(10, 'premium', 20.00),
(11, 'basic', 10.00),
(12, 'premium', 20.00),
(13, 'basic', 10.00),
(14, 'premium', 20.00),
(15, 'basic', 10.00),
(16, 'premium', 20.00),
(17, 'basic', 10.00),
(18, 'premium', 20.00),
(19, 'basic', 10.00),
(20, 'premium', 20.00);


--insertion des information des users
INSERT INTO users (first_name, last_name, email, registration_date, subscription_id)
VALUES
('Ahmed', 'El Amrani', 'ahmed.elamrani@example.com', '2024-12-10', 1),
('Fatima', 'Benslimane', 'fatima.benslimane@example.com', '2024-12-09', 2),
('Youssef', 'Haddad', 'youssef.haddad@example.com', '2024-12-08', 3),
('Aicha', 'El Ghazali', 'aicha.elghazali@example.com', '2024-12-07', 4),
('Moustapha', 'Benjelloun', 'moustapha.benjelloun@example.com', '2024-12-06', 5),
('Khadija', 'Zeroual', 'khadija.zeroual@example.com', '2024-12-05', 6),
('Rachid', 'El Yousfi', 'rachid.elyousfi@example.com', '2024-12-04', 7),
('Mariam', 'El Fassi', 'mariam.elfassi@example.com', '2024-12-03', 8),
('Hakim', 'Chouaki', 'hakim.chouaki@example.com', '2024-12-02', 9),
('Nour', 'Belkadi', 'nour.belkadi@example.com', '2024-12-01', 10),
('Bilal', 'Amrani', 'bilal.amrani@example.com', '2024-11-30', 11),
('Samira', 'El Hariri', 'samira.elhariri@example.com', '2024-11-29', 12),
('Yassine', 'Mouline', 'yassine.mouline@example.com', '2024-11-28', 13),
('Laila', 'Jouhari', 'laila.jouhari@example.com', '2024-11-27', 14),
('Imane', 'Slaoui', 'imane.slaoui@example.com', '2024-11-26', 15),
('Adil', 'Bouaziz', 'adil.bouaziz@example.com', '2024-11-25', 16),
('Hanan', 'El Makki', 'hanan.elmakki@example.com', '2024-11-24', 17),
('Mustapha', 'Chafik', 'mustapha.chafik@example.com', '2024-11-23', 18),
('Sofia', 'Azzouzi', 'sofia.azzouzi@example.com', '2024-11-22', 19),
('Mohamed', 'El Amraoui', 'mohamed.elamraoui@example.com', '2024-11-21', 20);

--insertion des information des movie
INSERT INTO movie (title, genre, release_year, duration, rating)
VALUES
('Al-Massira', 'Drama', 2023, 120, '7.5'),
('Hassan wa Morocc', 'Comedy', 2022, 105, '8.0'),
('The Lost Treasure', 'Adventure', 2021, 130, '7.2'),
('Tariq', 'Action', 2020, 115, '7.8'),
('Under the Moroccan Sky', 'Romance', 2019, 110, '8.5'),
('The Call of the Desert', 'Drama', 2018, 125, '7.0'),
('Mysteries of Tangier', 'Thriller', 2017, 100, '8.1'),
('Sunset in Marrakech', 'Romance', 2016, 90, '7.9'),
('Echoes of the Past', 'Historical', 2015, 135, '8.3'),
('The Magician', 'Fantasy', 2014, 115, '7.4'),
('A Day in Fez', 'Documentary', 2013, 85, '7.6'),
('Sahara Nights', 'Drama', 2012, 110, '7.7'),
('The Return of the Lost', 'Action', 2011, 125, '8.2'),
('Atlas Dreams', 'Adventure', 2010, 120, '7.3'),
('Stories from Casablanca', 'Comedy', 2009, 95, '7.8'),
('The Dance of the City', 'Musical', 2008, 100, '8.0'),
('Nomad Spirit', 'Drama', 2007, 115, '8.1'),
('Sunrise in Rabat', 'Romance', 2006, 105, '7.5'),
('The Golden Dunes', 'Action', 2005, 130, '7.4'),
('Whispers of the Wind', 'Thriller', 2004, 90, '7.0');

--insertion des information des review
INSERT INTO review (user_id, movie_id, rating, review_text, review_date)
VALUES
(1, 4, 8, 'Un film captivant avec des performances exceptionnelles.', '2024-12-10'),
(2, 7, 7, 'Une comédie amusante qui apporte beaucoup de rires.', '2024-12-09'),
(3, 3, 9, 'Une aventure palpitante avec des effets visuels impressionnants.', '2024-12-08'),
(4, 10, 6, 'Un thriller intéressant mais qui aurait pu avoir un meilleur scénario.', '2024-12-07'),
(5, 5, 8, 'Une belle histoire avec de très bonnes performances.', '2024-12-06'),
(6, 2, 7, 'Une histoire émotive avec des paysages magnifiques.', '2024-12-05'),
(7, 15, 9, 'Un film plein de suspense et de mystère.', '2024-12-04'),
(8, 1, 8, 'Un mélange parfait de romance et de paysages naturels.', '2024-12-03'),
(9, 8, 7, 'Un film historique avec des moments de tension intéressants.', '2024-12-02'),
(10, 12, 8, 'Une belle œuvre de science-fiction avec un impact visuel fort.', '2024-12-01'),
(11, 14, 6, 'Un documentaire instructif mais parfois un peu ennuyeux.', '2024-11-30'),
(12, 6, 7, 'Un récit captivant avec de bonnes touches dramatiques.', '2024-11-29'),
(13, 11, 8, 'Des effets spéciaux impressionnants et une bonne ambiance.', '2024-11-28'),
(14, 17, 7, 'Un film divertissant avec de l\'action et du suspense.', '2024-11-27'),
(15, 20, 9, 'Un film de fantasy époustouflant.', '2024-11-26'),
(16, 13, 5, 'Un film qui manque de connexion entre les scènes.', '2024-11-25'),
(17, 18, 8, 'Des numéros de danse magnifiques et une histoire engageante.', '2024-11-24'),
(18, 16, 7, 'Une combinaison de drame et de comédie qui aborde des thèmes importants.', '2024-11-23'),
(19, 19, 9, 'Une aventure passionnante à travers la médina de Marrakech.', '2024-11-22'),
(20, 9, 6, 'Un thriller intrigant mais qui a une fin surprenante.', '2024-11-21'),
(1, 2, 7, 'Un film agréable mais pas assez captivant.', '2024-11-20'),
(2, 5, 8, 'Une performance époustouflante de l\'acteur principal.', '2024-11-19'),
(3, 6, 6, 'Des effets visuels intéressants mais le scénario est faible.', '2024-11-18'),
(4, 7, 9, 'Un chef-d\'œuvre de la comédie moderne.', '2024-11-17'),
(5, 8, 7, 'Un drame captivant avec des personnages attachants.', '2024-11-16'),
(6, 9, 8, 'Des paysages magnifiques et une histoire intrigante.', '2024-11-15'),
(7, 10, 5, 'Un film qui a du potentiel mais qui n\'est pas à la hauteur.', '2024-11-14'),
(8, 11, 9, 'Un documentaire qui mérite d\'être vu.', '2024-11-13'),
(9, 12, 6, 'L\'histoire est bonne mais le rythme est lent.', '2024-11-12'),
(10, 13, 7, 'Une excellente bande sonore et de belles scènes.', '2024-11-11'),
(11, 14, 8, 'Une intrigue captivante mais qui manque de profondeur.', '2024-11-10'),
(12, 15, 9, 'Un film de science-fiction incroyable et bien réalisé.', '2024-11-09'),
(13, 16, 5, 'Un film qui manque de cohérence et de suspense.', '2024-11-08'),
(14, 17, 7, 'Une aventure qui m\'a tenu en haleine jusqu\'à la fin.', '2024-11-07'),
(15, 18, 6, 'Un bon film avec des moments drôles mais trop prévisible.', '2024-11-06'),
(16, 19, 8, 'Un film qui raconte une belle histoire de découverte.', '2024-11-05'),
(17, 20, 9, 'Une production de qualité supérieure.', '2024-11-04'),
(18, 1, 7, 'Un film agréable à regarder mais qui manque de quelque chose.', '2024-11-03'),
(19, 2, 6, 'Des scènes captivantes, mais le scénario est bancal.', '2024-11-02'),
(20, 3, 8, 'Une belle performance de l\'acteur principal.', '2024-11-01'),
(1, 4, 7, 'Un film captivant mais qui aurait pu être meilleur.', '2024-10-31'),
(2, 5, 5, 'Un film qui manque d\'originalité.', '2024-10-30'),
(3, 6, 9, 'Un excellent film avec des effets spéciaux à couper le souffle.', '2024-10-29'),
(4, 7, 8, 'Un bon mélange de suspense et de comédie.', '2024-10-28'),
(5, 8, 6, 'Un film avec des personnages bien développés.', '2024-10-27'),
(6, 9, 9, 'Un chef-d\'œuvre visuel et narratif.', '2024-10-26'),
(7, 10, 5, 'Une intrigue qui ne m\'a pas convaincu.', '2024-10-25'),
(8, 11, 8, 'Un documentaire fascinant sur la culture.', '2024-10-24'),
(9, 12, 7, 'Un bon film avec quelques longueurs.', '2024-10-23');

--insertion des information des watchhistory
INSERT INTO watch_history (user_id, movie_id, watch_date, completion_percentage)
VALUES
(1, 4, '2024-12-10', 100),
(2, 7, '2024-12-09', 80),
(3, 3, '2024-12-08', 90),
(4, 10, '2024-12-07', 70),
(5, 5, '2024-12-06', 100),
(6, 2, '2024-12-05', 60),
(7, 15, '2024-12-04', 85),
(8, 1, '2024-12-03', 95),
(9, 8, '2024-12-02', 50),
(10, 12, '2024-12-01', 100),
(11, 14, '2024-11-30', 75),
(12, 6, '2024-11-29', 80),
(13, 11, '2024-11-28', 65),
(14, 17, '2024-11-27', 90),
(15, 20, '2024-11-26', 100),
(16, 13, '2024-11-25', 70),
(17, 18, '2024-11-24', 60),
(18, 16, '2024-11-23', 85),
(19, 19, '2024-11-22', 100),
(20, 9, '2024-11-21', 90),
(1, 2, '2024-11-20', 50),
(2, 5, '2024-11-19', 100),
(3, 6, '2024-11-18', 65),
(4, 7, '2024-11-17', 80),
(5, 8, '2024-11-16', 95),
(6, 9, '2024-11-15', 70),
(7, 10, '2024-11-14', 60),
(8, 11, '2024-11-13', 100),
(9, 12, '2024-11-12', 90),
(10, 13, '2024-11-11', 85),
(11, 14, '2024-11-10', 75),
(12, 15, '2024-11-09', 95),
(13, 16, '2024-11-08', 50),
(14, 17, '2024-11-07', 100),
(15, 18, '2024-11-06', 80),
(16, 19, '2024-11-05', 70),
(17, 20, '2024-11-04', 90),
(18, 1, '2024-11-03', 85),
(19, 2, '2024-11-02', 65),
(20, 3, '2024-11-01', 100),
(1, 4, '2024-10-31', 50),
(2, 5, '2024-10-30', 90),
(3, 6, '2024-10-29', 80),
(4, 7, '2024-10-28', 100),
(5, 8, '2024-10-27', 95),
(6, 9, '2024-10-26', 70),
(7, 10, '2024-10-25', 60),
(8, 11, '2024-10-24', 85);
--*********************************************************
--1):Insérer un film : Ajouter un nouveau film intitulé Data Science Adventures dans le genre "Documentary".
INSERT INTO movie(title,genre,release_year,duration,rating)
VALUES ('Data Science Adventures','Documentary',2024,320,'10.00');

--2):Rechercher des films : Lister tous les films du genre "Comedy" sortis après 2020
SELECT * FROM movie WHERE genre='Comedy' and release_year>=2020;
--3):Mise à jour des abonnements : Passer tous les utilisateurs de "Basic" à "Premium"..
UPDATE subscriptions
SET
subscription_type='premium'
WHERE subscription_type='basic';
SELECT * FROM subscriptions;

--4):Afficher les abonnements : Joindre les utilisateurs à leurs types d'abonnements
SELECT  users.first_name, users.last_name, subscriptions.subscription_type
FROM users
JOIN subscriptions ON users.subscription_id = subscriptions.subscription_id;


--5):Filtrer les visionnages : Trouver tous les utilisateurs ayant terminé de regarder un film.
SELECT users.first_name ,users.last_name, watch_history.completion_percentage
FROM users JOIN  watch_history
ON users.user_id=watch_history.user_id WHERE completion_percentage=100;

--6)Trier et limiter : Afficher les 5 films les plus longs, triés par durée.
SELECT * FROM movie  ORDER BY duration DESC LIMIT 5;


--7):Agrégation : Calculer le pourcentage moyen de complétion pour chaque film.

SELECT watch_history.movie_id, users.first_name, users.last_name, AVG(watch_history.completion_percentage) AS percentage
FROM watch_history JOIN users
ON users.user_id = watch_history.user_id
GROUP BY watch_history.movie_id, users.first_name, users.last_name;