
<style>
	.collapse a{
		text-indent:10px;
	}
</style>
<nav id="sidebar" class='mx-lt-5 bg-dark' >
		
		<div class="sidebar-list">

				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-home"></i></span> Home</a>
				<?php if($_SESSION['login_type'] == 1): ?>
				<a href="index.php?page=all_applications" class="nav-item nav-all_applications"><span class='icon-field'><i class="fa fa-list-alt">	</i></span>Phiếu chi đã lập</a>
				<a href="index.php?page=all_applications_receipt" class="nav-item nav-all_applications"><span class='icon-field'><i class="fa fa-list-alt">	</i></span>Phiếu thu đã lập</a>
				<?php endif; ?>
				<?php if(isset($_SESSION['details']['type']) && $_SESSION['details']['type'] < 5 ): ?>
				<a href="index.php?page=applications" class="nav-item nav-applications"><span class='icon-field'><i class="fa fa-list-alt">	</i></span> Phiếu chi đã lập</a>
				<a href="index.php?page=applications_receipt" class="nav-item nav-applications_receipt"><span class='icon-field'><i class="fa fa-list-alt">	</i></span> Phiếu Thu đã lập</a>
				<?php endif; ?>
				<?php if(isset($_SESSION['details']['type']) && $_SESSION['details']['type'] > 1): ?>
				<!-- Lap phieu chi -->
				<a href="javascript:void(0)" class="nav-item" id="add_leave_customer"><span class='icon-field'><i class="fa fa-plus">	</i></span> Lập phiếu chi khách hàng</a>
				<a href="javascript:void(0)" class="nav-item" id="add_leave_supplier"><span class='icon-field'><i class="fa fa-plus">	</i></span> Lập phiếu chi nhà cung cấp</a>
				<a href="javascript:void(0)" class="nav-item" id="add_leave"><span class='icon-field'><i class="fa fa-plus">	</i></span> Lập phiếu chi </a>
				<!-- lap phieu thu -->
				<a href="javascript:void(0)" class="nav-item" id="add_receipt_customer"><span class='icon-field'><i class="fa fa-plus">	</i></span> Lập phiếu thu khách hàng</a>
				<a href="javascript:void(0)" class="nav-item" id="add_receipt_supplier"><span class='icon-field'><i class="fa fa-plus">	</i></span> Lập phiếu thu nhà cung cấp</a>
				<a href="javascript:void(0)" class="nav-item" id="add_receipt"><span class='icon-field'><i class="fa fa-plus">	</i></span> Lập phiếu thu</a>
				<!-- tao thong tin khach hang va ncc -->
				<a href="javascript:void(0)" class="nav-item" id="add_customer"><span class='icon-field'><i class="fa fa-plus">	</i></span> Thêm khách hàng</a>
				<a href="javascript:void(0)" class="nav-item" id="add_supplier"><span class='icon-field'><i class="fa fa-plus">	</i></span> Thêm nhà cung cấp</a>
				<a href="index.php?page=my_applications" class="nav-item nav-my_applications"><span class='icon-field'><i class="fa fa-th-list">	</i></span>Phiếu chi của tôi</a>
				<a href="index.php?page=my_applications_receipt" class="nav-item nav-my_applications_receipt"><span class='icon-field'><i class="fa fa-th-list">	</i></span>Phiếu thu của tôi</a>
				<?php endif; ?>
					

				<?php if($_SESSION['login_type'] == 1): ?>
				<a href="index.php?page=leave_type" class="nav-item nav-leave_type"><span class='icon-field'><i class="fa fa-th-list"></i></span> Note Type</a>
				<a href="index.php?page=department" class="nav-item nav-department"><span class='icon-field'><i class="fa fa-list"></i></span> Department</a>
				<a href="index.php?page=position" class="nav-item nav-position"><span class='icon-field'><i class="fa fa-list"></i></span> Position</a>
				<a href="index.php?page=employee" class="nav-item nav-employee"><span class='icon-field'><i class="fa fa-user-friends"></i></span> Employee List</a>
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users"></i></span> Users</a>
				<a href="index.php?page=offer_type" class="nav-item nav-leave_type"><span class='icon-field'><i class="fa fa-th-list"></i></span> Offer Type</a>
				
			<?php endif; ?>
		</div>

</nav>
<script>
	$('.nav_collapse').click(function(){
		console.log($(this).attr('href'))
		$($(this).attr('href')).collapse()
	})
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
	$('#add_leave_customer').click(function(){
		uni_modal("Phiếu chi Khách Hàng mới","manage_leave_customer.php","mid-large")
	})
	$('#add_leave_supplier').click(function(){
		uni_modal("Phiếu chi nhà cung cấp mới","manage_leave_supplier.php","mid-large")
	})
	$('#add_leave').click(function(){
		uni_modal("New Leave Application","manage_leave.php","mid-large")
	})
	$('#add_customer').click(function(){
		uni_modal("Thêm khách hàng mới","manage_customer.php","mid-large")
	})
	$('#add_supplier').click(function(){
		uni_modal("Thêm nhà cung cấp mới","manage_supplier.php","mid-large")
	})
	$('#add_receipt_customer').click(function(){
		uni_modal("Phiếu Thu khách hàng mới","manage_receipt_customer.php","mid-large")
	})
	$('#add_receipt_supplier').click(function(){
		uni_modal("Phiếu Thu nhà cung cấp mới","manage_receipt_repplier.php","mid-large")
	})
	$('#add_receipt').click(function(){
		uni_modal("Phiếu Thu  mới","manage_receipt.php","mid-large")
	})
</script>
