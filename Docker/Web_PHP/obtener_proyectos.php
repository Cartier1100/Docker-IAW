<?php
// Parámetros de conexión para Docker
$servername = getenv('MYSQL_HOST') ?: 'mysql_db'; // Nombre del contenedor MySQL en docker-compose
$username = getenv('MYSQL_USER') ?: 'root';
$password = getenv('MYSQL_PASSWORD') ?: 'root';
$dbname = getenv('MYSQL_DATABASE') ?: 'pwpersonal';

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Consulta para obtener los proyectos
$sql = "SELECT * FROM projects";
$result = $conn->query($sql);

$proyectos = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $proyectos[] = $row;
    }
}

// Cerrar conexión
$conn->close();

// Retornar los datos como JSON
header('Content-Type: application/json');
echo json_encode($proyectos);
?>
