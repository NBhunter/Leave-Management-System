<?php include 'db_connect.php' ?>
<style>
	td p {
		margin:unset;
	}
</style>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">Danh sách phiếu chi</div>
			<div class="card-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Thông tin phiếu</th>
							<th>Số tiền</th>
							<th>Trạng thái</th>
							<th>Người duyệt</th>
							<th>Ngày duyệt</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
					    <?php  $quy=10000000; ?>
						<?php 
						$i = 1;
						$types = $conn->query("SELECT * FROM leave_type");
						while($row=$types->fetch_assoc()){
							$lt[$row['id']] = ucwords($row['name']);
						}
						if($_SESSION['details']['type'] == 1)
						$where = '';
						if($_SESSION['details']['type'] == 2)
						$where = "and e.department_id = '".$_SESSION['details']['department_id']."' " ;
						if($_SESSION['details']['type'] == 3)
						$where = "and e.manager_id = '".$_SESSION['details']['id']."' " ;
						if($_SESSION['details']['type'] == 4)
							$where = "and e.supervisor_id = '".$_SESSION['details']['id']."' " ;


						$qry = $conn->query("SELECT ll.*,concat(e.lastname,', ',e.firstname,' ',e.middlename) as name,e.employee_id as eID FROM leave_list ll inner join employee_details e on e.id = ll.employee_id where ll.employee_id != '".$_SESSION['details']['id']."' $where ");
						while($row=$qry->fetch_assoc()):
							$action_by = 'N/A';
							if($row['status'] > 0){
								$emp = $conn->query("SELECT *,concat(firstname,' ',middlename,' ',lastname) as name from employee_details where id = ".$row['approved_by']);
								if($emp->num_rows > 0 ){
									$action_by = ucwords($emp->fetch_array()['name']);
								}
							}
						?>
						<tr>
							<td class="text-center"><?php echo $i++ ?></td>
							<td>
								<?php echo date("d/m/Y",strtotime($row['date_from'])) ?>
							</td>
							<td>
								<p>Nhân viên: <b><?php echo ucwords($row['name']). " (".$row['eID'].")" ?></b></p>
								<p>Lí do: <b><?php  echo ($row['reason']) ?></b></p>
								<p>Quỹ:<b><?php  if($row['type'] == 2 && $row['status'] == 1) {$quy=$quy-$row['money'];} echo $quy; ?></b></p>
								<?php if($row['type'] == 2): ?>
									<p>loại Chi: <b>Khách hàng</b></p>
								<?php elseif($row['type'] == 3): ?>
									<p>loại Chi: <b>Nhà cung cấp</b></b></p>
								<?php endif; ?>
							</td>
							<td>
								<?php echo $row['money'] ?>
							</td>
							<td class="text-center">
								<?php if($row['status'] == 0): ?>
									<span class="badge badge-primary">Chờ duyệt</span>
								<?php elseif($row['status'] == 1): ?>
									<span class="badge badge-success">Đã duyệt</span>
								<?php elseif($row['status'] == 2): ?>
									<span class="badge badge-success">Từ chối</span>
								<?php endif; ?>
							</td>
							<td>
								<?php echo $action_by ?>
							</td>
							<td><?php echo $row['status'] > 0 ? date("d/m/Y",strtotime($row['date_approved'])) : 'N/A' ?></td>
							<td class="text-center">
								<button class="btn btn-sm btn-outline-primary approved_leave" type="button" data-id="<?php echo $row['id'] ?>" >Đồng ý </button>
								<button class="btn btn-sm btn-outline-danger decline_leave" type="button" data-id="<?php echo $row['id'] ?>">Từ chối</button>
							</td>
						</tr>
					<?php endwhile;?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	$('.approved_leave').click(function(){
		_conf("Are you sure to approve this leave application?","action_leave",[$(this).attr('data-id'),1])
		
	})
	$('.decline_leave').click(function(){
		_conf("Are you sure to decline this leave application?","action_leave",[$(this).attr('data-id'),2])
	})
	function action_leave($id,$status){
		start_load()
		$.ajax({
			url:'ajax.php?action=action_leave',
			method:'POST',
			data:{id:$id,status:$status},
			success:function(resp){
				if(resp==1){
					alert_toast("Leave application succesffuly updated",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>