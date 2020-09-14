<?php
namespace App\Models\km;
use CodeIgniter\Model;
class Auth_model extends Model{
    protected $table = "hakakses";
 

    public function getuser($id)
    {
        $whereData = "";
        if($id !=""){
            $whereData = "WHERE id_hakakses=".$id;
        }
        $data = "SELECT * FROM ".$this->table." ".$whereData;

        $query = $this->db->query($data)->getResult();
        return $query;
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
                ->where('username', $userName)
                ->countAll();
        if($query >  0){
            $hasil = $this->table($this->table)
                ->where('username', $userName)
                ->limit(1)
                ->get()
                ->getRowArray();
        } else {
            $hasil = array(); 
        }
        return $hasil;
    }
}