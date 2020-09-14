<?php namespace App\Controllers\km;
// Panggil JWT
use \Firebase\JWT\JWT;
// panggil class Auht
use App\Controllers\Auth;
use App\Models\km\Auth_model;
// panggil restful api codeigniter 4
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
class User extends ResourceController
{
    public function __construct()
    {
        $this->protect = new Auth();
        $this->usermodel = new Auth_model();
    }
    public function index()
    {
        // $token = $this->ValidateToken();
        // if($token){
        //     try {
        //         $decoded = JWT::decode($token, $this->TokenKey(), array('HS256'));
        //         // Access is granted. Add code of the operation here 
        //         if($decoded){
                    $id_hakakses      = $this->request->getGet('id_hakakses');
                    $errorMessage ="";
                    $resultData = $this->usermodel->getuser($id_hakakses);
            
                    if($resultData !=null){
                        $output = [
                            'status'    => 200,
                            'isSuccess' => true,
                            'message'   => "Berhasil load data",
                            "data"      => $resultData
                        ];
                        return $this->respond($output, 200);
                    } else {
                        $output = [
                            'status'    => 404,
                            'isSuccess' => false,
                            'message'   => "Data tidak tersedia",
                            "data"      => $resultData
                        ];
                        return $this->respond($output, 404);
                    }
                    
        //         }
        //     } catch (\Exception $e){
        //         $output = [
        //             'message' => 'Access denied',
        //             "error" => $e->getMessage()
        //         ];
        //         return $this->respond($output, 401);
        //     }
        // }
    }
// Generate token key
    public function ValidateToken(){
        $authHeaders = $this->request->getServer('HTTP_AUTHORIZATION');
        $token = explode(" ", $authHeaders);
        return $token[1];
    }
    public function TokenKey(){
        return  $this->protect->privateKey();
    }
}