$(function () {
  $(document).on('turbolinks:load', function() {
    

    $('.header_button_user').on('click', function () {
      $('.menu').slideToggle();
    });
    $(document).on('click', function () {
      if($(event.target).closest('.header_button_user').length === 0) {
        $('.menu').css('display', 'none');
      }
    })
    $('.select_area #delete').on('click', function () {
      let pop = confirm('このメモを削除しますか？');
    
    if (pop === false ) {
    return false;
    }
    });
  });
});