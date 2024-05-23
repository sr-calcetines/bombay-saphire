<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['error' => 'Conexión fallida: ' . $conn->connect_error]));
}

$sql = "SELECT * FROM pueblos";
$result = $conn->query($sql);

$pueblos = [];
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $pueblos[] = $row;
    }
} else {
    echo json_encode(['error' => 'Error en la consulta: ' . $conn->error]);
    $conn->close();
    exit();
}

echo json_encode($pueblos);
$conn->close();
?>