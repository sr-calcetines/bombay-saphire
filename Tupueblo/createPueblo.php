<?php
//Inserta pueblos en la base de datos
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['error' => 'Conexión fallida: ' . $conn->connect_error]));
}

// Obtener datos del cliente
$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    die(json_encode(['error' => 'Datos no válidos']));
}

$nombre = $data['nombre'] ?? null;
$descripcion = $data['descripcion'] ?? null;
$coordenadas = $data['coordenadas'] ?? null;
$imagenes = $data['imagenes'] ?? null;

// Verificar que todos los campos están presentes
if (!$nombre || !$coordenadas || !$imagenes) {
    die(json_encode(['error' => 'Faltan datos en la solicitud', 'data_received' => $data]));
}

// Escapar datos para evitar inyecciones SQL
$nombre = $conn->real_escape_string($nombre);
$descripcion = $conn->real_escape_string($descripcion);
$imagenes = $conn->real_escape_string($imagenes);

// Convertir coordenadas a formato POINT
$coordenadas = $conn->real_escape_string($coordenadas);
$coordenadas = "ST_GeomFromText('POINT($coordenadas)')";

// Consulta SQL para insertar un nuevo pueblo
$sql = "INSERT INTO pueblos (nombre, descripcion, coordenadas, imagenes) VALUES ('$nombre', '$descripcion', $coordenadas, '$imagenes')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(['success' => 'Pueblo creado con éxito']);
} else {
    echo json_encode(['error' => 'Error: ' . $conn->error]);
}

$conn->close();
?>