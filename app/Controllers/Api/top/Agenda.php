<?php 
namespace App\Controllers\Api\top;
use \Firebase\JWT\JWT;
use App\Models\top\Agenda_Model;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
class Agenda extends ResourceController
{
    public function __construct()
    {
        $this->agendamodel = new Agenda_Model();
    }
    public function index()
    {
        $id_agenda      = $this->request->getGet('id_agenda');
        $errorMessage ="";
        $resultData = $this->agendamodel->getAgenda($id_agenda);
        $headers = [
            "#","Agenda","Waktu","Status",""
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
        $nama_agenda      = $this->request->getPost('nama_agenda');
        $keterangan      = $this->request->getPost('keterangan');
        $tgl_posting      = $this->request->getPost('tgl_posting');
        $status_tampil      = $this->request->getPost('status_tampil');
        $avatar = $this->request->getFile('fileupload');

        if( $avatar  !=null){
            $split = explode(".",$avatar->getName());
            $arr = array($split[0].'_top'.date('YmdHis'),$split[1]);
            $setFilename = implode(".",$arr);
            $data = [
                'nama_agenda' => $nama_agenda,
                'keterangan' => $keterangan,
                'tgl_posting' => $tgl_posting,
                'status_tampil' => $status_tampil,
                'fotoagenda' =>   $setFilename
            ];
        }else{
            
            $data = [
                'nama_agenda' => $nama_agenda,
                'keterangan' => $keterangan,
                'tgl_posting' => $tgl_posting,
                'status_tampil' => $status_tampil
                
            ];
        }    
        if($validation->run($data, 'agenda') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->agendamodel->AgendaExists($nama_agenda, $tgl_posting,$id_agenda = null);
            if(!$Exists){

                $resultData = $this->agendamodel->insertAgenda($data);
            
                if($resultData ==true){
                    if($avatar != null){
                    $avatar->move(ROOTPATH . 'public/top/assets/img/Admin/agenda',  $setFilename);
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
    public function update($id_agenda=null)
    {
        $validation =  \Config\Services::validation();
        $nama_agenda      = $this->request->getPost('nama_agenda');
        $keterangan      = $this->request->getPost('keterangan');
        $tgl_posting      = $this->request->getPost('tgl_posting');
        $status_tampil      = $this->request->getPost('status_tampil');
        $oldfileupload      = $this->request->getPost('oldfileupload');  
        $fileupload      = $this->request->getPost('fileupload');  
        $avatar = $this->request->getFile('fileupload');
        if( $avatar  !=null){
            $split = explode(".",$avatar->getName());
            $arr = array($split[0].'_top'.date('YmdHis'),$split[1]);
            $setFilename = implode(".",$arr);
            $data = [
                'nama_agenda' => $nama_agenda,
                'keterangan' => $keterangan,
                'tgl_posting' => $tgl_posting,
                'status_tampil' => $status_tampil,
                'fotoagenda' =>   $setFilename
            ];
        }else{
            
            $data = [
                'nama_agenda' => $nama_agenda,
                'keterangan' => $keterangan,
                'tgl_posting' => $tgl_posting,
                'status_tampil' => $status_tampil
            ];
        }    
    
        if($validation->run($data, 'agenda') == FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response, 500);
        } else {
            $Exists = $this->agendamodel->AgendaExists($nama_agenda, $tgl_posting,$id_agenda);
            if(!$Exists)
            {
                $resultData = $this->agendamodel->updateAgenda($data,$id_agenda);
                if($resultData ==true){
                    if($avatar != null){
                        $avatar->move(ROOTPATH . 'public/top/assets/img/Admin/agenda', $setFilename);
                        unlink(ROOTPATH . 'public/top/assets/img/Admin/agenda/'.$oldfileupload);
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
    public function delete($id_agenda = NULL)
    {
        $oldfileupload = $this->request->getPost('oldfileupload');
        $hapus = $this->agendamodel->deleteAgenda($id_agenda);
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
                unlink(ROOTPATH . 'public/top/assets/img/Admin/agenda/'.$oldfileupload);
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