<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Ewarta_model extends Model {
    protected $table = 'ewarta';
    public function getEwarta($id)
    {
        if($id ==null){
            
            $this->select('categori.*,ewarta.*');
            $this->join('categori', 'categori.id_categori = ewarta.id_categori');
            $this->db->table('ewarta');
            return $this->findAll();
        } else {
            $this->db->table('ewarta');
            $this->select('categori.*,ewarta.*');
            $this->join('categori', 'categori.id_categori = ewarta.id_categori');
            return $this->getWhere(['idewarta' => $id])->getRowArray();
        }  
    }
    public function insertWarta($data)
    {
        $query =  $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function updateWarta($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, ['id_warta' => $id]);
        return $query ? true : false;
    }
    public function deleteWarta($id)
    {
        $query = $this->db->table($this->table)->delete(['id_warta' => $id]);
        return $query ? true : false;
    }

    public function WartaExists($judul,$id_warta)
    {
        $data = [
            'judul' => $judul,
            'id_categori' => $id_categori
        ];

        if($id_warta == null)
        {

            $this->where($data);
            $query  =  $this->get()->getRowArray();
            if($query != ""){
                return true;
            }else{
                return false;
            }
        }else
        {
            $this->where($data);
            $this->where(['id_warta <>' => $id_warta]);
            $query  =  $this->get()->getRowArray();
            if($query != ""){
                return true;
            }else{
                return false;
            }
        }
    }
} 
