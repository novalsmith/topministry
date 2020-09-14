<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Video_model extends Model {
    protected $table = 'video';
    public function getVideo($id)
    {
      
        if($id ==null){
            
            $this->select('categori.*,video.*');
            $this->join('categori', 'categori.id_categori = video.id_categori');
            $this->db->table('video');
            return $this->findAll();
        } else {
            $this->db->table('video');
            $this->select('categori.*,video.*');
            $this->join('categori', 'categori.id_categori = video.id_categori');
            return $this->getWhere(['id_video' => $id])->getRowArray();
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
