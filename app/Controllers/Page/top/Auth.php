<?php 
namespace App\Controllers\page\top;
// use App\Models\top\Auth_model;
use App\Models\top\Account_Model;
class Auth extends BaseController
{
    public function __construct()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        // $this->session = \Config\Services::session();
        // $this->session->start();

        $this->accountmodel = new Account_Model();
    }
      
    
    public function index()
    {
        if(session()->has('name')){
            return redirect()->to(base_url('main'));
        } 

        $page = [
            'title' => 'Top Ministry'
        ];
        echo view('top/loginPage', $page);
    }
    public function login()
    {
        $output = [];
        $errorMessage   = "";
        $email          = htmlspecialchars($this->request->getPost('email'));
        $password       = htmlspecialchars($this->request->getPost('password'));
        
        $getRows    = $this->accountmodel->cek_login($email);

        if($getRows != null)
        {
            $isVerified =  password_verify($password, $getRows['password']);
            if($isVerified==false)
            {
                $errorMessage = "Password masih salah";
            }
        }else
        {
            $errorMessage = "Email masih salah";
        }
        
            if($getRows !=null && $isVerified==true)
            {
                if($getRows['status']==1)
                {
                            
                        $setSession = [
                            'email' => $getRows['email'],
                            'roles'  => $getRows['roles'],
                            'name'  => $getRows['name']
                        ];
                        $output = [
                            'status'    => 200,
                            'isSuccess' => true
                        ];

                        session()->set($setSession);
                }else
                {
        
                    $output = [
                        'status'    => 401,
                        'isSuccess' => false,
                        'message'   => "Akun anda sudah tidak aktif, silahkan hubungi Admin."
                    ];
                }

            }else
            {
                $output = [
                    'status'    => 401,
                    'isSuccess' => false,
                    'message'   => $errorMessage
                ];
            }

        return $this->response->setJSON($output);
    }

    public function logout(){
        session()->destroy();
        return   redirect()->to(base_url('auth'));
    }
}