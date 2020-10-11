<?php 
namespace App\Controllers\Page\top;
// Panggil JWT
// use \Firebase\JWT\JWT;
// panggil class Auht
// use App\Controllers\Auth;
// panggil restful api codeigniter 4
// use CodeIgniter\RESTful\ResourceController;
// header("Access-Control-Allow-Origin: * ");
// header("Content-Type: application/json; charset=UTF-8");
// header("Access-Control-Allow-Methods: POST");
// header("Access-Control-Max-Age: 3600");
// header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
class Home extends BaseController
{
    public function __construct()
    {
        //$this->protect = new Auth();
    }
    public function index()
    {
        echo true;
        // echo view('top/loginPage');
    }
}