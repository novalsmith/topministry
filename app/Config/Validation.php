<?php namespace Config;

class Validation
{
	//--------------------------------------------------------------------
	// Setup
	//--------------------------------------------------------------------

	/**
	 * Stores the classes that contain the
	 * rules that are available.
	 *
	 * @var array
	 */
	public $ruleSets = [
		\CodeIgniter\Validation\Rules::class,
		\CodeIgniter\Validation\FormatRules::class,
		\CodeIgniter\Validation\FileRules::class,
		\CodeIgniter\Validation\CreditCardRules::class,
	];

	/**
	 * Specifies the views that are used to display the
	 * errors.
	 *
	 * @var array
	 */
	public $templates = [
		'list'   => 'CodeIgniter\Validation\Views\list',
		'single' => 'CodeIgniter\Validation\Views\single',
	];

	public $category = [
		'nama_categori'         => 'required|min_length[3]',
		'status_categori'       => 'required'
	];
	
	public $category_errors = [
		'nama_categori'=> [
			'required'  => 'Nama Kategori wajib diisi.',
			'min_length' => 'Nama Kategori Minimal 3 Karakter'
		],
		'status_categori'=> [
			'required'  => 'Status Kategori wajib diisi.'
		]
	];

	public $agenda = [
		'nama_agenda'         => 'required|min_length[3]',
		'status_tampil'       => 'required',
		'keterangan' => 'required',
		'tgl_posting'=> 'required'
	];
	
	public $agenda_errors = [
		'nama_agenda'=> [
			'required'  => 'Agenda wajib diisi.',
			'min_length' => 'Agenda Minimal 3 Karakter'
		],
		'status_tampil'=> [
			'required'  => 'Status Agenda wajib diisi.'
		],
		'keterangan'=>[
			'required'  => 'Keterangan Agenda wajib diisi.'
		],
		'tgl_posting'=>[
			'required'  => 'Tanggal Agenda wajib diisi.'
		]
	];

	public $video = [
		'judul'         => 'required|min_length[3]',
		'status'       => 'required',
		'keterangan' => 'required',
		'link' => 'required',
		'id_categori' => 'required'
	];

	public $video_errors = [
		'judul'=> [
			'required'  => 'Judul wajib diisi.',
			'min_length' => 'Judul Minimal 3 Karakter'
		],
		'status'=> [
			'required'  => 'Status wajib diisi.'
		],
		'keterangan'=>[
			'required'  => 'Keterangan wajib diisi.'
		],
		'link'=>[
			'required'  => 'Url wajib diisi.'
		],
		'id_categori'=>[
			'required'  => 'Category wajib diisi.'
		]
	];

	
	public $article = [
		'judul'         => 'required|min_length[3]',
		'status'       => 'required',
		'content' => 'required',
		'tags' => 'required',
		'id_categori' => 'required'
	];

	public $article_errors = [
		'judul'=> [
			'required'  => 'Judul wajib diisi.',
			'min_length' => 'Judul Minimal 3 Karakter'
		],
		'status'=> [
			'required'  => 'Status wajib diisi.'
		],
		'content'=>[
			'required'  => 'Keterangan wajib diisi.'
		],
		'tags'=>[
			'required'  => 'Tags wajib diisi.'
		],
		'id_categori'=>[
			'required'  => 'Category wajib diisi.'
		]
	];
	//--------------------------------------------------------------------
	// Rules
	//--------------------------------------------------------------------
}
