// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $(".my_profile").on("click", function(event) {

    event.preventDefault();
    hideAllContainersExcept(".user_profile_container")
    var url = $(this).attr("href");
    var request = $.ajax({
      method: "get",
      url: url,
      data: $(this).serialize()
    });

    request.done(function(data){
      var locals = { photos: data};
      var templateSource = $("#user_photo_show_template").html();
      var template = Handlebars.compile(templateSource);
      var output = template(locals);

    // debugger
      // $(".photo_stream_container").hide();
      $(".user_profile_container").html(output);
    });
  });



})
