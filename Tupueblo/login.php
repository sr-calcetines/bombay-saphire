<?php
//Verificar credenciales ya creadas
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener el contenido del cuerpo de la solicitud
$postData = file_get_contents("php://input");
$request = json_decode($postData, true);

$usuario = $request['usuario'];
$contrasena = $request['contrasena'];

$sql = $conn->prepare("SELECT * FROM usuarios WHERE nombre_usuario = ?");
$sql->bind_param("s", $usuario);
$sql->execute();
$result = $sql->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if ($row['contrasena'] === $contrasena) {
        echo "success";
    } else {
        echo "failure";
    }
} else {
    echo "failure";
}

$conn->close();
?>
