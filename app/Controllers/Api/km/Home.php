<?php namespace App\Controllers;
// Panggil JWT
use \Firebase\JWT\JWT;
// panggil class Auht
use App\Controllers\Auth;
// panggil restful api codeigniter 4
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
class Home extends ResourceController
{
    public function __construct()
    {
        $this->protect = new Auth();
    }
    public function index()
    {
        $token = $this->ValidateToken();
        if($token){
            try {
                $decoded = JWT::decode($token, $this->TokenKey(), array('HS256'));
                // Access is granted. Add code of the operation here 
                if($decoded){
                    // response true
                    $output = [
                        'message' => 'Access granted'
                    ];
                    return $this->respond($output, 200);
                }
            } catch (\Exception $e){
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];
                return $this->respond($output, 401);
            }
        }
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