DROP DATABASE IF EXISTS `TTT`;

CREATE DATABASE `TTT`;
USE `TTT`;

CREATE TABLE `player`(
   `id_player` INT,
   `pseudo` VARCHAR(50) NOT NULL,
   PRIMARY KEY(`id_player`)
);

CREATE TABLE `file`(
   `id_player` INT,
   `id_jeu` INT,
   `heure_arrivé` DATETIME,
   PRIMARY KEY(`id_player`, `id_jeu`)
);

CREATE TABLE `jeu`(
   `id_jeu` INT,
   `date_heure_debut` DATETIME,
   `date_heure_fin` DATETIME,
   PRIMARY KEY(`id_jeu`)
);

CREATE TABLE `Messagerie`(
   `id_message` INT,
   `date_heure_message` DATETIME,
   PRIMARY KEY(`id_message`)
);

CREATE TABLE `envoyer`(
   `id_player` INT,
   `id_message` INT,
   PRIMARY KEY(`id_player`, `id_message`),
   FOREIGN KEY(`id_player`) REFERENCES `player`(`id_player`),
   FOREIGN KEY(`id_message`) REFERENCES `Messagerie`(`id_message`)
);

CREATE TABLE `entrer`(
   `id_player` INT,
   `id_player_1` INT,
   `id_jeu` INT,
   PRIMARY KEY(`id_player`, `id_player_1`, `id_jeu`),
   FOREIGN KEY(`id_player`) REFERENCES `player`(`id_player`),
   FOREIGN KEY(`id_player_1`, `id_jeu`) REFERENCES file(`id_player`, `id_jeu`)
);

CREATE TABLE `renvoyer`(
   `id_player` INT,
   `id_jeu` INT,
   `id_jeu_1` INT,
   PRIMARY KEY(`id_player`, `id_jeu`, `id_jeu_1`),
   FOREIGN KEY(`id_player`, `id_jeu`) REFERENCES file(`id_player`, `id_jeu`),
   FOREIGN KEY(`id_jeu_1`) REFERENCES `jeu`(`id_jeu`)
);
