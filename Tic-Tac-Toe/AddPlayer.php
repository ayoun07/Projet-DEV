<?php
require_once 'Credentials.php';
require_once 'Connect.php';
require_once 'Crud.php';

// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Vérifier si le champ 'username' est défini
    if (isset($_POST["name"]) && !empty($_POST["name"])) {
        // Récupérer le nom d'utilisateur depuis le formulaire
        $username = $_POST["name"];

        // Créer une instance de la classe Credentials pour obtenir les informations de connexion
        $_object = new Credentials();
        $object1 = $_object->getCredentials("id_mdp_dev.json");

        // Créer une instance de la classe Connect pour établir une connexion à la base de données
        $object = new Connect($object1);
        $object->PDO($object1, $object1->dbname);

        // Créer une instance de la classe Crud pour effectuer des opérations CRUD
        $ob = new Crud($object1);

        // Définir les données du joueur à ajouter
        $new_insert = array(
            "username" => $username
            // Ajouter d'autres champs si nécessaire
        );

        // Appeler la méthode Insert pour ajouter un joueur
        $result = $ob->Insert("player", $new_insert);

        if ($result) {
            echo "Joueur ajouté avec succès.";
        } else {
            echo "Erreur lors de l'ajout du joueur.";
        }
    } else {
        echo "Le champ 'username' est requis.";
    }
}
