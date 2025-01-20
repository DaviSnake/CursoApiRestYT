<?php 
require_once 'clases/auth.class.php';
require_once 'clases/respuestas.class.php';

$_auth = new auth;
$_respuestas = new respuestas;



if($_SERVER['REQUEST_METHOD'] == "POST"){

    //recibir datos
    $postBody = file_get_contents("php://input");

    //enviamos los datos al manejador
    $datosArray = $_auth->login($postBody);

    //delvolvemos una respuesta
    header('Content-Type: application/json');
    if(isset($datosArray["result"]["error_id"])){
        $responseCode = $datosArray["result"]["error_id"];
        http_response_code($responseCode);
    }else{
        http_response_code(200);
    }
    echo json_encode($datosArray);


}else if($_SERVER['REQUEST_METHOD'] == "PUT"){
    //Obtener datos de header
    $headers = getallheaders();
    $cadenaExplode = explode(" ", $headers["Authorization"]);
    $token = $cadenaExplode[1];

    //recibimos los datos enviados
    $postBody = file_get_contents("php://input");

    //enviamos los datos al manejador
    $datosArray = $_auth->put($postBody, $token);

    if(isset($datosArray["result"]["error_id"])){
        $responseCode = $datosArray["result"]["error_id"];
        http_response_code($responseCode);
    }else{
        http_response_code(200);
    }
    echo json_encode($datosArray);

}else{
    header('Content-Type: application/json');
    $datosArray = $_respuestas->error_405();
    echo json_encode($datosArray);

}


?>