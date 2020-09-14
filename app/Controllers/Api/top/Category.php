<?php 
namespace App\Controllers\Api\top;
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
        // $this->protect = new Auth();
        $this->categorymodel = new Category_Model();
    }
    public function index()
    {
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
    public function create()
    {
        $validation =  \Config\Services::validation();
        $nama_categori      = $this->request->getPost('nama_categori');
        $status_categori      = $this->request->getPost('status_categori');
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
        } else {
            $categoryExists = $this->categorymodel->CategoryExists($nama_categori,$id_category = null);
            if(!$categoryExists){

                $resultData = $this->categorymodel->insertCategory($data);
            
                if($resultData ==true){
                    $output = [
                        'status'    => true,
                        "data"      => [],
                        "message"   => "Success save data"
                        
                    ];
                    return $this->respond($output, 200);
                    } else {
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
    public function update($id_category=null)
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
    public function delete($id_category = NULL)
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