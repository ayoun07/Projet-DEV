# Tic-Tac-Toe Multiplayer

Bienvenue dans le projet Tic-Tac-Toe Multijoueur! Ce projet permet à deux joueurs de jouer à Tic-Tac-Toe en temps réel via une interface web.

## Table des matières

- [Aperçu](#aperçu)
- [Fonctionnalités](#fonctionnalités)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Structure du Projet](#structure-du-projet)
- [Base de Données](#base-de-données)

## Aperçu

Tic-Tac-Toe Multijoueur est un jeu simple et amusant où deux joueurs peuvent s'affronter en temps réel. L'interface utilisateur est intuitive et le jeu est facile à installer et à exécuter localement.

## Fonctionnalités

- Jeu Tic-Tac-Toe en temps réel pour deux joueurs
- Affichage du nom des joueurs et du tour actuel
- Système de gestion des joueurs (ajout, suppression, visualisation)
- Historique des parties et des mouvements stocké dans une base de données

## Prérequis

- Node.js
- MySQL
- PHP
- Composer

## Installation

1. Clonez le dépôt GitHub :
   ```bash
   git clone https://github.com/votre-utilisateur/tic-tac-toe-multiplayer.git

# Utilisation
1. Ouvrez votre navigateur et accédez à [http://localhost:3000](http://localhost:3000).
2. Entrez votre nom et recherchez un autre joueur.
3. Jouez au jeu Tic-Tac-Toe en temps réel!

# Structure du Projet
- **index.html**: Fichier HTML principal avec le code du jeu.
- **index.js**: Serveur Node.js utilisant Socket.IO pour la communication en temps réel.
- **BDD.sql**: Script SQL pour configurer la base de données.
- **connect.php**: Script PHP pour connecter à la base de données.
- **crud.php**: Script PHP pour les opérations CRUD sur la base de données.
- **styles.css**: Feuille de styles CSS (intégrée dans index.html).

# Base de Données
Le projet utilise MySQL pour stocker les informations sur les joueurs et les parties. La structure de la base de données est définie dans `BDD.sql` et comprend les tables suivantes :

- **Player**: Stocke les informations sur les joueurs.
- **Game**: Stocke les informations sur les parties.
- **Move**: Stocke les mouvements des joueurs pendant les parties.

