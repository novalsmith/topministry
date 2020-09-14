<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Agenda_model extends Model {
    protected $table = 'agenda';
    public function getAgenda($id)
    {
        if($id ==null){
            return $this->findAll();
        } else {
            return $this->getWhere(['id_agenda' => $id])->getRowArray();
        }  
    }
    public function insertAgenda($data)
    {
        $query =  $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function updateAgenda($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, ['id_agenda' => $id]);
        return $query ? true : false;
    }
    public function deleteAgenda($id)
    {
        $query = $this->db->table($this->table)->delete(['id_agenda' => $id]);
        return $query ? true : false;
    }

    public function AgendaExists($nama_agenda, $tgl_posting, $id_agenda){
        $data = [
            'nama_agenda' => $nama_agenda,
            'tgl_posting' => $tgl_posting
        ];

        if($id_agenda == null){

            $this->where($data);
        $query  =  $this->get()->getRowArray();
        if($query != ""){
            return true;
        }else{
            return false;
        }
    }else{
        $this->where($data);
        $this->where(['id_agenda <>' => $id_agenda]);
        $query  =  $this->get()->getRowArray();
        if($query != ""){
            return true;
        }else{
            return false;
        }
    }
    }
} 
