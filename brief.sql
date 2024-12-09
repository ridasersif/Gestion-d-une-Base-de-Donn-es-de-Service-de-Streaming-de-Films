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



