(function () {
  

   var pages = [
    {
      title: 'ページはまだありません',
      url: '',
    }
  ];
  var getUrl = function () {
    var pageData = {
      title: '',
      url: '',
    }
    var pageUrl = location.href;
    
    if (pageUrl.match(/http:\/\/localhost:3000\/articles\/\d+$/)) {
      var pageTitle = document.querySelector('.article_show_title').textContent;
      pageData.title = pageTitle;
      pageData.url = pageUrl;
      
      pages.forEach(function (page, index) {
        if(pageData.url === page.url || page.title === 'ページはまだありません') {
          pages.splice(index, 1);
          return;
        }
      });
      
      if (pages.length > 9 ) {
        pages.pop();
      }
      pages.unshift(pageData);
    }
    if (document.querySelector('#app') === null) {
      return;
    }
    var vm = new Vue({
      el: '#app',
      data: {
        pages: pages
      },
      watch: {
        pages: {
          handler: function() {
            
            localStorage.setItem('pages', JSON.stringify(this.pages));
            
          },
          deep: true
        }
      },
    });
  
  }
  var pagesArray = JSON.parse(localStorage.getItem('pages'));
  if (pagesArray !== null) {
    pages = pagesArray;
  }
  document.addEventListener('turbolinks:load', function() {
  getUrl();
  });
  setInterval(getUrl, 3000);  
  
}
)();
