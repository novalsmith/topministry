<?php 
namespace App\Controllers\Api\top;
use \Firebase\JWT\JWT;
use App\Models\top\Article_Model;
use App\Models\top\Tags_Model;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

class Article extends ResourceController
{
    public function __construct()
    {
        // $this->protect = new Auth();
        $this->articlemodel = new Article_Model();
        $this->tagsmodel = new Tags_Model();
    }
    public function index()
    {
        $id_article      = $this->request->getGet('id_article');
        $errorMessage ="";
        $resultData = $this->articlemodel->getArticle($id_article);
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
        $keterangan = $this->request->getPost('keterangan');
        $category   = $this->request->getPost('category');
        $status     = $this->request->getPost('status');
        $tags       = $this->request->getPost('tags');
        $createby = $this->request->getPost('createby');
        $avatar     = $this->request->getFile('fileupload');

        if( $avatar  !=null){
            $split = explode(".",$avatar->getName());
            $arr = array($split[0].'_top'.date('YmdHis'),$split[1]);
            $setFilename = implode(".",$arr);
            $data = [
                'judul' => $judul,
                'content' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'tags' => $tags,
                'createdate' =>  date('Y m d H i s'),
                'createby' => $createby,
                'poster' =>   $setFilename,
            ];
        }else{
            $data = [
                'judul' => $judul,
                'content' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'tags' => $tags,
                'createby' => $createby,
                'createdate' =>  date('Y m d H i s')
            ];
        }    
        if($validation->run($data, 'article') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->articlemodel->ArticleExists($judul, $category,$id_article = null);
            if(!$Exists){

                $resultData = $this->articlemodel->insertArticle($data);
                $this->tagsmodel->insertTags($tags,$id_article);
                if($resultData ==true){
                
                    if($avatar != null){
                    $avatar->move(ROOTPATH . 'public/top/assets/img/Admin/article',  $setFilename);
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
                    "message"   => "Artikel sudah ada."
                ];
                return $this->respond($output, 200);
            }
        }
    }
    public function update($id_article=null)
    {
        $validation =  \Config\Services::validation();
        $judul      = $this->request->getPost('judul');
        $keterangan = $this->request->getPost('keterangan');
        $category   = $this->request->getPost('category');
        $status     = $this->request->getPost('status');
        $tags       = $this->request->getPost('tags');
        $avatar     = $this->request->getFile('fileupload');
        $oldfileupload      = $this->request->getPost('oldfileupload');  

        if( $avatar  !=null){
            $split = explode(".",$avatar->getName());
            $arr = array($split[0].'_top'.date('YmdHis'),$split[1]);
            $setFilename = implode(".",$arr);
            $data = [
                'judul' => $judul,
                'content' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'tags' => $tags,
                'createdate' =>  date('Y m d H i s'),
                'poster' =>   $setFilename,
            ];
        }else{
            
            $data = [
                'judul' => $judul,
                'content' => $keterangan,
                'id_categori' => $category,
                'status' => $status,
                'tags' => $tags,
                'createdate' =>  date('Y m d H i s')
            ];
        }    
    
        if($validation->run($data, 'article') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->articlemodel->ArticleExists($judul, $category,$id_article);
            if(!$Exists)
            {
                $resultData = $this->articlemodel->updateArticle($data,$id_article);
                if($resultData ==true){
                    $this->tagsmodel->insertTags($tags,$id_article);
                    if($avatar != null){
                        $avatar->move(ROOTPATH . 'public/top/assets/img/Admin/article', $setFilename);
                        unlink(ROOTPATH . 'public/top/assets/img/Admin/article/'.$oldfileupload);
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
                    "message"   => "Artikel sudah ada."
                ];
                return $this->respond($output, 200);
            }
        }
    }
    public function delete($id_article = NULL)
    {
        $oldfileupload = $this->request->getPost('oldfileupload');
        $hapus = $this->articlemodel->deleteArticle($id_article);
        if($hapus){
            $code = 200;
            $msg = 'Deleted article successfully';
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
        if($oldfileupload !=""){
            unlink(ROOTPATH . 'public/top/assets/img/Admin/article/'.$oldfileupload);
        }
        return $this->respond($response, $code);
    }
}