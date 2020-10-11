<?php 
namespace App\Controllers\Page\top;
 
class Main extends BaseController
{
    public function __construct()
    {
    }

    public function index()
    { 
        
        $page = [
            'content' => 'top/home',
            'title'   => 'Home' 
        ];
        echo view('templates/template.php',$page);
    }
    public function category()
    {
        if(session()->get('roles') !=1){
            return $this->notauthorized();
        }

        $page = [
            'content' => 'top/category',
            'title'   => 'Kategori'
        ];
        echo view('templates/template.php',$page);
    }
    public function agenda()
    {
        if(session()->get('roles') !=1){
            return $this->notauthorized();
        }

        $page = [
            'content' => 'top/agenda',
            'title'   => 'Agenda '

        ];
        echo view('templates/template.php',$page);
    }
    public function video()
    {
          if(session()->get('roles') !=1){
            return $this->notauthorized();
        }

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
            'title'   => 'Artikel'
        ];
        echo view('templates/template.php',$page);
    }
    public function articledetail($id_article=null)
    {
        $page = [
            'content' => 'top/articleDetail',
            'title'   => 'Detil Artikel'
        ];
        echo view('templates/template.php',$page);
    }
    public function ewarta()
    {
          if(session()->get('roles') !=1){
            return $this->notauthorized();
        }

        $page = [
            'content' => 'top/ewarta',
            'title'   => 'E-warta'
        ];
        echo view('templates/template.php',$page);
    }
    public function lookup()
    {
          if(session()->get('roles') !=1){
            return $this->notauthorized();
        }

        $page = [
            'content' => 'top/lookup',
            'title'   => 'Lookup'
        ];
        echo view('templates/template.php',$page);
    }
    public function tags()
    {
          if(session()->get('roles') !=1){
            return $this->notauthorized();
        }
        
        $page = [
            'content' => 'top/tags',
            'title'   => 'Tags'
        ];
        echo view('templates/template.php',$page);
    }
    public function account()
    {
        $page = [
            'content' => 'top/account',
            'title'   => 'Akun'
        ];
        echo view('templates/template.php',$page);
    }
    public function notauthorized()
    {
        $page = [
            'title'   => '401 not authorized.'
        ];
        return view('top/notauthorized',$page);
    }
}