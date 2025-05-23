<?php
  session_start();
  $count = 0;
  require_once "./functions/database_functions.php";
  $conn = db_connect();

  $query = "SELECT book_isbn, book_image, book_title FROM books";
  $result = mysqli_query($conn, $query);
  if(!$result){
    echo "Veriler alınamıyor." . mysqli_error($conn);
    exit;
  }

  $title = "Tüm Kitaplar";
  require_once "./template/header.php";
?>

  <h4 class=" fw-bolder text-center">Tüm Kitaplar</h4>
    <center>
      <hr class="bg-danger" style="width:5em;height:3px;opacity:1">
    </center>
    <?php for($i = 0; $i < mysqli_num_rows($result); $i++){ ?>
      <div class="row" id="filter">
        <?php while($book = mysqli_fetch_assoc($result)){ ?>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 py-2 mb-2">
      		<a href="book.php?bookisbn=<?php echo $book['book_isbn']; ?>" class="card rounded-0 shadow book-item text-reset text-decoration-none">
            <div class="img-holder overflow-hidden">
              <img class="img-top" src="./bootstrap/img/<?php echo $book['book_image']; ?>">
            </div>
            <div class="card-body">
              <div class="card-title fw-bolder h5 text-center"><?= $book['book_title'] ?></div>
            </div>
          </a>
      	</div>
        <?php
          $count++;
          if($count >= 4){
              $count = 0;
              break;
            }
          } ?> 
      </div>
<?php
      }
  if(isset($conn)) { mysqli_close($conn); }
  require_once "./template/footer.php";
?>