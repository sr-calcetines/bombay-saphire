<?php
//Muestra los pueblos de la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$sql = "SELECT p.id, p.nombre, p.descripcion, ST_AsText(p.coordenadas) as coordenadas, p.imagenes, a.nombre as actividad_nombre, a.descripcion as actividad_descripcion, a.imagen as actividad_imagen 
        FROM pueblos p
        LEFT JOIN actividades a ON p.id = a.pueblo_id";
$result = $conn->query($sql);

$pueblos = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $pueblo_id = $row["id"];
        if (!isset($pueblos[$pueblo_id])) {
            $pueblos[$pueblo_id] = [
                "nombre" => $row["nombre"],
                "descripcion" => $row["descripcion"],
                "coordenadas" => $row["coordenadas"],
                "imagenes" => json_decode($row["imagenes"]),
                "actividades" => []
            ];
        }
        $pueblos[$pueblo_id]["actividades"][] = [
            "nombre" => $row["actividad_nombre"],
            "descripcion" => $row["actividad_descripcion"],
            "imagen" => $row["actividad_imagen"]
        ];
    }
}

$conn->close();

header('Content-Type: application/json');
echo json_encode(array_values($pueblos));
?>
