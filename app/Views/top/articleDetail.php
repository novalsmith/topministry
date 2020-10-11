    


<!-- Confirm Delete -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal-detail" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="CategoryModalLabels">Konfirmasi !</h5>
            </div>
            <div class="modal-body">
          
                <span>Anda yakin, untuk hapus data ini ?<span>
                </div>
            <div class="modal-footer">
            <button type="button" id="modal-btn1-true"  class="btn btn-primary btn-md pl--20" data-style="zoom-out"><i class="fa fa-trash"></i> Yes</button>
            <button type="button" id="modal-btn1-false"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-ban"></i> No</button>
            </div>
          </div>
        </div>
    </div>
    </div>

<!-- End Confirm Delete -->

<!-- Modal -->
<section id="articleDetail">
	<div class="container pt-150">
		<div class="card card-profile shadow mt--300 pb-50" style="min-height:300px; margin-bottom:20px">
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
				<div class="HidePage" id="articleDetailPage">
					<div class="mb-1">
						<div class="row m-2 col-md-12">
							<h4 class="text text-muted">Detil Artikel</h4>
						</div>
					
					</div>
					<div class="container" style="margin-bottom: 30px;">
						<form id="FormArticleDetail" class="m-2" name="FormArticleDetail" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label for="agendaname">Judul</label>
								<input type="text" class="form-control form-control-alternative" id="judul"
                            		name="judul" autocomplete="off" placeholder="Judul">
								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="agendaname">Tags Article</label>
											<select name="tags" class="form-control cursorPointer" id="tags" multiple="multiple"></select>
										</div>
									</div>
									<div class="col">
										<div class="form-group" id="CategoryPages">
											<label for="">Category</label>
											<select name="category" class="form-control cursorPointer" id="category"></select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="agendaname">Poster</label>
											<input type="file" class="form-control form-control-alternative cursorPointer" 
															id="fileupload" ref="file" v-model="fileupload" name="fileupload">
											</div>
										</div>
										<div class="col">
											<div class="form-group" id="StatusPage" v-show="isUpdateStatus">
												<label for="">Status</label>
												<select name="status" class="form-control" id="status" v-model="status"></select>
											</div>
										</div>
									</div>
									<div class="form-group" id="keterangan">
										<label for="">Keterangan</label>
										<textarea name="keterangan" id="content"></textarea>
										<span class="text text-danger" id="errorKeterangan"></span>
									</div>
									<div class="col" style="margin-bottom: 30px;">
										<button type="button" id="saveAdd"  v-on:click="create"   v-show="!isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
											<i class="fa fa-floppy-o"></i> Save 
														
										</button>
										<button type="button" id="saveUpdate"  v-on:click="update"   v-show="isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
											<i class="fa fa-floppy-o"></i> Save
														
										</button>
										<button type="button" id="showPreview"  v-on:click="preview"  v-show="isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
											<i class="fa fa-eye"></i> Preview
														
										</button>
										<button type="button" id="btn-confirm-detail"  v-show="isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
											<i class="fa fa-trash"></i> Delete 
														
										</button>
										<button type="button" id="closeCategorysss" v-on:click="closewindowPage()"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out">
											<i class="fa fa-ban"></i> Close
														
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- Modal -->
<section id="articleDetailPreview" class="HidePage">
	<div class="container pt-150">
		<div class="card card-profile shadow mt--300 pb-50" style="margin-bottom:20px; min-height:300px; height:auto">
		<div class="d-flex justify-content-center">
				<img id="loadingPreview" style="height:15px; width:155px; margin-top:100px;" src="
					<?php echo base_url() ?>/top/assets/img/pages/loader.gif">
			</div>
				<div class="HidePage" id="articleDetailPagePreview">
					<div class="mb-1">
						<div class="row m-2 col-md-12">
							<h4 class="text text-muted">Preview</h4>
						</div>
						<div class="col-md-12 HidePage" id="alertMessagePage">
							<div class="alert alert-dismissible fade show" id="alertMessage" role="alert">
								<div id="MainMessage"></div>
								<button type="button" class="close" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<div class="container" style="margin-bottom: 30px;">
					
						<div class="col-md-12">	<h1 id="preview_title"></h1></div>
						<div id="preview_img"></div>
						<div class="col-md-12 mt-5 mb-5" id="preview_content"></div>	
						<div class="col-md-12" id="preview_tags"></div>
					
						<div class="col-md-12" style="margin-bottom: 30px;margin-top: 30px;">
						<button type="button" id="closepage" v-on:click="closewindow()"  data-dismiss="modal" class="btn btn-secondary btn-md ladda-button" data-style="zoom-out">
							<i class="fa fa-ban"></i> Close
						</button>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</section>
	
	<script src="<?php echo base_url("top/assets/js/commond.js?v=").JsandCssVersion ?>"></script>  
	<script src="<?php echo base_url("top/assets/js/articleDetails.js?v=").JsandCssVersion ?>"></script>  