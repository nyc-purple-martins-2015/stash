// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $("#new_photo_form").on("submit", function(event){
    // event.preventDefault();

  });

  // $.get("/photos/show").done(function(data){
  //   var locals = { photo: data };
  //   var templateSource = $("#photo_show_template").html();
  //   var template = Handlebars.compile(templateSource);
  //   var output = template(locals);
  // });

  // $(".photo_stream_container .photo_view").on(click, function(event){
  //   event.preventDefault();
  //   var id = $(this).attr("id")
  //   var url = '/photos/' + 'id'
  //   var request = $.ajax({
  //     method: "get",
  //     url: url,
  //     data: $(this).serialize()
  //   });

  //   request.done(function(data){
  //     var locals = { photos: data};
  //     var templateSource = $("#photo_show_tempalte").html();
  //     var template = Handlebars.compile(templateSource);
  //     var output = template(locals);

  //     $(".photo_stream_container").hide();
  //     $(".my_stash").hide();
  //     $(".photo_container").html(output);
  //   });
  // });

  // $(".photo_container").on(click, function(event){
  //   var id = $(this).attr("data-id")
  //   var url = '/photos/' + 'id'
  //   event.preventDefault();
  //   var request = $.ajax({
  //     method: "get",
  //     url: url,
  //     data: $(this).serialize()
  //   });

  //   request.done(function(data){
  //     var source = $("#photo_show_info_template").html();
  //     var template = Handlebars.compile(source);
  //     var context = { photo: data };
  //     var output = template(context);

  //     $(".photo_container").hide();
  //     $(".photo_info_container").html(output);
  //   });

  // })

  // $(".my_stash_container .stash_view").on(click, function(event){
  //   event.preventDefault();
  //   var id = $(this).attr("data-id")
  //   var url = '/photos/' + 'id'
  //   var request = $.ajax({
  //     method: "get",
  //     url: url,
  //     data: $(this).serialize()
  //   });

  //   request.done(function(data){
  //     var locals = { photos: data};
  //     var templateSource = $("#photo_show_tempalte").html();
  //     var template = Handlebars.compile(templateSource);
  //     var output = template(locals);

  //     $(".photo_stream_container").hide();
  //     $(".my_stash").hide();
  //     $(".photo_container").html(output);
  //   });
  // });


})
