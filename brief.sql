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

--insertion des information des users
INSERT INTO users(first_name, last_name, email, registration_date, subscription_id)
VALUES 
    ('Ali', 'Alam', 'ali.alam@example.com', '2024-09-01', 1),
    ('Zahra', 'Brahim', 'zahra.brahim@example.com', '2023-07-15', 2),
    ('Omar', 'Jabari', 'omar.jabari@example.com', '2023-01-10', NULL),
    ('Fatima', 'Khalil', 'fatima.khalil@example.com', '2022-12-05', 1),
    ('Hassan', 'Tariq', 'hassan.tariq@example.com', '2024-05-20', 2),
    ('Mariam', 'Salah', 'mariam.salah@example.com', '2023-11-25', NULL),
    ('Samir', 'Fathi', 'samir.fathi@example.com', '2024-06-12', 1);
  