<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Каталог игр</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
<ul class="ul2">
<li class="li2"><a class="a2" href="index.php">Главная</a></li>
<li class="li2"><a class="a2" href="genere.html">Жанры</a></li>
<li class="li2"><a class="a2" href="developer.html">Разработчики</a></li>
</ul>
<script src="script.js"></script>
</head>
<body class="bg">
<?php
global $db;
require_once 'db.php';

try {
    $query = "SELECT Games.Name ,Games.Descriptrion , gg.Name as 'GenreName' FROM Games
	AS Games INNER JOIN GamesGenre AS gg ON Games.GenreID=gg.GenreID";
    $result = $db->query($query);

    echo "<h1>Все игры</h1>";
    echo "<table>";
    echo "<tr><th>Название</th><th>Жанр</th></tr>";
    foreach ($result as $row) {
        echo "<tr>";
        echo "<td>" . $row['Name'] . "</td>";
		echo "<td>" . $row['GenreName'] . "</td>";
        echo "</tr>";
    }
} catch (PDOException $e) {
    die("Ошибка выполнения запроса: " . $e->getMessage());
}
?>
</body>
</html>
