<?php
//Devuelve pueblos de la base de datos
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$id = $_GET['id'];

$sql = "SELECT * FROM pueblos WHERE id=$id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo json_encode($result->fetch_assoc());
} else {
    echo json_encode([]);
}

$conn->close();
?>
