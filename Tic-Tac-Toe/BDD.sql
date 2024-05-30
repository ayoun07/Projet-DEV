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

-- Insertions aléatoires dans la table Player
INSERT INTO `Player` (`username`) VALUES
    ('Adam'),
    ('Daniel'),
    ('Farid'),
    ('Celine'),
    ('Chris');

-- Insertions aléatoires dans la table Game
INSERT INTO `Game` (`player1_id`, `player2_id`, `start_time`, `end_time`, `winner_id`) VALUES
    (1, 2, NOW(), NOW(), 1),
    (3, 4, NOW(), NOW(), 4),
    (2, 5, NOW(), NOW(), NULL),
    (1, 3, NOW(), NOW(), 3),
    (4, 5, NOW(), NOW(), 5);

-- Insertions aléatoires dans la table Move
INSERT INTO `Move` (`game_id`, `player_id`, `move_number`, `position_x`, `position_y`, `timestamp`) VALUES
    (1, 1, 1, 0, 0, NOW()),
    (1, 2, 2, 0, 1, NOW()),
    (1, 1, 3, 1, 0, NOW()),
    (1, 2, 4, 1, 1, NOW()),
    (1, 1, 5, 2, 0, NOW()),

    (2, 3, 1, 0, 0, NOW()),
    (2, 4, 2, 0, 1, NOW()),
    (2, 3, 3, 1, 0, NOW()),
    (2, 4, 4, 1, 1, NOW()),
    (2, 3, 5, 2, 0, NOW()),

    (3, 2, 1, 0, 0, NOW()),
    (3, 5, 2, 0, 1, NOW()),
    (3, 2, 3, 1, 0, NOW()),
    (3, 5, 4, 1, 1, NOW()),
    (3, 2, 5, 2, 0, NOW()),

    (4, 1, 1, 0, 0, NOW()),
    (4, 3, 2, 0, 1, NOW()),
    (4, 1, 3, 1, 0, NOW()),
    (4, 3, 4, 1, 1, NOW()),
    (4, 1, 5, 2, 0, NOW()),

    (5, 4, 1, 0, 0, NOW()),
    (5, 5, 2, 0, 1, NOW()),
    (5, 4, 3, 1, 0, NOW()),
    (5, 5, 4, 1, 1, NOW()),
    (5, 4, 5, 2, 0, NOW());

