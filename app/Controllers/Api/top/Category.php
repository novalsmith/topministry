<?php 
namespace App\Controllers\Api\top;
use \Firebase\JWT\JWT;
use App\Controllers\Api\top\Auth;
use App\Models\top\Category_Model;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

class Category extends ResourceController
{
    public function __construct()
    {
        $jwt = new \Firebase\JWT\JWT;
        $jwt::$leeway = 60;
        $this->protect = new Account();
        $this->categorymodel = new Category_Model();
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
                    // response true
                    $id_category      = $this->request->getGet('id_category');
                    $isAll      = $this->request->getGet('isAll');
                    $errorMessage ="";
                    $resultData = $this->categorymodel->getCategory($id_category,$isAll);
                    $headers = [
                        "#","Category","Status",""
                    ];
                    if($resultData !=null){
                        $output = [
                            'headers'    => $headers,
                            "data"      =>  $resultData,
                            "message"   =>  $errorMessage
                            
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
            } catch (\Exception $e)
            {
 
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];
         
                return $this->respond($output, 401);
            }
        }else
        {
            $output = [
                'message' => 'Access denied',
                "error" => "true",
                "tokenStatus" => $token
            ];
     
            return $this->respond($output, 401);
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
                    $validation     = \Config\Services::validation();
                    $categoryName   = $this->request->getPost('categoryName');
                    $categoryStatus = $this->request->getPost('categoryStatus');
                
                    $data = [
                        'nama_categori' => $categoryName,
                        'status_categori' => $categoryStatus
                    ];
                
                    if($validation->run($data, 'category') == FALSE)
                    {
                        $response = [
                            'status' => 200,
                            'error' => true,
                            'data' => $data,
                            'message' => $validation->getErrors(),
                        ];
                        return $this->respond($response, 500);
                    } else 
                    {
                        $categoryExists = $this->categorymodel->CategoryExists($categoryName,$id_category = null);
                        if(!$categoryExists){
            
                            $resultData = $this->categorymodel->insertCategory($data);
                        
                            if($resultData ==true)
                            {
                                $output = [
                                    'status'    => true,
                                    "data"      => [],
                                    "message"   => "Success save data"
                                    
                                ];
                                return $this->respond($output, 200);
                            } else 
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
                                "message"   => "Kategori sudah ada."
                            ];
                            return $this->respond($output, 200);
                        }
                    }
                }
            }
            catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];
        
                return $this->respond($output, 401);
            }
        }
        else
        {
            $output = [
                'message' => 'Access denied',
                "error" => "true",
                "tokenStatus" => $token
            ];
    
            return $this->respond($output, 401);
        }
    }
    public function update($id_category=null)
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
                    $GetData      = $this->request->getRawInput();
                    $nama_categori = $GetData["nama_categori"];
                    $status_categori = $GetData["status_categori"];

                    $data = [
                        'nama_categori' => $nama_categori,
                        'status_categori' => $status_categori
                    ];
                
                    if($validation->run($data, 'category') == FALSE){
                        $response = [
                            'status' => 200,
                            'error' => true,
                            'data' => [],
                            'message' => $validation->getErrors(),
                        ];
                        return $this->respond($response, 200);
                    } else 
                    {
                        $categoryExists = $this->categorymodel->CategoryExists($nama_categori,$id_category);
                        if(!$categoryExists)
                        {

                        $resultData = $this->categorymodel->updateCategory($data,$id_category);
                        if($resultData ==true){
                            $output = [
                                'status'    => $resultData,
                                "data"      => $data,
                                "message"   => "Success save data"
                                
                            ];
                            return $this->respond($output, 200);
                        } else {
                            $output = [
                                'status'    => $resultData,
                                "data"      => [],
                                "message"   => "Fail data is not save"
                            ];
                            return $this->respond($output, 401);
                            }
                        }else{
                            $output = [
                                'status'    => false,
                                "data"      => [],
                                "message"   => "Kategori sudah ada."
                            ];
                            return $this->respond($output, 200);
                        }
                    }
                }
            }
            catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];
        
                return $this->respond($output, 401);
            }
        }
        else
        {
            $output = [
                'message' => 'Access denied',
                "error" => "true",
                "tokenStatus" => $token
            ];
    
            return $this->respond($output, 401);
        }
    }
    public function delete($id_category = NULL)
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
                    
                    $hapus = $this->categorymodel->deleteCategory($id_category);
                    if($hapus){
                        $code = 200;
                        $msg = 'Deleted category successfully';
                        $response = [
                            'status' => $code,
                            'error' => false,
                            'data' => [],
                            'message' =>$msg
                        ];
                    } else {
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
            }
            catch (\Exception $e)
            {
                $output = [
                    'message' => 'Access denied',
                    "error" => $e->getMessage()
                ];
        
                return $this->respond($output, 401);
            }
        }
        else
        {
            $output = [
                'message' => 'Access denied',
                "error" => "true",
                "tokenStatus" => $token
            ];
    
            return $this->respond($output, 401);
        }
    }
}