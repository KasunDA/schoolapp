<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

    /*
     *	@author 	: Nicodemus Karisa Mwambire
     *	date		: 16th June, 2018
     *	Techsys School Management System
     *	https://www.techsysolutions.com
     *	support@techsysolutions.com
     */

class Finance extends CI_Controller
{


	function __construct()
	{
		parent::__construct();
		$this->load->database();
        $this->load->library('session');

       /*cache control*/
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');

    }

    function fees_structure($param1 = '', $param2 = ''){
      if ($this->session->userdata('active_login') != 1)
              redirect('login', 'refresh');
      if ($param1 == 'create') {
          $data['name']   =   $this->input->post('name');
    			$data['class_id']   =   $this->input->post('class_id');
    			$data['yr']   =   $this->input->post('yr');
    			$data['term']   =   $this->input->post('term');

      			//Check if the Fees structure Exists

      			$chk = $this->db->get_where('fees_structure',array('name'=>$this->input->post('name')))->num_rows();

      			if($chk===0){
      				$this->db->insert('fees_structure' , $data);
                  	$this->session->set_flashdata('flash_message' , get_phrase('data_added_successfully'));
      			}else{
      				$this->session->set_flashdata('flash_message' , get_phrase('record_already_exists'));
      			}


        redirect(base_url() . 'index.php?admin/fees_structure');
      }

      if ($param1 == 'edit') {
              $data['name']   =   $this->input->post('name');
        			$data['class_id']   =   $this->input->post('class_id');
        			//$data['income_category_id']   =   $this->input->post('income_category_id');
        			$data['yr']   =   $this->input->post('yr');
        			$data['term']   =   $this->input->post('term');
        			//$data['amount']   =   $this->input->post('amount');

              $this->db->where('fees_id' , $param2);
              $this->db->update('fees_structure' , $data);
              $this->session->set_flashdata('flash_message' , get_phrase('data_updated'));
              redirect(base_url() . 'index.php?admin/fees_structure');
        }

        if ($param1 == 'delete') {
              $this->db->where('fees_id' , $param2);
              $this->db->delete('fees_structure');
              $this->session->set_flashdata('flash_message' , get_phrase('data_deleted'));
              redirect(base_url() . 'index.php?admin/fees_structure');
      }

      $page_data['page_name']  = 'fees_structure';
      $page_data['page_view'] = "finance";
      $page_data['page_title'] = get_phrase('fees_structure');
      $this->load->view('backend/index', $page_data);
  	}

}
