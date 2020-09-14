<?php 
namespace App\Controllers\Api\top;
use App\Models\top\Video_Model;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

class Video extends ResourceController
{
    public function __construct()
    {
        $this->videomodel = new Video_Model();
    }
    public function index()
    {
        $id_video      = $this->request->getGet('id_video');
        $errorMessage ="";
        $resultData = $this->videomodel->getVideo($id_video);
        $headers = [
            "#","Judul","Category","Status",""
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
        helper(['form', 'url']);
        $validation =  \Config\Services::validation();
        $judul      = $this->request->getPost('judul');
        $keterangan      = $this->request->getPost('keterangan');
        $category      = $this->request->getPost('category');
        $status      = $this->request->getPost('status');
        $url      = $this->request->getPost('url');
        $avatar = $this->request->getFile('fileupload');

        if( $avatar  !=null){
            $split = explode(".",$avatar->getName());
            $arr = array($split[0].'_top'.date('YmdHis'),$split[1]);
            $setFilename = implode(".",$arr);
            $data = [
                'judul' => $judul,
                'keterangan' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'link' => $url,
                'createdate' =>  date('Y m d H i s'),
                'poster' =>   $setFilename,
            ];
        }else{
            
            $data = [
                'judul' => $judul,
                'keterangan' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'link' => $url,
                'createdate' =>  date('Y m d H i s')
            ];
        }    
        if($validation->run($data, 'video') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->videomodel->VideoExists($judul, $url,$id_video = null);
            if(!$Exists){

                $resultData = $this->videomodel->insertVideo($data);
            
                if($resultData ==true){
                    if($avatar != null){
                    $avatar->move(ROOTPATH . 'public/top/assets/img/Admin/video',  $setFilename);
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
                    "message"   => "Agenda sudah ada."
                ];
                return $this->respond($output, 200);
            }
        }
    }
    public function update($id_video=null)
    {
        $validation =  \Config\Services::validation();
        $judul      = $this->request->getPost('judul');
        $keterangan      = $this->request->getPost('keterangan');
        $category      = $this->request->getPost('category');
        $status      = $this->request->getPost('status');
        $url      = $this->request->getPost('url');
        $avatar = $this->request->getFile('fileupload');
        $oldfileupload      = $this->request->getPost('oldfileupload');  

        if( $avatar  !=null){
            $split = explode(".",$avatar->getName());
            $arr = array($split[0].'_top'.date('YmdHis'),$split[1]);
            $setFilename = implode(".",$arr);
            $data = [
                'judul' => $judul,
                'keterangan' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'link' => $url,
                'poster' =>   $setFilename,
            ];
        }else{
            
            $data = [
                'judul' => $judul,
                'keterangan' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'link' => $url,
                'createdate' =>  date('Y m d H i s'),
            ];
        }    
    
        if($validation->run($data, 'video') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->videomodel->VideoExists($judul, $url,$id_video);
            if(!$Exists)
            {
                $resultData = $this->videomodel->updateVideo($data,$id_video);
                if($resultData ==true){
                    if($avatar != null){
                        $avatar->move(ROOTPATH . 'public/top/assets/img/Admin/video', $setFilename);
                        unlink(ROOTPATH . 'public/top/assets/img/Admin/video/'.$oldfileupload);
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
    public function delete($id_video = NULL)
    {
        $oldfileupload = $this->request->getPost('oldfileupload');
        $hapus = $this->videomodel->deleteVideo($id_video);
        if($hapus){
            $code = 200;
            $msg = 'Deleted agenda successfully';
            $response = [
                'status' => $code,
                'error' => false,
                'data' => [],
                'message' =>$msg
            ];
            if($oldfileupload !=""){
                unlink(ROOTPATH . 'public/top/assets/img/Admin/video/'.$oldfileupload);
            }
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