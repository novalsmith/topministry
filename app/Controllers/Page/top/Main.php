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
class Main extends BaseController
{
    public function __construct()
    {
        //$this->protect = new Auth();
    }
    public function index()
    {
        $page = [
            'content' => 'top/category',
            'title'   => 'Category'
        ];
        echo view('templates/template.php',$page);
    }
    public function category()
    {
        $page = [
            'content' => 'top/category',
            'title'   => 'Category'
        ];
        echo view('templates/template.php',$page);
    }
    public function agenda()
    {
        $page = [
            'content' => 'top/agenda',
            'title'   => 'Agenda'
        ];
        echo view('templates/template.php',$page);
    }
    public function video()
    {
        $page = [
            'content' => 'top/video',
            'title'   => 'Video'
        ];
        echo view('templates/template.php',$page);
    }
    public function article()
    {
        $page = [
            'content' => 'top/article',
            'title'   => 'Article'
        ];
        echo view('templates/template.php',$page);
    }
    public function articledetail($id_article=null)
    {
        $page = [
            'content' => 'top/articleDetail',
            'title'   => 'Article Detail'
        ];
        echo view('templates/template.php',$page);
    }
    public function ewarta()
    {
        $page = [
            'content' => 'top/ewarta',
            'title'   => 'Ewarta'
        ];
        echo view('templates/template.php',$page);
    }
}