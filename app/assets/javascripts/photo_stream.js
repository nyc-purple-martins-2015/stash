$(document).ready(function() {
  $.get("/home/show").done(function(data){
    var locals = { photos: data};
    var templateSource = $("#photostream-template").html();
    var template = Handlebars.compile(templateSource);
    var output = template(locals);
    // console.log(output);
    debugger
    $(".photo_stream_container").html(output);

  });
});
