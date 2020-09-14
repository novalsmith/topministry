<?php 
namespace App\Controllers\Api\km;
use Firebase\JWT\JWT;
use App\Models\km\Auth_model;
use CodeIgniter\RESTful\ResourceController;
header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
class Auth extends ResourceController
{
    public function __construct()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $this->auth = new Auth_model();
    }
    public function privateKey()
    {
        $privateKey = <<<EOD
            -----BEGIN RSA PRIVATE KEY-----
            MIICXAIBAAKBgQC8kGa1pSjbSYZVebtTRBLxBz5H4i2p/llLCrEeQhta5kaQu/Rn
            vuER4W8oDH3+3iuIYW4VQAzyqFpwuzjkDI+17t5t0tyazyZ8JXw+KgXTxldMPEL9
            5+qVhgXvwtihXC1c5oGbRlEDvDF6Sa53rcFVsYJ4ehde/zUxo6UvS7UrBQIDAQAB
            AoGAb/MXV46XxCFRxNuB8LyAtmLDgi/xRnTAlMHjSACddwkyKem8//8eZtw9fzxz
            bWZ/1/doQOuHBGYZU8aDzzj59FZ78dyzNFoF91hbvZKkg+6wGyd/LrGVEB+Xre0J
            Nil0GReM2AHDNZUYRv+HYJPIOrB0CRczLQsgFJ8K6aAD6F0CQQDzbpjYdx10qgK1
            cP59UHiHjPZYC0loEsk7s+hUmT3QHerAQJMZWC11Qrn2N+ybwwNblDKv+s5qgMQ5
            5tNoQ9IfAkEAxkyffU6ythpg/H0Ixe1I2rd0GbF05biIzO/i77Det3n4YsJVlDck
            ZkcvY3SK2iRIL4c9yY6hlIhs+K9wXTtGWwJBAO9Dskl48mO7woPR9uD22jDpNSwe
            k90OMepTjzSvlhjbfuPN1IdhqvSJTDychRwn1kIJ7LQZgQ8fVz9OCFZ/6qMCQGOb
            qaGwHmUK6xzpUbbacnYrIM6nLSkXgOAwv7XXCojvY614ILTK3iXiLBOxPu5Eu13k
            eUz9sHyD6vkgZzjtxXECQAkp4Xerf5TGfQXGXhxIX52yH+N2LtujCdkQZjXAsGdm
            B2zNzvrlgRmgBrklMTrMYgm1NPcW+bRLGcwgW2PTvNM=
            -----END RSA PRIVATE KEY-----
            EOD;
        return $privateKey;
    }
    public function register()
    {
        $nama_lengkap   = $this->request->getPost('nama_lengkap');
        $email          = $this->request->getPost('email');
        $username       = $this->request->getPost('username');
        $password       = $this->request->getPost('password');
        $errorMessage   = "";
        if($nama_lengkap    == "" || 
            $email          == "" || 
            $username       == "" || 
            $password       == "" )
            {
                $errorMessage   = "Periksa lagi inputan anda !";
                $output = [
                    'status'    => 401,
                    'isSuccess' => false,
                    'message'   => $errorMessage
                ];
                return $this->respond($output, 401);
        }else
        {
            $cek_already = $this->auth->getuserAlready($username,$email);
            if(count($cek_already) > 0)
            {
                $output = [
                    'status'    => 401,
                    'isSuccess' => false,
                    'message'   => "Data ini sudah terdaftar, silahkan gunakan User Name atau email yang lain"
                ];
                return $this->respond($output, 401);
            }else
            {
                $password_hash = password_hash($password, PASSWORD_BCRYPT);
                $data = json_decode(file_get_contents("php://input"));
                $dataRegister = [
                    'nama_lengkap'  => $nama_lengkap,
                    'email'         => $email,
                    'password'      => $password_hash,
                    'username'      => $username,
                    'status'        => 1, // Active = 1 NoActive 0
                    'no_tlp'        => '',
                    'tgl_register'  => date('Y-m-d'),
                    'register_by'   => $nama_lengkap,
                    'tgl_update'    => date('Y-m-d'),
                    'update_by'     => $nama_lengkap,
                    'akses'         => 1, // Admin =1, member=2,
                    'fotouser'      =>'default.jpg',
                    'aboutme'       => 'IT Head'
                ];
                $register = $this->auth->register($dataRegister);
                if($register == true)
                {
                    $output = [
                        'status'    => 200,
                        'isSuccess' => true,
                        'message'   => 'Berhasil register'
                    ];
                    return $this->respond($output, 200);
                } else 
                {
                    $output = [
                        'status'    => 401,
                        'isSuccess' => false,
                        'message'   => $errorMessage
                    ];
                    return $this->respond($output, 401);
                }
            }
        }
        
    }
    public function login()
    {
        $isVerified     = false;
        $errorMessage   = '';
        $username       = $this->request->getPost('username');
        $password       = $this->request->getPost('password');
        if($username == "" || 
        $password == null)
        {
            $errorMessage = "Periksa lagi inputan anda !";
            $output = [
                'status'    => 404,
                'isSuccess' => false,
                'message'   => $errorMessage,
                "password"  => $password
            ];
            return $this->respond($output, 404);
        }else
        {
                $cek_login    = $this->auth->cek_login($username);
                if($cek_login != null)
                {
                    $isVerified =  password_verify($password, $cek_login['password']);
                    if($isVerified==false)
                    {
                        $errorMessage = "Password masih salah";
                    }
                }else
                {
                    $errorMessage = "User Name masih salah";
                }
            if($cek_login !=null && $isVerified==true)
            {
                $errorMessage       = "Berhasil login";
                $secret_key         = $this->privateKey();
                $issuer_claim       = "http://localhost:8080/km/user"; // this can be the servername. Example: https://domain.com
                $audience_claim     = "http://localhost:8080/km/user";
                $issuedat_claim     = time(); // issued at
                $notbefore_claim    = $issuedat_claim + 10; //not before in seconds
                $expire_claim       = ($issuedat_claim + 3600); // expire time in seconds
                $token = array(
                    "iss"           => $issuer_claim,
                    "aud"           => $audience_claim,
                    "iat"           => $issuedat_claim,
                    "nbf"           => $notbefore_claim,
                    "exp"           => $expire_claim,
                    "data"          => array(
                        "id"        => $cek_login['id_hakakses'],
                        "nama_lengkap"  => $cek_login['nama_lengkap'],
                        "username"      => $cek_login['username'],
                        "email"         => $cek_login['email']
                    )
                );
                $token = JWT::encode($token, $secret_key);
                $output = [
                    'status'    => 200,
                    'isSuccess' => true,
                    'message'   => $errorMessage,
                    "token"     => $token,
                    "email"     => $cek_login['email'],
                    "expireAt"  => $expire_claim
                ];
                return $this->respond($output, 200);
            } else 
            {
                $output = [
                    'status'    => 404,
                    'isSuccess' => false,
                    'message'   => $errorMessage,
                    "password"  => $password
                ];
                return $this->respond($output, 404);
            }
        }
    }
    public function showuser()
    {
        $id_hakakses      = $this->request->getPost('id_hakakses');
        $errorMessage ="";
        $resultData = $this->auth->getuser($id_hakakses);

        if($resultData !=null){
            $output = [
                'status'    => 404,
                'isSuccess' => true,
                'message'   => "Berhasil load data",
                "data"      => $resultData
            ];
            return $this->respond($output, 200);
        } else {
            $output = [
                'status'    => 404,
                'isSuccess' => false,
                'message'   => "Gagal load data",
                "data"      => $resultData
            ];
            return $this->respond($output, 404);
        }
    }
}