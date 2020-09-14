<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Tags_model extends Model {
    protected $table = 'tags';
    public function getTags()
    {
            $this->db->table($this->table);
            return $this->findAll();
    }
    public function insertTags($data,$id_article)
    {
        $split = explode(',',$data);
        foreach($split as $key){
            if($this->TagsExists($key) == false){
                $res = [
                    'tags_name' => $key,
                    'createdate' => date('Y m d H i s'),
                    'id_article' => $id_article
                ];
                $this->db->table($this->table)->insert($res);
            }
        }
        
        return true;
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

    public function TagsExists($tags)
    {
        $data = [
            'tags_name' => $tags
        ];
        $this->where($data);
        $query  =  $this->get()->getRowArray();
        if($query != ""){
            return true;
        }else{
            return false;
        }
    }
} 
