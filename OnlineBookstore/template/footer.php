
		<div class="py-3"></div>
    </div>

	<footer class="fixed-bottom py-3 px-2 bg-light">
			<div class="container-fluid px-5">
				<div class="d-flex justify-content-between">
					<div class="">
						<a href="index.php" class="text-decoration-none text-muted fw-bold">Kitap Dünyası 2023</a>
					</div>
					<div class="">
						<a href="admin.php" class="text-decoration-none text-muted fw-bolder">Admin</a>
					</div>
				</div>
			</div>
    </footer>
	<div class="clear-fix py-4"></div>


	<script type="text/javascript" src="./bootstrap/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.bundle.min.js"></script>

	<script>
		$(document).ready(function(){
			$("#search-form").on("keyup", function() {
				var value = $(this).val().toLowerCase();
				$("#filter div").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});
		});

	</script>
  </body>
</html>

