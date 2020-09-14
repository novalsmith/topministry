    <!-- Modal -->
    <div class="modal fade" id="CategoryModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
        <form id="FormCategory">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="CategoryModalLabel"></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                <label for="">Category</label>
                    <input type="text" class="form-control form-control-alternative" id="categoryname"
                    v-model="CategoryName" name="categoryname" autocomplete="off" placeholder="Category Name">
                </div>
                <div class="form-group" id="StatusPage" v-show="isUpdate">
                <label for="">Status</label>
                <select name="statusCategory" class="form-control" v-model="statusCategory" id="statusCategory">
                </select>
                </div>
            </div>
            <div class="modal-footer">
            <button type="button" id="saveAddCategory" v-on:click="create" v-show="!isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-floppy-o"></i> Save</button>
            <button type="button" id="saveUpdateCategory" v-on:click="UpdateAction" v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-floppy-o"></i> Save</button>
            <button type="button" id="btn-confirm" v-show="isUpdate" class="btn btn-primary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-trash"></i> Delete</button>
            <button type="button" id="closeCategory"  data-dismiss="modal" class="btn btn-secondary btn-md pl--20 ladda-button" data-style="zoom-out"><i class="fa fa-ban"></i> Close</button>
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
              <h5 class="modal-title" id="CategoryModalLabels">Confirm !</h5>
            </div>
            <div class="modal-body">
          
                <span>Are you sure, for delete this record ?<span>
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

    <div class="container pt-150">
        <div class="card card-profile shadow mt--300 pb-50" style="min-height:300px; margin-bottom:100px">
        <div class="d-flex justify-content-center">
        <img id="loading" style="height:15px; width:160px; margin-top:100px;" src="<?php echo base_url() ?>/top/assets/img/pages/loader.gif"> 
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
                
                  <h4 class="text text-muted">Category</h4>
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
                <table id="TableCategory" class="table table-striped table-bordered" style="width:100%">
                <thead>
                  <tr>
                  <th>#</th>
                  <th>Category Name</th>
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
    
    <script src="<?php echo base_url("top/assets/js/category.js?v=").JsandCssVersion ?>"></script>