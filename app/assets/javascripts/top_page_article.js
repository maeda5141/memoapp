$(function () {
  $(document).on('turbolinks:load', function () {
    
    $('#search').on('keyup', function () {
      var input = $(this).val();
      var page = Number($('.current').text());
      var url = location.origin + '/api/articles';
      
      $.ajax({
        type: 'GET',
        url: url,
        data: {
          keyword: input,
          page: page
        },
        dataType: 'json'
      })
      .done(function (articles) {
        $('.article').remove();
        articles.forEach(function (article) {
          $('.article_list').append(`
          <li class="article">
          <div class="article__title">
          <a href="/articles/${article.id}" %>
          ${article.title}
          </a>
          </div>
          <p>${article.userName}さんの投稿</p>
          </li>
          `);
          
        } );
        
      })
      .fail(function () {
        alert('投稿を取得できませんでした');
        
      });
    });
  });

});