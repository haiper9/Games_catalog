<?php
// Подключение к базе данных MySQL
$host = '127.0.0.1';
$dbname = 'o98366n0_sitedb';
$user = 'o98366n0_sitedb';
$password = 'Rfpbvbh2009';

try {
    $db = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Ошибка подключения к базе данных: " . $e->getMessage());
}
