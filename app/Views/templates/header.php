<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<title>
<?php echo $title ?>
</title>
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- Nucleo Icons -->
<link href="<?php echo base_url()?>/top/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="<?php echo base_url()?>/top/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<link href="<?php echo base_url()?>/top/assets/css/font-awesome.css" rel="stylesheet" />
<link href="<?php echo base_url()?>/top/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="<?php echo base_url()?>/top/assets/css/argon-design-system.css?v=1.2.0" rel="stylesheet" />
<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/ladda/dist/ladda-themeless.min.css"/>
<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/ladda/css/prism.css"/>
<link rel="stylesheet" href="<?php echo base_url()?>/top/assets/select2/select2-bootstrap4.min.css"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />


<!--   Core JS Files   -->

<script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="<?php echo base_url()?>/top/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
<script src="<?php echo base_url() ?>/top/assets/js/vuewjsProduction.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/additional-methods.js"></script>
<script src="<?php echo base_url() ?>/top/assets/ladda/dist/spin.min.js"></script>
<script src="<?php echo base_url() ?>/top/assets/ladda/dist/ladda.min.js"></script>
<script src="<?php echo base_url() ?>/top/assets/js/commond.js"></script>
<script type="text/javascript" src="<?php echo base_url() ?>/top/assets/ladda/js/prism.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script>

<!--   Core JS Files   -->




</head>
<style>
     
.container {
    max-width: 1140px;
}
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
.section-profile-cover {
    height: 300px;
    background-size: cover;
    background-position: bottom;
}

.modal-dialog {
    /* position: absolute; */
    /* float: left; */
    /* left: 35%; */
    top: 10%;
    /* transform: translate(-50%, -50%); */
}
.modal-footer {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    padding: 1.5rem;
    border-top: 1px solid #e9ecef;
    border-bottom-right-radius: 0.3rem;
    border-bottom-left-radius: 0.3rem;
}
.modal-body {
    position: relative;
    flex: 1 1 auto;
    padding: 1rem;
}
.HidePage{
    display : none;
}
.datepicker {
            font-size: 0.875em;
}
/* solution 2: the original datepicker use 20px so replace with the following:*/

.datepicker td, .datepicker th {
    width: 1.5em;
    height: 1.5em;
}
.cursorPointer{
    cursor:pointer;
}
.select2-container--bootstrap4 .select2-selection--single .select2-selection__placeholder {
    color: #c4c5c6;
    line-height: calc(0.5em + .15rem);
    font-size : 11pt;
}

</style>
<body class="profile-page">