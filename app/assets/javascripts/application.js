// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require_tree .
// require jquery_ujs


$(function() {
  // generate embed URL
  function generate_html(id) {
    return $('<iframe>',{ src: first_part_url + id + latter_part_url,
                          frameborder: 0,
                          sandbox: "allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation-by-user-activation",
                          allow: "autoplay *; encrypted-media *;",
                          style: "height: 450px; width: 100%; max-width: 450px; overflow: hidden; border-radius: 10px; background: transparent;" });
  }

  $(document).on('turbolinks:load', function() {
    // like button popup
    $('#like_form').hover(
      function() {
        $('#like_popup').css('display', 'block');
      },
      function() {
        $('#like_popup').css('display', 'none');
      }
    );

    // scrollbar for search results
    $('#results').mCustomScrollbar();
  
    // back-to-top button
    $('#back_to_top').click(function() {
      $('html, body').animate({ 'scrollTop': 0 }, 'slow');
    });

    // switch home slide images
    $('.index_btn').click(function() {
      var clickedIndex = $('.index_btn').index(this);
      if ( clickedIndex != index ) {
        $slide.eq(index).css('display', 'none');
        $info.eq(index).css('display', 'none');
        index = clickedIndex;
        $slide.eq(index).fadeIn();
        $info.eq(index).fadeIn();
      }
    });
  });
});  