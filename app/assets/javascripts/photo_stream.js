$(document).ready(function() {
  // alert $('.photo_stream_container').data('data-photostream

  if ($('.photo_stream_container').length !== 0) {
    var cont = new StreamController($('.photo_stream_container').data('photostream'));
    cont.photostream.convertPhotos();
    cont.initDisplay();

    // $('.photo_stream_container').on("click", ".photo_container", function(){
    // $('.photo_stream_container').on("hover", ".photo_container", function() {

      $(".photo_container").flip({
          axis: "x",
          trigger:'click'
        });
      // })

      $('.photo_container').draggable({
        // revert : function(event, ui) {
        //     debugger

        //       $(this).data("uiDraggable").originalPosition = {
        //           top : 0,
        //           left : 0
        //       };
        //       return !event;
        //       // that evaluate like this:
        //       // return event !== false ? false : true;
        //   }
          revert: false,
          start: function(event, ui) {
            ui.helper.data('dropped', false);
          },
          stop: function(event, ui) {
            // alert('stop: dropped=' + ui.helper.data('dropped'))
            // cont.displayNext();
          }
      });

      $('.stream_stash').droppable({
        accept: '.photo_container',
        drop: function(event, ui) {
          debugger

          // send signal back to server
          ui.helper.data('dropped', true);
          cont.displayNext();
        }

      })

  };
  // $(".home").on("click", function(event){
  //   debugger
    // $('.photo_container').draggable({
    //   connectToDroppable: "#stash"
    // });
    // $('.stash').droppable({
    //   drop: function(event, ui) {

    //   };
    // })
  // });
});




// $(document).ready(function() {

//   //test page to load up all images, click each image, and show image infos
//   $.get("/home/show").done(function(data){
//     var locals = { photos: data};
//     var templateSource = $("#photostream-template").html();
//     var template = Handlebars.compile(templateSource);
//     var output = template(locals);
//     // console.log(output);
//     // debugger
//     $(" .photo_stream_container").html(output);

//     });

  //click home button to show photo stream
  // $(".home").on("click", function(event){
  //   event.preventDefault();

  //   hideAllContainersExcept(".photo_stream_container")

  //   $.get("/home/index").done(function(data){
  //   var locals = { photos: data};
  //   var templateSource = $("#photostream-template").html();
  //   var template = Handlebars.compile(templateSource);
  //   var output = template(locals);
  //   // debugger
  //   $(".photo_stream_container").html(output);

  //   });

  // });


//   //show one photo from photostream when it is clicked
//   $(document).on("click", ".photo_stream_container .photo_view", function(event){
//     event.preventDefault();
//     // debugger
//     hideAllContainersExcept(".photo_container")
//     var id = $(this).attr("data-id")
//     var url = '/photos/' + id
//     var request = $.ajax({
//       method: "get",
//       url: url,
//       data: $(this).serialize()
//     });

//     request.done(function(data){
//       var locals = { photo: data };
//       var templateSource = $("#photo_show_template").html();
//       var template = Handlebars.compile(templateSource);
//       var output = template(locals);


//       $(".photo_container").html(output);
//     });
//   });



//   // //show photo info when it is clicked
//   $(".photo_container").on("click", function(event){
//     event.preventDefault();
//     // hideAllContainersExcept(".photo_info_container")
//     // debugger
//     var id = $(this).children().attr("data-id")
//     var url = '/photos/' + id
//     var request = $.ajax({
//       method: "get",
//       url: url,
//       data: $(this).serialize()
//     });

//     request.done(function(data){
//       var source = $("#photo_show_info_template").html();
//       var template = Handlebars.compile(source);
//       var locals = { photo: data };
//       var output = template(locals);
//       // debugger

//       $(".photo_info_container").html(output);
//     });

//   })

//   //show photo from my stash when it is clicked
//   $(".my_stash_container .stash_view").on("click", function(event){
//     event.preventDefault();

//     hideAllContainersExcept(".photo_container")

//     var id = $(this).children().attr("data-id")
//     var url = '/photos/' + 'id'
//     var request = $.ajax({
//       method: "get",
//       url: url,
//       data: $(this).serialize()
//     });

//     request.done(function(data){
//       var locals = { photo: data};
//       var templateSource = $("#photo_show_tempalte").html();
//       var template = Handlebars.compile(templateSource);
//       var output = template(locals);

//       $(".photo_container").html(output);
//     });
//   });



// });
