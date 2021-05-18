<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Sample</title>
	    <!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
	  </head>
  <body>
	<header style="background-color:gray">Header</header>
	<div class="container-fluid">
	  <div class="row">
	    <div class="col-sm-2" style="background-color:red;">Red</div>
	    <div class="col-sm-8" style="background-color:blue;">Blue</div>
	    <div class="col-sm-2" style="background-color:yellow;">Yellow</div>
	  </div>
	</div>
	<footer style="background-color:gray">Footer</footer>

	<br><br><br>
	<div class="container">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>名前</th>
        <th>メールアドレス</th>
        <th>電話番号</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">1</th>
          <td>煌木 太郎</td>
          <td>taro.kirameki@example.com</td>
          <td>09011112222</td>
      </tr>
      <tr>
        <th scope="row">2</th>
          <td>煌木 次郎</td>
          <td>jiro.kirameki@example.com</td>
          <td>09033334444</td>
      </tr>
      <tr>
        <th scope="row">3</th>
          <td>煌木 花子</td>
          <td>hanako.kirameki@example.com</td>
          <td>09055556666</td>
      </tr>
    </tbody>
  </table>

	<br><br><br>
	<form action="#">
		<button type="submit" class="btn btn-default">Default</button>
		<button type="submit" class="btn btn-primary">Primary</button>
		<button type="submit" class="btn btn-success">Success</button>
		<button type="submit" class="btn btn-info">Info</button>
		<button type="submit" class="btn btn-warning">Warning</button>
		<button type="submit" class="btn btn-danger">Danger</button>
		<button type="submit" class="btn btn-link">Link</button>
	</form>

	<br><br><br>
	<form>
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email address</label>
	    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputFile">File input</label>
	    <input type="file" id="exampleInputFile">
	    <p class="help-block">Example block-level help text here.</p>
	  </div>
	  <div class="checkbox">
	    <label>
	      <input type="checkbox"> Check me out
	    </label>
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

</html>