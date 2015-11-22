$(document).ready(function() {

  //test page to load up all images, click each image, and show image infos
  $.get("/home/show").done(function(data){
    var locals = { photos: data};
    var templateSource = $("#photostream-template").html();
    var template = Handlebars.compile(templateSource);
    var output = template(locals);
    // console.log(output);
    // debugger
    $(" .photo_stream_container").html(output);

    });

  //click home button to show photo stream
  $(".home").on("click", function(event){
    event.preventDefault();

    hideAllContainersExcept(".photo_stream_container")

    $.get("/home/index").done(function(data){
    var locals = { photos: data};
    var templateSource = $("#photostream-template").html();
    var template = Handlebars.compile(templateSource);
    var output = template(locals);
    // debugger
    $(".photo_stream_container").html(output);

    });

  });


  //show one photo from photostream when it is clicked
  $(document).on("click", ".photo_stream_container .photo_view", function(event){
    event.preventDefault();
    // debugger
    hideAllContainersExcept(".photo_container")
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


      $(".photo_container").html(output);
    });
  });


  //show photo info when it is clicked
  $(".photo_container").on("click", function(event){
    event.preventDefault();
    hideAllContainersExcept(".photo_info_container")
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
      // debugger

      $(".photo_info_container").html(output);
    });

  })

  //show photo from my stash when it is clicked
  $(".my_stash_container .stash_view").on("click", function(event){
    event.preventDefault();

    hideAllContainersExcept(".photo_container")

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

      $(".photo_container").html(output);
    });
  });


});
