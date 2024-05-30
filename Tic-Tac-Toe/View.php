<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des joueurs</title>
</head>

<body>
    <h1>Liste des joueurs</h1>

    <?php
    require_once 'Credentials.php';
    require_once 'Connect.php';
    require_once 'Crud.php';

    // Fonction pour récupérer et afficher les joueurs
    function displayPlayers()
    {
        $_object = new Credentials();
        $object1 = $_object->getCredentials("id_mdp_dev.json");
        $object = new Connect($object1);
        $object->PDO($object1, $object1->dbname);
        $ob = new Crud($object1);
        $players = $ob->Select('player'); // Appel de la méthode Select pour récupérer les joueurs
        echo "<table>";
        echo "<tr><th>ID</th><th>Nom d'utilisateur</th></tr>";
        foreach ($players as $player) {
            echo "<tr>";
            echo "<td>{$player['player_id']}</td>";
            echo "<td>{$player['username']}</td>";
            echo "</tr>";
        }
        echo "</table>";
    }
    // Appel de la fonction pour afficher les joueurs
    displayPlayers();
    ?>

</body>

</html>