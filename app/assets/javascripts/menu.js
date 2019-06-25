$(function () {
  $(document).on('turbolinks:load', function() {
    
    $('.icon').on('mouseover', function () {
      $('.menu').css('display', 'block');
    }).on('mouseout', function () {
      $('.menu').css('display', 'none');
    });
    $('.menu').on('mouseover', function () {
      $(this).css('display', 'block');
    }).on('mouseout', function () {
      $(this).css('display', 'none');
    });
    $('.select_area #delete').on('click', function () {
      let pop = confirm('このメモを削除しますか？');
    
    if (pop === false ) {
    return false;
    }
    });
  });
});