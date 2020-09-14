<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Article_model extends Model {
    protected $table = 'berita';
    public function getArticle($id)
    {
    
        if($id ==null){
            
            $this->select('categori.*,berita.*');
            $this->join('categori', 'categori.id_categori = berita.id_categori');
            $this->db->table($this->table);
            return $this->findAll();
        } else {
            $this->db->table($this->table);
            $this->select('categori.*,berita.*');
            $this->join('categori', 'categori.id_categori = berita.id_categori');
            return $this->getWhere(['id_article' => $id])->getRowArray();
        }  
    }
    public function insertArticle($data)
    {
        $query =  $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function updateArticle($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, ['id_article' => $id]);
        return $query ? true : false;
    }
    public function deleteArticle($id)
    {
        $query = $this->db->table($this->table)->delete(['id_article' => $id]);
        return $query ? true : false;
    }

    public function ArticleExists($judul,$id_categori,$id_article){
        $data = [
            'judul' => $judul,
            'id_categori' => $id_categori
        ];

        if($id_article == null){

            $this->where($data);
        $query  =  $this->get()->getRowArray();
        if($query != ""){
            return true;
        }else{
            return false;
        }
    }else{
        $this->where($data);
        $this->where(['id_article <>' => $id_article]);
        $query  =  $this->get()->getRowArray();
        if($query != ""){
            return true;
        }else{
            return false;
        }
    }
    }
} 
