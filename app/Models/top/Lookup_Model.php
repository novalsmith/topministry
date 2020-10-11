<?php
namespace App\Models\top;
use CodeIgniter\Model;

class Lookup_model extends Model {
    protected $table = 'lookup';
    public function getLookup($id)
    {
        if($id ==null)
        {
            $this->select('lookupcategory.*,lookup.*');
            $this->join('lookupcategory', 'lookupcategory.idlookupCategory = lookup.idlookupCategory');
            return $this->findAll();
        } else 
        {
            $this->select('lookupcategory.*,lookup.*');
            $this->join('lookupcategory', 'lookupcategory.idlookupCategory = lookup.idlookupCategory');
            return $this->getWhere(['idlookup' => $id])->getRowArray();
        }  
    }
    public function getLookupCategory()
    {
            $query=$this->db->query("select idlookupCategory,categoryName from lookupcategory");
            return $query->getResult();
    }
    public function insertLookup($data)
    {
        $query =  $this->db->table($this->table)->insert($data);
        return $query ? true : false;
    }
    public function updateLookup($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, ['idlookup' => $id]);
        return $query ? true : false;
    }
    public function deleteLookup($id)
    {
        $query = $this->db->table($this->table)->delete(['idlookup' => $id]);
        return $query ? true : false;
    }

    public function LookupExists($value,$idlookup)
    {
        $data = [
            'valueCategory' => $value
        ];

        if($idlookup == null)
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
            $this->where(['idlookup <>' => $idlookup]);
            $query  =  $this->get()->getRowArray();
            if($query != ""){
                return true;
            }else{
                return false;
            }
        }
    }
} 
