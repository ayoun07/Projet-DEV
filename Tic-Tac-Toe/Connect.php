<?php  
  require_once('Credentials.php');

    //use PDOException;

    class Connect{
        public $_dbname;
        public $_dbh;

        function __construct($_credentials)
        {
            $this->_dbname = $_credentials->dbname;
            $this->_dbh = Connect::PDO($_credentials, $this->_dbname);
        }

        public static function PDO($_credentials, $_dbname){
            if (isset($_dbname)){
                $dsn = "mysql:host=$_credentials->servername;dbname=$_credentials->dbname";
            }
            else {
                $dsn = "mysql:host=$_credentials->servername";
            }
            try {
                $dbh = new \PDO($dsn, $_credentials->username, $_credentials->password);
                $dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                echo 'ERREUR :' . $e->getMessage();
            }
            return $dbh;
        }
    }