$(function () {
  $('#search').on('keyup', function () {
    var input = $(this).val();
    console.log(input);
    
    var url = window.location.href + '/api/articles'
    $.ajax({
      type: 'GET',
      url: url,
      data: {keyword: input},
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function (articles) {
      console.log(articles);
      
      
    })
    .fail(function () {
    
      
    });
  });

});