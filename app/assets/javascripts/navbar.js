$(document).ready(function() {
  $('ul.nav navbar-nav').on("click", function (event) {
    debugger
    $('nav navbar-nav li.active').removeClass('active');
    $(this).addClass('active');

  })

})