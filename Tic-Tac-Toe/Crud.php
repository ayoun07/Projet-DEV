<?php
    require_once 'Connect.php';

    use PDOException;

    class Crud extends Connect
    {

        public function Select($table)
        {
            try {
                $sql = "SELECT * FROM $table";
                $res = $this->_dbh->query($sql);
                echo '<pre>';
                print_r($res->fetchAll(\PDO::FETCH_ASSOC));
                echo '<pre>';
            } catch (PDOException $e) {
                echo 'ERREUR :' . $e->getMessage();
            }
        }

        public function Insert($table, $data)
        {
            $keys = "`" . implode("`,`", array_keys($data)) . "`";
            $vals = ":" . implode(",:", array_keys($data));

            try {
                $sql = "INSERT INTO $table ($keys) VALUES ($vals)";
                $res = $this->_dbh->prepare($sql);

                foreach ($data as $key => &$value) {
                    $res->bindParam(':' . $key, $value);
                }
                $res->execute();
                echo 'insertion reussi';
            } catch (PDOException $e) {
                echo 'ERREUR : ' . $e->getMessage();
                echo $sql;
            }
        }


        public function Delete($table, $data)
        {
            $keys = array_keys($data);

            try {
                $sql = "DELETE FROM $table WHERE " . implode(' = :', $keys) . " = :$keys[0]";
                $res = $this->_dbh->prepare($sql);

                foreach ($data as $key => &$value) {
                    $res->bindParam(":$key", $value);
                }

                $res->execute();
                echo 'suppression réussie';
            } catch (PDOException $e) {
                echo 'ERREUR : ' . $e->getMessage();
            }
        }

        public function Update($table, $record, $filter)
        {
            $setclause = '';

            foreach ($record as $key => $value) {
                $setclause .= "`$key` = :$key, ";
            }

            $setclause = rtrim($setclause, ', ');

            $k = "`" . implode("`,`", array_keys($filter)) . "`";
            $v = ":" . implode("=:", array_keys($filter));

            try {
                $sql = "UPDATE $table SET $setclause WHERE $k=$v";

                $res = $this->_dbh->prepare($sql);

                foreach ($record as $key => &$value) {
                    $res->bindParam(":$key", $value);
                }

                foreach ($filter as $key => &$value) {
                    $res->bindParam(":$key", $value);
                }

                $res->execute();
                echo 'modification réussie';
            } catch (PDOException $e) {
                echo 'ERREUR : ' . $e->getMessage();
            }
        }
    }
