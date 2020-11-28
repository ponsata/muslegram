$(function(){
  $('.youtube').each(function() {
    let iframe = $(this).children('iframe');
    let url = iframe.attr('data-src');
    let id = url.match(/[\/?=]([a-zA-Z0-9_-]{11})[&\?]?/)[1];
    iframe.before('<img src="http://img.youtube.com/vi/'+id+'/mqdefault.jpg" />').remove();
    $(this).on('click', function() {
      $(this).after('<div class="youtube"><iframe src="https://www.youtube.com/embed/'+id+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>').remove();
    });
  });
});