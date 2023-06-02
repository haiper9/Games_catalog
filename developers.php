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
    // Получение выбранной отрасли из параметра URL
    $DeveloperID = $_GET['DeveloperID'];
    // Получение списка организаций для выбранной отрасли
    $query = "SELECT g.Name ,g.Descriptrion , d.Name as 'DevName' FROM Games
	AS g INNER JOIN Developers AS d ON g.DeveloperID=d.ID
	WHERE d.ID=:DeveloperID;";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':DeveloperID', $DeveloperID, PDO::PARAM_INT);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($result as $row) {
        echo "<h1>" . $row['GenreName'] . "</h1>";
        break;
    }
    echo "<table>";
    echo "<tr><th>Название</th><th>Разработчик</th></tr>";
    foreach ($result as $row) {
        echo "<tr>";
        echo "<td>	" . $row['Name'] . "</td>";
        echo "<td>  " . $row['DevName'] . "</td>";
		
        echo "</tr>";
    }
} catch (PDOException $e) {
    die("Ошибка выполнения запроса: " . $e->getMessage());
}
?>
</body>
</html>
