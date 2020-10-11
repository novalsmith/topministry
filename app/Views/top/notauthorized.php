<?php echo View("templates/header"); ?>
<style>
#main {
    height: 100vh;
}
</style> 
<div class="d-flex justify-content-center align-items-center" id="main">
    <h1 class="mr-3 pr-3 align-top border-right inline-block align-content-center">401</h1>
    <div class="inline-block align-middle">
        <h2>Anda tidak mempunyai hak akses pada halaman ini. </h2>
        <h2 class="font-weight-normal lead" id="desc">Silahkan klik <a href="<?php echo base_url('main') ?>">disini</a> untuk ke halaman utama.</h2>
    </div>
</div>
