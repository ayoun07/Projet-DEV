<?php

class Credentials
{
    public static function getCredentials($path)
    {
        $filename = $_SERVER["DOCUMENT_ROOT"] . "/";

        return json_decode(file_get_contents($filename . $path));
    }
}
