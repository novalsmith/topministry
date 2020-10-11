<?php 
namespace App\Controllers\Api\top;
use App\Models\top\Lookup_Model;
use \Firebase\JWT\JWT;
use App\Controllers\Api\top\Auth;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

class Lookup extends ResourceController
{
    public function __construct()
    {
        $jwt = new \Firebase\JWT\JWT;
        $jwt::$leeway = 60;
        $this->protect = new Account();
        $this->lookup = new Lookup_Model();
    }
    private function validateToken(){

        $authHeader = $this->request->getServer('HTTP_AUTHORIZATION');
        $arr = explode(" ", $authHeader);

        return $arr[1];
    }
    public function index()
    {
        $token = $this->validateToken();
        if($token)
        {
            try 
            {
                $decoded = JWT::decode($token, $this->protect->privateKey() , array('HS256'));
                // Access is granted. Add code of the operation here 
                if($decoded)
                {
                    $idlookup      = $this->request->getGet('idlookup');
                    $resultData = $this->lookup->getLookup($idlookup);
                    $headers = [
                        "#","Value","Kategori","Status",""
                    ];
                    if($resultData !=null){
                        $output = [
                            'headers'    => $headers,
                            "data"      =>  $resultData,
                            "message"   =>  "Succes load data"
                            
                        ];
                        return $this->respond($output, 200);
                    } else {
                        $output = [
                            'headers'    => $headers,
                            "data"      =>  [],
                            "message"   =>  "No data display"
                        ];
                        return $this->respond($output, 200);
                    }
                }

            }catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];
         
                return $this->respond($output, 401);
            }
        }
    }
    public function category()
    {
        $token = $this->validateToken();
        if($token)
        {
            try 
            {
                $decoded = JWT::decode($token, $this->protect->privateKey() , array('HS256'));
                // Access is granted. Add code of the operation here 
                if($decoded)
                {
                    $resultData = $this->lookup->getLookupCategory();
                    $output = [
                        "data"      =>  $resultData,
                        "message"   =>  "Succes load data"
                    ];
                    
                    return $this->respond($output, 200);
                }

            }catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];
         
                return $this->respond($output, 401);
            }
        }
    }
    public function create()
    {
        $token = $this->validateToken();
        if($token)
        {
            try 
            {
                $decoded = JWT::decode($token, $this->protect->privateKey() , array('HS256'));
                // Access is granted. Add code of the operation here 
                if($decoded)
                {

                    helper(['form', 'url']);
                    $validation     =  \Config\Services::validation();
                    $value          = $this->request->getPost('value');
                    $keterangan     = $this->request->getPost('description');
                    $category       = $this->request->getPost('id_categori');
                    $status         = $this->request->getPost('status');
                    $code         = $this->request->getPost('code');

                    $data = [
                        'idlookupCategory' => $category,
                        'valueCategory' => $value,
                        'description' => $keterangan,
                        'status' => $status,
                        'code' => $code,
                        'createddate' =>  date('Y m d H i s')
                    ];
                    
                    if($validation->run($data, 'lookup') == FALSE){
                        $response = [
                            'status' => 500,
                            'error' => true,
                            'data' => [],
                            'message' => $validation->getErrors()
                        ];
                        return $this->respond($response, 500);
                    } else 
                    {
                        $Exists = $this->lookup->LookupExists($value, $idlookup = null);
                        if(!$Exists){

                            $resultData = $this->lookup->insertLookup($data);
                            if($resultData ==true)
                            {
                                $output = [
                                    'status'    => true,
                                    "data"      => $data,
                                    "message"   => "Success save data"
                                    
                                ];
                                return $this->respond($output, 200);
                            } 
                            else 
                            {
                                $output = [
                                    'status'    => false,
                                    "data"      => [],
                                    "message"   => "Fail data is not save"
                                ];
                                return $this->respond($output, 401);
                            }
                        }else{
                            $output = [
                                'status'    => false,
                                "data"      => [],
                                "message"   => "Lookup sudah ada."
                            ];
                            return $this->respond($output, 200);
                        }
                    }
                }
            }catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];

                return $this->respond($output, 401);
            }
        }
    }
    public function update($idlookup=null)
    {
        $token = $this->validateToken();
        if($token)
        {
            try 
            {
                $decoded = JWT::decode($token, $this->protect->privateKey() , array('HS256'));
                // Access is granted. Add code of the operation here 
                if($decoded)
                {
                    $validation =  \Config\Services::validation();
                    $value          = $this->request->getPost('value');
                    $keterangan     = $this->request->getPost('description');
                    $category       = $this->request->getPost('id_categori');
                    $status         = $this->request->getPost('status');
            
                    $data = [
                        'idlookupCategory' => $category,
                        'valueCategory' => $value,
                        'description' => $keterangan,
                        'status' => $status,
                        'createddate' =>  date('Y m d H i s')
                    ];
            
                    if($validation->run($data, 'lookup') == FALSE)
                    {
                        $response = [
                            'status' => 500,
                            'error' => true,
                            'data' => $validation->getErrors(),
                        ];
                        return $this->respond($response, 500);

                    } else 
                    {
                        $Exists = $this->lookup->LookupExists($value,$idlookup);
                        if(!$Exists)
                        {
                            $resultData = $this->lookup->updateLookup($data,$idlookup);
                            if($resultData ==true){
                                
                                $output = [
                                    'status'    => $resultData,
                                    "data"      => $data,
                                    "message"   => "Success update data"
                                ];
                                return $this->respond($output, 200);
                            } else {
                                $output = [
                                    'status'    => $resultData,
                                    "data"      => [],
                                    "message"   => "Fail data is not update"
                                ];
                                return $this->respond($output, 401);
                            }
                        }else
                        {
                            $output = [
                                'status'    => false,
                                "data"      => [],
                                "message"   => "Lookup sudah ada."
                            ];
                            return $this->respond($output, 200);
                        }
                    }
                }
            }catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];

                return $this->respond($output, 401);
            }
        }
       
    }
    public function delete($idlookup = NULL)
    {
        $token = $this->validateToken();
        if($token)
        {
            try 
            {
                $decoded = JWT::decode($token, $this->protect->privateKey() , array('HS256'));
                // Access is granted. Add code of the operation here 
                if($decoded)
                {
                    if($this->lookup->deleteLookup($idlookup)){
                        $code = 200;
                        $msg = 'Lookup berhasil terhapus';
                        $response = [
                            'status' => $code,
                            'error' => false,
                            'data' => [],
                            'message' =>$msg
                        ];
                        
                    } else 
                    {
                        $code = 401;
                        $msg = 'Not Found';
                        $response = [
                            'status' => $code,
                            'error' => true,
                            'data' => [],
                            'message' =>$msg 
                        ];
                    }
                    return $this->respond($response, $code);
                }
            }catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];

                return $this->respond($output, 401);
            }
        }
    }
}