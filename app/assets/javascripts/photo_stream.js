$(document).ready(function() {
  $(".home").on("click", function(event) {
    event.preventDefault();

    $.get("/home/show").done(function(data){
    var locals = { photos: data};
    var templateSource = $("#photostream-template").html();
    var template = Handlebars.compile(templateSource);
    var output = template(locals);
    // console.log(output);
    // debugger
    $(" .photo_stream_container").html(output);

    });
  });

  $(document).on("click", ".photo_stream_container .photo_view", function(event){
    event.preventDefault();
    // debugger
    var id = $(this).attr("data-id")
    var url = '/photos/' + id
    var request = $.ajax({
      method: "get",
      url: url,
      data: $(this).serialize()
    });

    request.done(function(data){
      var locals = { photo: data };
      var templateSource = $("#photo_show_template").html();
      var template = Handlebars.compile(templateSource);
      var output = template(locals);

      $(".photo_stream_container").hide();
      $(".my_stash").hide();
      $(".photo_container").html(output);
    });
  });

  $(".photo_container").on("click", function(event){
    event.preventDefault();
    // debugger
    var id = $(this).children().attr("data-id")
    var url = '/photos/' + id
    var request = $.ajax({
      method: "get",
      url: url,
      data: $(this).serialize()
    });

    request.done(function(data){
      var source = $("#photo_show_info_template").html();
      var template = Handlebars.compile(source);
      var locals = { photo: data };
      var output = template(locals);
      debugger

      $(".photo_container").hide();
      $(".photo_info_container").html(output);
    });

  })

  $(".my_stash_container .stash_view").on("click", function(event){
    event.preventDefault();
    var id = $(this).children().attr("data-id")
    var url = '/photos/' + 'id'
    var request = $.ajax({
      method: "get",
      url: url,
      data: $(this).serialize()
    });

    request.done(function(data){
      var locals = { photo: data};
      var templateSource = $("#photo_show_tempalte").html();
      var template = Handlebars.compile(templateSource);
      var output = template(locals);

      $(".photo_stream_container").hide();
      $(".my_stash").hide();
      $(".photo_container").html(output);
    });
  });
});
