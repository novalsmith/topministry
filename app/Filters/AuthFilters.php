<?php namespace App\Filters;
 
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;
 
class AuthFilters implements FilterInterface
{
    
    public function before(RequestInterface $request, $arguments = null)
    {
        // Do something here
        if(!session()->has('name')){
            return redirect()->to(base_url('auth'));
        } 
    }

    //--------------------------------------------------------------------

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Do something here
       // return redirect()->to(base_url('main/home'));
       
    }
}