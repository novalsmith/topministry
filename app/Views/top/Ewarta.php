    
<!-- Modal -->
<div class="modal fade" id="CategoryModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<form id="FormWarta" name="FormWarta" enctype="multipart/form-data" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="agendaname">Judul</label>
						<input type="text" class="form-control form-control-alternative" id="judul"
                    v-model="judul" name="judul" autocomplete="off" placeholder="Judul Warta">
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group" id="waktu">
									<label for="waktu">Waktu</label>
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text">
												<i class="ni ni-calendar-grid-58"></i>
											</span>
										</div>
										<input class="form-control datepicker cursorPointer" name="waktu" autocomplete="off"
                    data-date-format='yyyy-mm-dd' placeholder="Select date" type="text" id="dateStart">
										</div>
									</div>
								</div>
								<div class="col">
									<div class="form-group" id="CategoryPages">
										<label for="">Category</label>
										<select name="category" class="form-control" id="category"></select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="poster">Poster</label>
										<input type="file" class="form-control form-control-alternative" id="fileuploadPoster" ref="filePoster"
                      name="fileuploadPoster">
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="filewarta">File Warta</label>
											<input type="file" class="form-control form-control-alternative" id="fileupload" ref="fileWarta" 
                    accept="application/pdf,application"  name="fileuploadWarta">
											</div>
										</div>
									</div>
									<div class="form-group" id="StatusPage" v-show="isUpdate">
										<label for="">Status</label>
										<select name="statusVideo" class="form-control" id="status" v-model="status">
											<option value=""></option>
											<option value="1">Active</option>
											<option value="0">No Active</option>
										</select>
									</div>
									<div class="form-group" id="keterangan">
										<label for="">Keterangan</label>
										<textarea class="form-control" id="keterangan" name="keterangan" v-model="keterangan"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" id="saveAddWarta" v-on:click="create" v-show="!isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
										<i class="fa fa-floppy-o"></i> Save
									</button>
									<button type="button" id="saveUpdateWarta"  v-on:click="UpdateAction" v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
										<i class="fa fa-floppy-o"></i> Save
									</button>
									<button type="button" id="btn-confirm"  v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
										<i class="fa fa-trash"></i> Delete
									</button>
									<button type="button" v-on:click="previewVideo" v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
										<i class="fa fa-eye"></i> Preview
									</button>
									<button type="button" id="closeCategory"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out">
										<i class="fa fa-ban"></i> Close
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- Confirm Delete -->
				<div class="modal fade" tabindex="-1" role="dialog"  aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="CategoryModalLabels">Confirm !</h5>
							</div>
							<div class="modal-body">
								<span>Are you sure, for delete this record ?
									<span>
									</div>
									<div class="modal-footer">
										<button type="button" id="modal-btn-true" v-on:click="deleteAction" class="btn btn-primary btn-md pl--20" data-style="zoom-out">
											<i class="fa fa-trash"></i> Yes
										</button>
										<button type="button" id="modal-btn-false"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out">
											<i class="fa fa-ban"></i> No
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Confirm Delete -->
					<!-- Modal Preview Video -->
					<div class="modal fade" tabindex="-1" id="modalVideo" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal" data-backdrop="static" data-keyboard="false">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="TitleVideo">Preview</h5>
								</div>
								<div class="modal-body">
									<div id="preview_img"></div>
									<h5 class="modal-title col-md-12 mt-2" id="preview_title"></h5>
									<div class="col-md-12">
										<div class="row text-muted m-1">
											<p id="preview_waktu" class="mr-2"></p> - &nbsp;&nbsp;
                    
											<p id="preview_kategori" class="mr-2"></p> -  &nbsp;&nbsp;
                    
											<p id="preview_status"></p>
										</div>
									</div>
									<div class="col-md-12 mt-2 ml-0" id="preview_download"></div>
									<div class="col-md-12" id="preview_tags"></div>
								</div>
								<div class="modal-footer">
									<button type="button" id="modal-btn-false"  data-dismiss="modal" 
            class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out">
										<i class="fa fa-ban"></i> Cancel
									</button>
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
										<h4 class="text text-muted">E-Warta</h4>
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
										<table id="TableEwarta" class="table table-striped table-bordered" style="width:100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Judul</th>
													<th>Waktu Terbitan</th>
													<th>Category</th>
													<th>Status</th>
													<th></th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

<script src="<?php echo base_url("top/assets/js/ewarta.js?v=").JsandCssVersion ?>"></script>