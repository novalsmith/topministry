<!-- Modal -->
<section id="articleDetail">
	<!-- Confirm Delete -->
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal" data-backdrop="static" data-keyboard="false">
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
		<div class="alert" role="alert" id="result"></div>
		<div class="container pt-150">
			<div class="card card-profile shadow mt--300 pb-50" style="min-height:300px; margin-bottom:100px">
				<div class="d-flex justify-content-center">
					<img id="loading" style="height:15px; width:155px; margin-top:100px;" src="
								
						<?php echo base_url() ?>/top/assets/img/pages/loader.gif">
					</div>
					<div class="HidePage" id="VideoPage">
						<div class="mb-1">
							<div class="row m-2 col-md-12">
								<h4 class="text text-muted">Article Detail</h4>
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
						<div class="container mb-100 pb-100">
							<form id="FormVideo" class="m-2" name="FormVideo" enctype="multipart/form-data" method="post">
								<div class="form-group">
									<label for="agendaname">Judul</label>
									<input type="text" class="form-control form-control-alternative" id="judul"
                            				v-model="judul" name="judul" autocomplete="off" placeholder="Judul">
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
												<input type="file" class="form-control form-control-alternative cursorPointer" id="fileupload" ref="file" v-model="fileupload"
                          										name="fileupload">
													<div id="showimage" class="HidePage" style="margin-top:10px"></div>
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
											<textarea name="content" id="content"></textarea>
										</div>
										<div class="col"> {{isUpdateStatus}}
														
											<button type="button" id="saveAddAgenda" v-on:click="test" v-show="!isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
												<i class="fa fa-floppy-o"></i> Save 
														
											</button>
											<button type="button" id="saveUpdateAgenda"  v-on:click="UpdateAction" v-show="isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
												<i class="fa fa-floppy-o"></i> Save
														
											</button>
											<button type="button" id="saveUpdateAgenda"  v-on:click="UpdateAction" v-show="isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
												<i class="fa fa-eye"></i> Preview
														
											</button>
											<button type="button" id="btn-confirm"  v-show="isUpdateStatus" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
												<i class="fa fa-trash"></i> Delete
														
											</button>
											<button type="button" id="closeCategory"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out">
												<i class="fa fa-ban"></i> Close
														
											</button>
										</div>
									</div>
									<!-- </div> -->
								</form>
							</div>
						</div>
					</div>
				</section>
<script src="<?php echo base_url("top/assets/js/articleDetails.js?v=").JsandCssVersion ?>"></script>