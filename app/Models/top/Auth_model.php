<?php
namespace App\Models\top;
use CodeIgniter\Model;
class Auth_model extends Model{
    protected $table = "account";
 

    public function getuser($email,$password)
    {
        {
            $params = [
                'email'     => $email,
                'password'  => $password
            ];
            return $this->getWhere($params)->getRowArray();
        }
    }
    public function getuserAlready($username,$email)
    {
        $query = $this->db->query("SELECT username FROM hakakses WHERE username='".$username."' AND email='".$email."'")->getResult();
        return $query;
    }
    public function register($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function cek_login($userName)
    {
        $query = $this->table($this->table)
                ->where('email', $userName)
                ->countAll();
        if($query >  0){
            $hasil = $this->table($this->table)
                ->where('email', $userName)
                ->limit(1)
                ->get()
                ->getRowArray();
        } else {
            $hasil = array(); 
        }
        return $hasil;
    }
}