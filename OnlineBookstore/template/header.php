<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kitap Dünyası</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" />
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./bootstrap/css/styles.css" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" integrity="sha512-6PM0qYu5KExuNcKt5bURAoT6KCThUmHRewN3zUFNaoI6Di7XJPTMoT6K0nsagZKk2OB4L7E3q1uQKHNHd4stIQ==" crossorigin="anonymous" ></script>
  </head>

  <body>
    <div class="clear-fix pt-5 pb-3" ></div>
    <nav style="background-color:#570e0e;" class="navbar navbar-expand-lg navbar-expand-md navbar-dark fixed-top">
      <div class="container-fluid px-5">
        <div class="navbar-header">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNav" aria-controls="topNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
          <a class="navbar-brand" href="index.php">Kitap Dünyası</a>
        </div>

        <!--/.navbar-collapse -->
        <div class="collapse navbar-collapse" id="topNav">
          <ul class="nav navbar-nav">
            <?php if(isset($_SESSION['admin']) && $_SESSION['admin'] == true): ?>
                <li class="nav-item"><a class="nav-link" href="admin_book.php"><span class="fa fa-th-list"></span> Kitap Listesi</a></li>
                
                <li class="nav-item"><a class="nav-link" href="admin_add.php"><span class="far fa-plus-square"></span> Yeni Kitap Ekle</a></li>
                <li class="nav-item"><a class="nav-link" href="admin_signout.php"><span class="fa fa-sign-out-alt"></span> Çıkış</a></li>
            <?php else: ?>
              
              <li class="nav-item"><a class="nav-link" href="category_list.php"><span class="fa fa-book-open"></span> Kategoriler</a></li>
              <li class="nav-item"><a class="nav-link" href="books.php"><span class="fa fa-book"></span> Kitaplar</a></li>
              <li class="nav-item"><a class="nav-link" href="cart.php"><span class="fa fa-shopping-cart"></span> Sepetim</a></li>

            <?php endif; ?>
          </ul>
        </div>
        <div>
          <form class="form-inline pt-1 px-2" >
            <div class="input-group">
              <input class="form-control form-control-sm form px-4" id="search-form" type="search" placeholder="Kitap Ara" aria-label="Search" name="search" aria-describedby="button">
              <div class="input-group-append">
                <button class="btn btn-outline-light btn-sm m-0"  id="button"><i class="fa fa-search"></i></button>
              </div>
            </div>
          </form>

        </div>
      </div>
    </nav>

    <div class="container" id="main">

