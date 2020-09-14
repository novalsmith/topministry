<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<title>
Login Page TOP Ministry
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
<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/ladda/dist/ladda-themeless.min.css">
		<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/ladda/css/prism.css">
</head>
<style>
.card-body {
    flex: 1 1 auto;
    padding: 1.5rem;
    background-color: ghostwhite;
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
</style>
<body>
<!-- Navbar --> 
    <div class="container" id="app">
        <div class="section">
            <div class="row justify-content-center mt-md">
                <div class="col-lg-12">
            <!-- Menu -->
            <h3 class="h4 text-success font-weight-bold mb-4">Login</h3>
            <div class="row">
            <div class="col-lg-6 mt-4 mt-lg-0">
                <nav class="navbar navbar-expand-lg navbar-dark bg-success rounded">
                <div class="container">
                    <a class="navbar-brand" href="javascript:;">{{setText}}</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav-inner-success" aria-controls="nav-inner-success" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    </div>
                </nav>
                <div class="card-body mt-3 rounded">
                <form role="form" id="formLoginPage">
                <div class="row">
                    <div class="col-md-12">
                        <div class="spaceBottom-10">
                            <lable class="text text-muted">Username</lable>
                        </div>
                        <div class="form-group mb-3">
                            <input class="form-control rounded-0" v-model="username" 
                            name="username" placeholder="Username" type="text" require>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="spaceBottom-10">
                            <lable class="text text-muted">Password</lable>
                        </div>
                        <div class="form-group mb-3">
                            <input class="form-control rounded-0" v-model="password"
                            placeholder="Password" name="password" type="password" require>
                        </div>
                    </div>
                </div>
                <div class="text-left">
                <button type="button" id="buttonLogin" class="btn btn-success my-4 ladda-button" data-style="zoom-out">Sign in</button>
                </div>
            </form>
        </div>
        </div>
            </div>
            </div>
            </div>
        </div>
    </div>

<!--   Core JS Files   -->
<script src="<?php echo base_url()?>/top/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="<?php echo base_url()?>/top/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php echo base_url() ?>/top/assets/js/vuewjsProduction.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/additional-methods.js"></script>
<script src="<?php echo base_url() ?>/top/assets/js/custom.js"></script>
<!-- <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script> -->
<script src="<?php echo base_url() ?>/top/assets/ladda/dist/spin.min.js"></script>
		<script src="<?php echo base_url() ?>/top/assets/ladda/dist/ladda.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() ?>/top/assets/ladda/js/prism.js"></script>
 
		
</body>

</html>