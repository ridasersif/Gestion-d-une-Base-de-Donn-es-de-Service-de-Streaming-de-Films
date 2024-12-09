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

   
    


