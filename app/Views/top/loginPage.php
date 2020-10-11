<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="<?php echo base_url('top/assets/img/pages/top.jpeg')?>">
<link rel="icon" type="image/png" href="<?php echo base_url('top/assets/img/pages/top.jpeg')?>">
<title>
Login Page <?php echo $title ?>
</title>
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<!-- Nucleo Icons -->
<link href="<?php echo base_url()?>/top/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="<?php echo base_url()?>/top/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<link href="<?php echo base_url()?>/top/assets/css/font-awesome.css" rel="stylesheet" />
<link href="<?php echo base_url()?>/top/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="<?php echo base_url()?>/top/assets/css/argon-design-system.css?v=1.2.0" rel="stylesheet" />
<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/ladda/css/ladda-theme.scss">
<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/ladda/css/ladda.scss">
		<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/ladda/css/prism.css">
</head>
<style>
.card-body {
    flex: 1 1 auto;
    padding: 1.5rem;
	background-color:white;
	border: 1px solid #efefef; 
}
.error{
    font-size: 0.875rem;
    margin-bottom: 15px;
    color: orangered;
}
.spaceBottom-10{
    margin-bottom:15px;
}
.section {
    position: relative;
    padding-top: 0rem;
    padding-bottom: 0rem;
} 
.HidePage{
    display : none;
}
 
</style>
<body>
<!-- Navbar --> 
     
<div class="container">
	<div class="section">
		<div class="d-flex mt-2 pt-2">
				<div class="col-md-12 col-sm-12">
					<div class="row justify-content-center">
						<div class="col-lg-6 mt-4 mt-lg-0">
						<center>
						<img src="<?php echo base_url('top/assets/img/pages/top.jpeg')?>" style="width:30%" class="img-responsive" />	
						</center>
							<nav class="navbar navbar-expand-lg navbar-dark bg-primary rounded">
								<div class="container">
								
									<a class="navbar-brand" href="javascript:;"> <?php echo $title ?> </a>
									<button class="navbar-toggler" type="button" data-toggle="collapse" 
                                    data-target="#nav-inner-primary" aria-controls="nav-inner-primary" 
                                        -expanded="false" aria-label="Toggle navigation">
									</button>
								</div>
							</nav>
							<div class="card-body mt-3 rounded">
								<form role="form" id="formLoginPage">
									<div class="col-md-12 alert alert-danger HidePage" id="messageError"></div>
									<div class="col-md-12 alert alert-primary HidePage" id="messageSuccess"></div>
									
									<div class="row">
										<div class="col-md-12">
											<div class="spaceBottom-10">
												<lable class="text text-muted">Email</lable>
											</div>
											<div class="form-group mb-3">
												<input class="form-control rounded-0" autocomplete="off" 
                           						 name="email" id="email" placeholder="Email" type="email" require>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="spaceBottom-10">
													<lable class="text text-muted">Password</lable>
												</div>
												<div class="form-group mb-3">
													<input class="form-control rounded-0" 
                          						  placeholder="Password" id="password" name="password" type="password" require>
													</div>
												</div>
											</div>
											<div class="text-left">
												<button type="button" id="buttonLogin" class="btn btn-primary my-4 ladda-button" data-style="zoom-out">Sign in</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--   Core JS Files   -->
<script src="<?php echo base_url()?>/top/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
<script src="<?php echo base_url()?>/top/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/additional-methods.js"></script>
<script src="<?php echo base_url() ?>/top/assets/js/commond.js"></script>
<script src="<?php echo base_url() ?>/top/assets/ladda/js/spin.js"></script>
<script src="<?php echo base_url() ?>/top/assets/ladda/js/ladda.js"></script>
<script type="text/javascript" src="<?php echo base_url() ?>/top/assets/ladda/js/prism.js"></script>
 
</body>
</html>