<?php
require_once 'conexion/conexion.php';
require_once 'respuestas.class.php';

class auth extends conexion{

    private $token = "";

    private $usuarioid = "";
    
    public function login($json){
      
        $_respustas = new respuestas;
        $datos = json_decode($json,true);
        if(!isset($datos['usuario']) || !isset($datos["password"])){ 
            //error con los campos
            return $_respustas->error_400();
        }else{
            //todo esta bien 
            $usuario = $datos['usuario'];
            $password = $datos['password'];
            $password = parent::encriptar($password);
            $datos = $this->obtenerDatosUsuario($usuario);
            if($datos){
                //verificar si la contraseña es igual
                    if($password == $datos[0]['Password']){
                            if($datos[0]['Estado'] == "Activo"){
                                //crear el token
                                $verificar  = $this->insertarToken($datos[0]['UsuarioId'], $datos[0]['Usuario']); 
                                if($verificar){
                                        // si se guardo 
                                        $result = $_respustas->response;
                                        $result["result"] = array(
                                            "token" => $verificar,
                                            "usuarioId" => $datos[0]['UsuarioId'],
                                        );
                                        return $result;
                                }else{
                                        //error al guardar
                                        return $_respustas->error_500("Error interno, No hemos podido guardar");
                                }
                            }else{
                                //el usuario esta inactivo
                                return $_respustas->error_200("El usuario esta inactivo");
                            }
                    }else{
                        //la contraseña no es igual
                        return $_respustas->error_200("El password es invalido");
                    }
            }else{
                //no existe el usuario
                return $_respustas->error_200("El usuaro $usuario  no existe ");
            }
        }
    }

    public function put($json, $token){
        $_respuestas = new respuestas;
        $datos = json_decode($json,true);        

        $this->token = $token;
        $arrayToken =   $this->buscarToken();

        if($arrayToken){
            if(!isset($datos['usuarioId'])){
                return $_respuestas->error_400();
            }else{
                $usuarioId = $datos['usuarioId'];
                $verificar  = $this->inactivarToken($usuarioId);

                if($verificar){
                    // si se guardo
                    $result = $_respuestas->response;
                    $result["result"] = array(
                        "token" => "Token Caducado"
                    );
                    return $result;
                }else{
                        //error al guardar
                        return $_respuestas->error_500("Error interno, No hemos podido guardar");
                }
            }
        }else{
            return $_respuestas->error_401("El Token que envio es invalido o ha caducado");
        }
    }

    private function obtenerDatosUsuario($correo){
        $query = "SELECT UsuarioId,Usuario,Password,Estado FROM usuarios WHERE Usuario = '$correo'";
        $datos = parent::obtenerDatos($query);  
        if(isset($datos[0]["UsuarioId"])){
            return $datos;
        }else{
            return 0;
        }
    }


    private function insertarToken($usuarioid, $correo){
        $val = true;
        //$token = bin2hex(openssl_random_pseudo_bytes(16,$val));
        $token = parent::jwt($usuarioid, $correo);
        $date = date("Y-m-d H:i");
        $estado = "Activo";
        $query = "INSERT INTO usuarios_token (UsuarioId,Token,Estado,Fecha)VALUES('$usuarioid','$token','$estado','$date')";
        $verifica = parent::nonQuery($query);
        if($verifica){
            return $token;
        }else{
            return 0;
        }
    }

    private function inactivarToken($usuarioid){
        $val = true;
        
        $query = "UPDATE usuarios_token SET Estado = 'Inactivo' WHERE UsuarioId = ". $usuarioid;
        $verifica = parent::nonQuery($query);
        if($verifica){
            return 1;
        }else{
            return 0;
        }
    }

    private function buscarToken(){
        $query = "SELECT  TokenId,UsuarioId,Estado from usuarios_token WHERE Token = '" . $this->token . "' AND Estado = 'Activo'";
        $resp = parent::obtenerDatos($query);
        if($resp){
            return $resp;
        }else{
            return 0;
        }
    }


}

?>