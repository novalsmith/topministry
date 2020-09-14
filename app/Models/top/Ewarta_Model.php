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
    public function insertVideo($data)
    {
        $query =  $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function updateVideo($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, ['id_video' => $id]);
        return $query ? true : false;
    }
    public function deleteVideo($id)
    {
        $query = $this->db->table($this->table)->delete(['id_video' => $id]);
        return $query ? true : false;
    }

    public function VideoExists($judul,$url,$id_video){
        $data = [
            'judul' => $judul,
            'link' => $url
        ];

        if($id_video == null){

            $this->where($data);
        $query  =  $this->get()->getRowArray();
        if($query != ""){
            return true;
        }else{
            return false;
        }
    }else{
        $this->where($data);
        $this->where(['id_video <>' => $id_video]);
        $query  =  $this->get()->getRowArray();
        if($query != ""){
            return true;
        }else{
            return false;
        }
    }
    }
} 
