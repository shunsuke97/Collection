$(function(){
  function buildHTML(comment){
    var html = `<div class="comment">
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  </strong>
                  ${comment.text}
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    // console.log(formData)
    // console.log(url)
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.comments_input').val('');
      $('.comments_submit_btn').prop('disabled', false);
      $('html, body').animate({ scrollTop: $('html, body')[0].scrollHeight});
    })
    .fail(function(){
      alert('コメントが送信できません');
    })
  })
})