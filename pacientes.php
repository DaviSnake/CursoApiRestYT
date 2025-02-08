<?php
require_once 'clases/respuestas.class.php';
require_once 'clases/pacientes.class.php';

$_respuestas = new respuestas;
$_pacientes = new pacientes;


if($_SERVER['REQUEST_METHOD'] == "GET"){

    //Obtener datos de header
    $headers = getallheaders();
    $cadenaExplode = explode(" ", $headers["Authorization"]);
    $token = $cadenaExplode[1];

    if(isset($_GET["page"])){
        $pagina = $_GET["page"];
        $listaPacientes = $_pacientes->listaPacientes($pagina, $token);
        header("Content-Type: application/json");
        echo json_encode($listaPacientes);
        http_response_code(200);
    }else if(isset($_GET['id'])){
        $pacienteid = $_GET['id'];
        $datosPaciente = $_pacientes->obtenerPaciente($pacienteid, $token);
        header("Content-Type: application/json");
        echo json_encode($datosPaciente);
        http_response_code(200);
    }
    
}else if($_SERVER['REQUEST_METHOD'] == "POST"){

    //Obtener datos de header
    $headers = getallheaders();
    $cadenaExplode = explode(" ", $headers["Authorization"]);
    $token = $cadenaExplode[1];

    //recibimos los datos enviados
    $postBody = file_get_contents("php://input");
    //enviamos los datos al manejador
    $datosArray = $_pacientes->post($postBody, $token);
    //delvovemos una respuesta 
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
    //enviamos datos al manejador
    $archivo = fopen("log-txt.txt","w");
    fwrite($archivo, $postBody);
    fclose($archivo);
    $datosArray = $_pacientes->put($postBody, $token);
    //delvovemos una respuesta 
    header('Content-Type: application/json');
    if(isset($datosArray["result"]["error_id"])){
        $responseCode = $datosArray["result"]["error_id"];
        http_response_code($responseCode);
    }else{
        http_response_code(200);
    }
    echo json_encode($datosArray);

}else if($_SERVER['REQUEST_METHOD'] == "DELETE"){

        $headers = getallheaders();

        $cadenaExplode = explode(" ", $headers["Authorization"]);

        $token = $cadenaExplode[1];
        
        //recibimos los datos enviados
        $postBody = file_get_contents("php://input");
        
        
        //enviamos datos al manejador
        $datosArray = $_pacientes->delete($postBody, $token);
        //delvovemos una respuesta 
        header('Content-Type: application/json');
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