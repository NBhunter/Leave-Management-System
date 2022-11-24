<?php include('db_connect.php');?>

<div class="container-fluid">
	
	<div class="col-lg-12">
		<div class="row mb-4 mt-4">
			<div class="col-md-12">
				
			</div>
		</div>
		<div class="row">
			<!-- FORM Panel -->

			<!-- Table Panel -->
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>Danh sách tháng</b>
						<span class="float:right"><button class="btn btn-primary btn-block btn-sm col-sm-2 float-right" type="button" id="new_leave">
					<i class="fa fa-plus"></i> Thêm tháng
				</button></span>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="">Loại tháng</th>
									<th class="">Mô tả</th>
									<th class="text-center">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$types = $conn->query("SELECT * FROM leave_type order by id asc");
								while($row=$types->fetch_assoc()):
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									
									<td class="">
										 <p><b><?php echo ucwords($row['name']) ?></b></p>
										 
									</td>
									<td>
										<?php echo $row['description'] ?>
									</td>
									<td class="text-center">
										<button class="btn btn-sm btn-outline-primary edit_leave_type" type="button" data-id="<?php echo $row['id'] ?>" >Sửa</button>
										<button class="btn btn-sm btn-outline-danger delete_leave_type" type="button" data-id="<?php echo $row['id'] ?>">Xóa</button>
									</td>
								</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	

</div>
<style>
	
	td{
		vertical-align: middle !important;
	}
	td p{
		margin: unset
	}
	img{
		max-width:100px;
		max-height: :150px;
	}
</style>
<script>
	$(document).ready(function(){
		$('table').dataTable()
	})
	$('#new_leave').click(function(){
		uni_modal("New Leave Type","manage_leave_type.php")
	})
	
	$('.edit_leave_type').click(function(){
		uni_modal("Edit Leave Type","manage_leave_type.php?id="+$(this).attr('data-id'))
		
	})
	$('.delete_leave_type').click(function(){
		_conf("Are you sure to delete this leave type?","delete_leave_type",[$(this).attr('data-id')])
	})
	
	function delete_leave_type($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_leave_type_type',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>