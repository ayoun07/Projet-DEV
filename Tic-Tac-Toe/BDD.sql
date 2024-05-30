DROP DATABASE IF EXISTS `ttt`;

CREATE DATABASE `ttt`;
USE `ttt`;

CREATE TABLE `Player` (
    `player_id` INTEGER PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL
);

CREATE TABLE `Game` (
    `game_id` INTEGER PRIMARY KEY,
    `player1_id` INTEGER NOT NULL,
    `player2_id` INTEGER NOT NULL,
    `start_time` TIMESTAMP NOT NULL,
    `end_time` TIMESTAMP,
    `winner_id` INTEGER,
    FOREIGN KEY (`player1_id`) REFERENCES `Player`(`player_id`),
    FOREIGN KEY (`player2_id`) REFERENCES `Player`(`player_id`),
    FOREIGN KEY (`winner_id`) REFERENCES `Player`(`player_id`)
);

CREATE TABLE `Move` (
    `move_id` INTEGER PRIMARY KEY,
    `game_id` INTEGER NOT NULL,
    `player_id` INTEGER NOT NULL,
    `move_number` INTEGER NOT NULL,
    `position_x` INTEGER CHECK (`position_x` BETWEEN 0 AND 2),
    `position_y` INTEGER CHECK (`position_y` BETWEEN 0 AND 2),
    `timestamp` TIMESTAMP NOT NULL,
    FOREIGN KEY (`game_id`) REFERENCES `Game`(`game_id`),
    FOREIGN KEY (`player_id`) REFERENCES `Player`(`player_id`)
);
