<?php namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->setAutoRoute(true);

$routes->set404Override(function() {
	$page = [
		'title'   => '404 Halaman tidak ditemukan'
	];
	return view('top/notfound',$page);
});
 
 
$routes->get('auth', 'page/top/auth::index');
$routes->get('auth/logout', 'page/top/auth::logout',['filter' => 'authfilter']);

// for identify original url 
$routes->group('page/top/main', ['filter' => 'authfilter'], function($routes) {
    $routes->get('/', 			'page/top/main::index');
	$routes->get('category',		'page/top/main::category');
	$routes->get('agenda', 			'page/top/main::agenda');
	$routes->get('video', 			'page/top/main::video');
	$routes->get('article', 		'page/top/main::article');
	$routes->get('articledetail', 	'page/top/main::articledetail');
	$routes->get('lookup', 			'page/top/main::lookup');
	$routes->get('tags', 			'page/top/main::tags');
	$routes->get('account', 		'page/top/main::account');
});

// for identify route url
$routes->group('main', ['filter' => 'authfilter'], function($routes) {
    $routes->get('/', 			'page/top/main::index');
	$routes->get('category',		'page/top/main::category');
	$routes->get('agenda', 			'page/top/main::agenda');
	$routes->get('video', 			'page/top/main::video');
	$routes->get('article', 		'page/top/main::article');
	$routes->get('articledetail', 	'page/top/main::articledetail');
	$routes->get('lookup', 			'page/top/main::lookup');
	$routes->get('tags', 			'page/top/main::tags');
	$routes->get('account', 		'page/top/main::account');
});
 
/**
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
 

