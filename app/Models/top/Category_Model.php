<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Category_model extends Model {
    protected $table = 'categori';
    public function getCategory($id, $isAll = false)
    {
        if(!$isAll)
        {
            if($id ==null){
                return $this->findAll();
            } else {
                return $this->getWhere(['id_categori' => $id])->getRowArray();
            }
        }else{
            if($id ==null){
                $this->where('status_categori',"A001");
                return $this->findAll();
            } else {
                return $this->getWhere(['id_categori' => $id])->getRowArray();
            }
        }
         
    }
    public function insertCategory($data)
    {
        $query =  $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function updateCategory($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, ['id_categori' => $id]);
        return $query ? true : false;
    }
    public function deleteCategory($id)
    {
        $query = $this->db->table($this->table)->delete(['id_categori' => $id]);
        return $query ? true : false;
    }

    public function CategoryExists($category,$id_category){
        if($id_category ==null)
        {
            $this->where(['nama_categori' => $category]);
            $query  =  $this->get()->getRowArray();
            if($query != ""){
                return true;
            }else{
                return false;
            }
        }else
        {
            $this->where(['nama_categori' => $category]);
            $this->where(['id_categori <>' => $id_category]);
            $query  =  $this->get()->getRowArray();
            if($query != ""){
                return true;
            }else{
                return false;
            }
        }
    }
} 
