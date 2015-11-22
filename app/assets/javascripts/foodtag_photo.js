// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $(".search").on("click", function(event) {
    event.preventDefault();

    hideAllContainersExcept(".foodtag_container")

    $.get("/foodtags").done(function(data) {

      var locals = {foodtags: data};
      var templateSource = $("#foodtag-template").html();
      var template = Handlebars.compile(templateSource);
      var output = template(locals);
      // debugger

      $(".foodtag_container").html(output);

    });
  });

  $(document).on("click", ".foodtags", function(event) {
    event.preventDefault();

    hideAllContainersExcept(".filtered_photos_container")
    // $(".photo_stream_container").html("");

    var foodtag_photos_id = $(".foodtags").attr("data-id")

    $.get("/foodtags/" + foodtag_photos_id).done(function(data) {
      var locals = { photos: data};
      var templateSource = $("#filter-template").html();
      var template = Handlebars.compile(templateSource);
      var output = template(locals);
      // debugger

      $(" .filtered_photos_container").html(output);
    })


  })
});

