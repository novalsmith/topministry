    
 
		<div class="container pt-150">
			<div class="card card-profile shadow mt--300 pb-50" style="min-height:300px; margin-bottom:100px">
				<div class="d-flex justify-content-center">
					<img id="loading" style="height:15px; width:160px; margin-top:100px;" src="
						<?php echo base_url() ?>/top/assets/img/pages/loader.gif">
					</div>
					<div class="col-md-12 HidePage mt-2" id="alertMessagePage">
						<div class="alert alert-dismissible fade show" id="alertMessage" role="alert">
							<div id="MainMessage"></div>
							<button type="button" class="close" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</div>
					<div class="HidePage" id="CategoryPage">
						<div class="mb-1">
							<div class="row m-2 col-md-12">
								<h4 class="text text-muted">Top Ministry</h4>
							</div>
						 
							<div class="container mb-100 pb-100">
								 <div class="row  ml-0">
                                    <div class="col m-2"  style="background-color:#f5f7f9">
                                    <h5 class="text text-muted">Artikel</h5>
                                    </div>

                                    <div class="col m-2"  style="background-color:#f5f7f9">
                                    <h5 class="text text-muted">Kategori</h5>
                                    </div>


                                    
                                 </div>
							</div>
						</div>
					</div>
				</div>
			</div>

<script src="<?php echo base_url("top/assets/js/category.js?v=").JsandCssVersion ?>"></script>