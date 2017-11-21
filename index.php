<?php

if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');
}
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
  	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
      	header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
  	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
      	header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
}
header("Content-Type: application/json; charset=UTF-8");

$idEstacion = $_GET["idEstacion"];
$horario = $_GET["horario"];

$data = array( "esperaActual" => 5.0, "esperaPromedio" => 7.0, "fila" => 5, "ciclas" => 10 );

echo json_encode( $data );
?>
