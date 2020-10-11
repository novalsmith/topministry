<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Account_model extends Model {
    protected $table = 'account';
    public function getAccount($id)
    {
        if($id ==null){
            return $this->findAll();
        } else {
            return $this->getWhere(['id_account' => $id])->getRowArray();
        }
    }
    public function insertAccount($data)
    {
        $query =  $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function updateAccount($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, ['id_account' => $id]);
        return $query ? true : false;
    }
    public function deleteAccount($id)
    {
        $query = $this->db->table($this->table)->delete(['id_account' => $id]);
        return $query ? true : false;
    }

    public function AccountExists($Account,$id_Account){
        if($id_Account ==null)
        {
            $this->where(['email' => $Account]);
            $query  =  $this->get()->getRowArray();
            if($query != ""){
                return true;
            }else{
                return false;
            }
        }else
        {
            $this->where(['email' => $Account]);
            $this->where(['id_account <>' => $id_Account]);
            $query  =  $this->get()->getRowArray();
            if($query != ""){
                return true;
            }else{
                return false;
            }
        }
    }

    public function cek_login($email)
    {
        $query = $this->table($this->table)
                ->where('email', $email)
                ->countAll();
        if($query >  0){
            $hasil = $this->table($this->table)
                ->where('email', $email)
                ->limit(1)
                ->get()
                ->getRowArray();
        } else {
            $hasil = array(); 
        }
        return $hasil;
    }
} 
