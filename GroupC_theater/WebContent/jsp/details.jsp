<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

</head>
<body>
<h1>映画詳細画面</h1>

<div align="center">
<div id="slick01">
<div><a href="#content01"><img src="building_tantei_jimusyo.png" width="500" height="400" alt="アイキャッチ画像01"></a></div>
<div><a href="#content02"><img src= "soccer_corner_man.png"width="750" height="400" alt="アイキャッチ画像02"></a></div>
<div><a href="#content03"><img src= "pose_nozoku_blind.png"width="750" height="400" alt="アイキャッチ画像03"></a></div>
<div><a href="#content04"><img src="tantei_boy.png" width="750" height="400" alt="アイキャッチ画像04"></a></div>
<div><a href="#content04"><img src= "tantei_hannin.png"width="750" height="400" alt="アイキャッチ画像05"></a></div>
</div>
</div>

<script type="text/javascript">
$(function(){
$('#slick01').slick({
autoplay: true, //自動再生
dots: true, //ドットインジケータの表示
});
});
</script>
<p>名探偵コナソ<BR></BR>

</p>
<form action="./selectDate.jsp">
<input type ="hidden" name="title_id" value="タイトル" >
<input type="submit" value="日付、時間帯選択ページへ" >
</form>
</body>

</html>