<?php 
$this->session = \Config\Services::session();
$this->session->start();

echo View("templates/header");
?> 

  <div id="MainApp">
      <nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom">
    <div class="container">
    <img src="<?php echo base_url('top/assets/img/pages/top.jpeg')?>" style="width:3%; height:30px" class="mr-2" />	 
      <a class="navbar-brand mr-lg-5" href="<?php echo base_url('main') ?>">
       TOP Ministry
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse" id="navbar_global">
        <div class="navbar-collapse-header">
          <div class="row">
            <div class="col-6 collapse-brand">
            TOP
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <ul class="navbar-nav navbar-nav-hover align-items-lg-center" id="menupage">
            <?php if(session()->get('roles')== 1) : ?>
              <li class="nav-item">
                <a class="nav-link nav-link-icon" href="<?php echo base_url('main/category') ?>">
                  <span class="nav-link-inner--text d-lg">Kategori</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link nav-link-icon" href="<?php echo base_url('main/agenda') ?>">
                  <span class="nav-link-inner--text d-lg">Agenda</span>
                </a>
              </li>
              <li class="nav-item">
              <a class="nav-link nav-link-icon" href="<?php echo base_url('main/video') ?>">
                  <span class="nav-link-inner--text d-lg">Video</span>
                </a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link nav-link-icon dropdown-toggle" href="javascript:;" id="navbar-success_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="nav-link-inner--text d-lg mr-1">Artikel</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbar-success_dropdown_1">
                  <a class="dropdown-item" href="<?php echo base_url('main/article') ?>">List Artikel</a>
                 
                  <a class="dropdown-item" href="<?php echo base_url('main/tags') ?>">Tags</a>
                 
              </li>
              
              <?php endif; ?>

              <?php if(session()->get('roles')== 0) : ?>
              <li class="nav-item">
              <a class="nav-link nav-link-icon" href="<?php echo base_url('main/article') ?>">
                  <span class="nav-link-inner--text d-lg">Artikel</span>
                </a>
              </li>
            <?php endif; ?>

            
              <?php if(session()->get('roles')== 1) : ?>
              <li class="nav-item">
                  <a class="nav-link nav-link-icon" href="<?php echo base_url('main/lookup') ?>">
                      <span class="nav-link-inner--text d-lg">Lookup</span>
                  </a>
              </li>
              <?php endif; ?>
        </ul>
        <ul class="navbar-nav align-items-lg-center navbar-nav-hover  ml-lg-auto">
          
        <li class="nav-item">
                <a class="nav-link nav-link-icon" href="javascript:;">
                  <span class="nav-link-inner--text d-lg" id="timeNow"></span>
                </a>

                <li class="nav-item dropdown">
                <a class="nav-link nav-link-icon dropdown-toggle" href="javascript:;" id="navbar-success_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="nav-link-inner--text d-lg mr-1"><?php  echo session()->get("name") ?></span> 
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbar-success_dropdown_1">
                  <a class="dropdown-item" href="<?php echo base_url('main/account') ?>">Akun</a>
                  <a class="dropdown-item" href="javascript:void(0)" onclick="Auth.logout()">Logout</a>
                </div>
              </li>

        </li>
        </ul>
      </div>
    </div>
  </nav>
  <section class="section-profile-cover section-shaped my-0">
      <!-- Circles background -->
      <img class="bg-image" src="<?php echo base_url() ?>/top/assets/img/pages/praise.jpg" style="width: 100%;">
      <!-- SVG separator -->
      <div class="separator separator-bottom separator-skew">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-secondary" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </section>
    
    <?php echo View($content); ?>
    
    </div> <!--End MainApp vue Control-->

</body>
</html>