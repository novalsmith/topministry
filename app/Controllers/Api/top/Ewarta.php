<?php 
namespace App\Controllers\Api\top;
use App\Models\top\Ewarta_Model;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

class Ewarta extends ResourceController
{
    public function __construct()
    {
        $this->ewarta = new Ewarta_Model();
    }
    public function index()
    {
        $idewarta      = $this->request->getGet('idewarta');
        $resultData = $this->ewarta->getEwarta($idewarta);
        $headers = [
            "#","Judul","Waktu Terbitan","Category","Status",""
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
    public function create()
    {
        helper(['form', 'url']);
        $validation     =  \Config\Services::validation();
        $judul          = $this->request->getPost('title');
        $keterangan     = $this->request->getPost('description');
        $category       = $this->request->getPost('id_categori');
        $status         = $this->request->getPost('status');
        $waktu            = $this->request->getPost('timepublish');
        $avatarPoster   = $this->request->getFile('poster');
        $avatarWarta    = $this->request->getFile('filewarta');

        if( $avatarPoster !=null && $avatarWarta !=null){
            // poster
            $splitPoster = explode(".",$avatarPoster->getName());
            $arrPoster = array($splitPoster[0].'_top'.date('YmdHis'),$splitPoster[1]);
            $setFilenamePoster = implode(".",$arrPoster);

            // warta
            $splitWarta = explode(".",$avatarWarta->getName());
            $arrWarta = array($splitWarta[0].'_top'.date('YmdHis'),$splitWarta[1]);
            $setFilenameWarta = implode(".",$arrWarta);


            $data = [
                'title' => $judul,
                'description' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'timepublish' => $waktu,
                'createdate' =>  date('Y m d H i s'),
                'poster' =>   $setFilenamePoster,
                'filewarta' =>   $setFilenameWarta
            ];
        }else{
            
            $data = [
                'title' => $judul,
                'description' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'timepublish' => $waktu,
                'createdate' =>  date('Y m d H i s')
            ];
        }    
        if($validation->run($data, 'warta') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => [],
                'message' => $validation->getErrors()
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->ewarta->WartaExists($judul, $idewarta = null);
            if(!$Exists){

                $resultData = $this->ewarta->insertWarta($data);
            
                if($resultData ==true){
                    if($avatarPoster != null || $avatarWarta != null){
                    $avatarPoster->move(ROOTPATH . 'public/top/assets/img/Admin/warta',  $setFilenamePoster);
                    $avatarWarta->move(ROOTPATH . 'public/top/assets/img/Admin/warta',  $setFilenameWarta);
                    }
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
                    "message"   => "Warta sudah ada."
                ];
                return $this->respond($output, 200);
            }
        }
    }
    public function update($idewarta=null)
    {
        $validation =  \Config\Services::validation();
        $judul          = $this->request->getPost('title');
        $keterangan     = $this->request->getPost('description');
        $category       = $this->request->getPost('id_categori');
        $status         = $this->request->getPost('status');
        $waktu          = $this->request->getPost('timepublish');
        $avatarPoster   = $this->request->getFile('poster');
        $avatarWarta    = $this->request->getFile('filewarta');
        $oldfileuploadPoster = $this->request->getPost('oldfileuploadPoster');  
        $oldfileuploadWarta  = $this->request->getPost('oldfileuploadWarta');  

        if( $avatarPoster !=null || $avatarWarta !=null){
            // poster
            if($avatarPoster !=null)
            {
                $splitPoster = explode(".",$avatarPoster->getName());
                $arrPoster = array($splitPoster[0].'_top'.date('YmdHis'),$splitPoster[1]);
                $setFilenamePoster = implode(".",$arrPoster);
            }

            // warta
            if($avatarWarta !=null)
            {
                $splitWarta = explode(".",$avatarWarta->getName());
                $arrWarta = array($splitWarta[0].'_top'.date('YmdHis'),$splitWarta[1]);
                $setFilenameWarta = implode(".",$arrWarta);
            }
 
            $data = [
                'title' => $judul,
                'description' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'timepublish' => $waktu,
                'createdate' =>  date('Y m d H i s'),
                'poster' =>   $setFilenamePoster,
                'filewarta' =>   $setFilenameWarta
            ];
        }else{
            
            $data = [
                'title' => $judul,
                'description' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'timepublish' => $waktu,
                'createdate' =>  date('Y m d H i s')
            ];
        }    
    
        if($validation->run($data, 'warta') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->ewarta->WartaExists($judul,$idewarta);
            if(!$Exists)
            {
                $resultData = $this->ewarta->updateWarta($data,$idewarta);
                if($resultData ==true){
                    if($avatarPoster != null )
                    {
                        $avatarPoster->move(ROOTPATH . 'public/top/assets/img/Admin/warta',  $setFilenamePoster);
                     
                    }
                    
                    if($avatarWarta != null)
                    {
                        $avatarWarta->move(ROOTPATH . 'public/top/assets/img/Admin/warta',  $setFilenameWarta);
                    }
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
                    "message"   => "Agenda sudah ada."
                ];
                return $this->respond($output, 200);
            }
        }
    }
    public function delete($idewarta = NULL)
    {
        $oldfileuploadPoster = $this->request->getPost('oldfileuploadPoster');
        $oldfileuploadWarta = $this->request->getPost('oldfileuploadWarta');
        $hapus = $this->ewarta->deleteWarta($idewarta);
        if($hapus){
            $code = 200;
            $msg = 'Deleted warta successfully';
            $response = [
                'status' => $code,
                'error' => false,
                'data' => [],
                'message' =>$msg
            ];
            if($oldfileuploadPoster != null || $oldfileuploadWarta != null)
            {
                unlink(ROOTPATH . 'public/top/assets/img/Admin/warta/'.$oldfileuploadPoster);
                unlink(ROOTPATH . 'public/top/assets/img/Admin/warta/'.$oldfileuploadWarta);
            }
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
}