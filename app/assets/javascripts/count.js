$(function (){
  // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）
  // フォームに入力されている文字数を数える
  // \nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
  var count = $("#js_phrase").text().replace(/\n/g, "改行").length;
  // 残りの入力できる文字数を計算
  var now_count = 60 - count;
  // 文字数がオーバーしていたら文字色を赤にする
  if (count > 60) {
    $(".js_phrase_count").css("color","red");
  }
  // 残りの入力できる文字数を表示
  $(".js_phrase_count").text( "残り" + now_count + "文字");
  $("#js_phrase").on("keyup", function() {
    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    // フォームのvalueの文字数を数える
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 60 - count;
    if (count > 60) {
      $(".js_phrase_count").css("color","red");
    } else {
      $(".js_phrase_count").css("color","#666");
    }
    $(".js_phrase_count").text( "残り" + now_count + "文字");
  });
});

$(function (){
  var count = $("#js_title").text().replace(/\n/g, "改行").length;
  var now_count = 20 - count;
  if (count > 20) {
    $(".js_title_count").css("color","red");
  }
  $(".js_title_count").text( "残り" + now_count + "文字");
  $("#js_title").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 20 - count;
    if (count > 20) {
      $(".js_title_count").css("color","red");
    } else {
      $(".js_title_count").css("color","#666");
    }
    $(".js_title_count").text( "残り" + now_count + "文字");
  });
});

$(function (){
  var count = $("#js_author").text().replace(/\n/g, "改行").length;
  var now_count = 12 - count;
  if (count > 12) {
    $(".js_author_count").css("color","red");
  }
  $(".js_author_count").text( "残り" + now_count + "文字");
  $("#js_author").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 12 - count;
    if (count > 12) {
      $(".js_author_count").css("color","red");
    } else { 
      $(".js_author_count").css("color","#666");
    }
    $(".js_author_count").text( "残り" + now_count + "文字");
  });
});

$(function (){
  var count = $("#js_text").text().replace(/\n/g, "改行").length;
  var now_count = 130 - count;
  if (count > 130) {
    $(".js_text_count").css("color","red");
  }
  $(".js_text_count").text( "残り" + now_count + "文字");
  $("#js_text").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 130 - count;
    if (count > 130) {
      $(".js_text_count").css("color","red");
    } else {
      $(".js_text_count").css("color","#666");
    }
    $(".js_text_count").text( "残り" + now_count + "文字");
  });
});