    
<!-- Modal -->
<div class="modal fade" id="CategoryModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<form id="UploadAgenda" name="UploadAgenda" enctype="multipart/form-data" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="CategoryModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="agendaname">Agenda</label>
						<input type="text" class="form-control form-control-alternative" id="agendaname"
                    v-model="agenda" name="agendaname" autocomplete="off" placeholder="Agenda Name">
						</div>
						<div class="form-group" id="waktu">
							<label for="waktu">Waktu</label>
							<div class="input-group input-group-alternative">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="ni ni-calendar-grid-58"></i>
									</span>
								</div>
								<input class="form-control datepicker cursorPointer" name="waktu" autocomplete="off" placeholder="Select date" type="text" id="dateStart">
								</div>
							</div>
							<div class="form-group">
								<label for="agendaname">Poster</label>
								<input type="file" class="form-control form-control-alternative" id="fileupload" ref="file" v-model="fileupload"
                      name="fileupload">
									<div id="showimage" class="HidePage" style="margin-top:10px"></div>
								</div>
								<div class="form-group" id="StatusPage" v-show="isUpdate">
									<label for="">Status</label>
									<select name="status_posting" class="form-control" id="status_posting" v-model="status_posting"></select>
								</div>
								<div class="form-group" id="keterangan">
									<label for="">Keterangan</label>
									<textarea class="form-control" id="keterangan" name="keterangan" v-model="keterangan"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" id="saveAddAgenda" v-on:click="create" v-show="!isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
									<i class="fa fa-floppy-o"></i> Save
								</button>
								<button type="button" id="saveUpdateAgenda"  v-on:click="UpdateAction" v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
									<i class="fa fa-floppy-o"></i> Save
								</button>
								<button type="button" id="btn-confirm"  v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out">
									<i class="fa fa-trash"></i> Delete
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
			<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="CategoryModalLabels">Konfirmasi !</h5>
						</div>
						<div class="modal-body">
							<span>Anda yakin, untuk hapus data ini ?
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
										<h4 class="text text-muted">Agenda</h4>
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
										<table id="TableAgenda" class="table table-striped table-bordered" style="width:100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Agenda</th>
													<th>Waktu</th>
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

<script src="<?php echo base_url("top/assets/js/agenda.js?v=").JsandCssVersion ?>"></script>