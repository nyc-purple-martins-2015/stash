// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $(".my_profile").on("click", function(event) {
    // event.preventDefault();
    // // var user_path = $('.my_profile').attr("href")
    // // debugger

    // $(".photo_stream_container").hide();

    // $.get(user_path).done(function(user_info) {
    //   debugger
    //     var locals = {user: user_info}
    //     var templateSource = $("#profile-template").html();
    //     var template = Handlebars.compile(templateSource);
    //     var output = template(locals);
    //     $(".my_info_container").html(output);
    // })

    // $.get(user_path + "/photos/show").done(function(data) {
    //     // debugger
    //   var error = "You don't have any photos! Go out and eat!"

    //   if (data.message === error) {
    //     var templateSource = $("#error-template").html();
    //     var template = Handlebars.compile(templateSource);
    //     var output = template(data);
    //     $(".errors_container").html(data.message);
    //   } else {
    //     var locals = {photos: data}
    //     var templateSource = $("#user-photos-template").html();
    //     var template = Handlebars.compile(templateSource);
    //     var output = template(locals);
    //     $(".my_photos_container").html(output);
    //   }

    // })
    // hideAllContainersExcept(".user_profile_container")
    event.preventDefault();
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
