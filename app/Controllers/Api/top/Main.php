<?php 
namespace App\Controllers\Api\top;
use App\Models\top\Auth_model;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

class Main extends ResourceController
{
    public function __construct()
    {
        $this->protect = new Auth();
        $this->usermodel = new Auth_model();
    }
    public function index()
    {
        
        $id_hakakses      = $this->request->getGet('id_hakakses');
        $errorMessage ="";
        $resultData = $this->usermodel->getuser($id_hakakses);
        
        if($resultData !=null){
            $output = [
                'draw'    => 1,
                'recordsTotal' => 7,
                'recordsFiltered'   => 7,
                "data"      =>   $resultData
                
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
    }
// Generate token key
    // public function ValidateToken(){
    //     $authHeaders = $this->request->getServer('HTTP_AUTHORIZATION');
    //     $token = explode(" ", $authHeaders);
    //     return $token[1];
    // }
    // public function TokenKey(){
    //     return  $this->protect->privateKey();
    // }
}