    <!-- Modal -->
    <div class="modal fade" id="CategoryModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
        <form id="FormVideo" name="FormVideo" enctype="multipart/form-data" method="post">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="CategoryModalLabel"></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
          
                <div class="form-group">
                <label for="agendaname">Judul</label>
                    <input type="text" class="form-control form-control-alternative" id="judul"
                    v-model="judul" name="judul" autocomplete="off" placeholder="Judul Video">
                </div>
             <div class="row">
             <div class="col">
             <div class="form-group">
                <label for="agendaname">URL</label>
                    <input type="url" class="form-control form-control-alternative" id="url"
                    v-model="url" name="url" autocomplete="off" placeholder="Contoh : http://topministry.net">
                </div>
                </div>
             <div class="col">
             <div class="form-group" id="CategoryPages">
                <label for="">Category</label>
                <select name="category" class="form-control" id="category">
                </select>
                </div>
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
                <select name="statusVideo" class="form-control" id="status" v-model="status">
                </select>
                </div>

                <div class="form-group" id="keterangan">
                <label for="">Keterangan</label>
              <textarea class="form-control" id="keterangan" name="keterangan" v-model="keterangan"></textarea>
                </div>
          
            </div>
            <div class="modal-footer">
            <button type="button" id="saveAddAgenda" v-on:click="create" v-show="!isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-floppy-o"></i> Save</button>
            <button type="button" id="saveUpdateAgenda"  v-on:click="UpdateAction" v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-floppy-o"></i> Save</button>
            <button type="button" id="btn-confirm"  v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-trash"></i> Delete</button>
            <button type="button" v-on:click="previewVideo" v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-eye"></i> Preview</button>
            <button type="button" id="closeCategory"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-ban"></i> Close</button>
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
              <h5 class="modal-title" id="CategoryModalLabels">Konfirmasi !</h5>
            </div>
            <div class="modal-body">
          
                <span>Anda yakin, untuk hapus data ini ?<span>
                </div>
            <div class="modal-footer">
            <button type="button" id="modal-btn-true" v-on:click="deleteAction" class="btn btn-primary btn-md pl--20" data-style="zoom-out"><i class="fa fa-trash"></i> Yes</button>
            <button type="button" id="modal-btn-false"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-ban"></i> No</button>
            </div>
          </div>
        </div>
    </div>
  </div>
<!-- End Confirm Delete -->

<!-- Modal Preview Video -->
<div class="modal fade" tabindex="-1" id="modalVideo" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="TitleVideo">Judul video</h5>
            </div>
            <div class="modal-body">
            <iframe width="700" height="415"   frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <div class="modal-footer">
        
            <button type="button" id="modal-btn-false"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-ban"></i>Cancel</button>
            </div>
          </div>
        </div>
    </div>
  </div>
<!-- Modal Preview Video -->

<!-- <div class="alert" role="alert" id="result"></div> -->
    <div class="container pt-150">
        <div class="card card-profile shadow mt--300 pb-50" style="min-height:300px; margin-bottom:100px">
        <div class="d-flex justify-content-center">
        <img id="loading" style="height:15px; width:155px; margin-top:100px;" src="<?php echo base_url() ?>/top/assets/img/pages/loader.gif"> 
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
                
                  <h4 class="text text-muted">Video</h4>
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
              
                <table id="TableVideo" class="table table-striped table-bordered" style="width:100%">
                <thead>
                  <tr>
                  <th>#</th>
                  <th>Judul</th>
                  <th>Kategori</th>
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
    
    <script src="<?php echo base_url("top/assets/js/video.js?v=").JsandCssVersion ?>"></script>