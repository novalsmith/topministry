<?php
namespace App\Models\km;
use CodeIgniter\Model;
class Category_model extends Model {
    protected $table = 'hakakses';
    public function getCategory($id = false)
    {
        if($id === false){
            return $this->findAll();
        } else {
            return $this->getWhere(['category_id' => $id])->getRowArray();
        }  
    }
    public function insertCategory($data)
    {
        return $this->db->table($this->table)->insert($data);
    }
    public function updateCategory($data, $id)
    {
        return $this->db->table($this->table)->update($data, ['category_id' => $id]);
    }
    public function deleteCategory($id)
    {
        return $this->db->table($this->table)->delete(['category_id' => $id]);
    }
} 