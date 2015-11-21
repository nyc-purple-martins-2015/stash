// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $(".my_stash").on("click", function(event) {
    event.preventDefault();

    $(".photo_stream").hide();

    $.get("/stashes/show").done(function(data) {
    debugger
      var locals = {photos: data}
      var templateSource = $("#mystash-template").html();

      var template = Handlebars.compile(templateSource);
      var output = template(locals);
      $(".my_stash").html(output);

    })

  })



})
