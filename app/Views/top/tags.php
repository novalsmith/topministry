    <!-- Modal -->
      

<!-- Modal Preview Video -->
<div class="modal fade" tabindex="-1" id="modalVideo" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="max-height:500px">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="TitleVideo"></h5>
            </div>
            <div class="modal-body">
                <div id="preview_img"></div>
                <h5 class="modal-title col-md-12 mt-2" id="preview_title"></h5>
               <div class="col-md-12" id="pageTagsDetail">
               </div>
                <div class="col-md-12 mt-2 ml-0" id="preview_download"></div>	
                <div class="col-md-12" id="preview_tags"></div>
            </div>
            <div class="modal-footer">
        
            <button type="button" id="modal-btn-false"  data-dismiss="modal" 
            class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out">
            <i class="fa fa-ban"></i> Cancel</button>
           
            </div>
          </div>
        </div>
    </div>
  </div>
<!-- Modal Preview Video -->

    
<div class="container pt-150">
	<div class="card card-profile shadow mt--300 pb-50" style="min-height:300px; margin-bottom:100px">
		<div class="d-flex justify-content-center">
			<img id="loading" style="height:15px; width:155px; margin-top:100px;" src="
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
			<div class="HidePage" id="VideoPage">
				<div class="mb-1">
					<div class="row m-2 col-md-12">
						<h4 class="text text-muted">Tags Setting</h4>
					</div>
					<div class="row m-2 pt-2 pb-2" style="background-color:#f5f7f9">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control form-control-alternative" id="searching" placeholder="Enter keywords">
								</div>
							</div>
						</div>
					</div>
					<div class="container mb-100 pb-100">
						<table id="TableTags" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>#</th>
									<th>Tag</th>
									<th>Artikel terkait</th>
									<th></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <script src="<?php echo base_url("top/assets/js/tags.js?v=").JsandCssVersion ?>"></script>