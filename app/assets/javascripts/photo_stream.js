// jQueryMobile-SwipeUpDown
// ----------------------------------
//
// Copyright (c)2012 Donnovan Lewis
// Distributed under MIT license
//
// https://github.com/blackdynamo/jquerymobile-swipeupdown





$(document).ready(function() {
// initializes touch and scroll events
    var supportTouch = $.support.touch,
        scrollEvent = "touchmove scroll",
        touchStartEvent = supportTouch ? "touchstart" : "mousedown",
        touchStopEvent = supportTouch ? "touchend" : "mouseup",
        touchMoveEvent = supportTouch ? "touchmove" : "mousemove";

    // handles swipeup and swipedown
    $.event.special.swipeupdown = {
        setup: function () {
            var thisObject = this;
            var $this = $(thisObject);

            $this.bind(touchStartEvent, function (event) {
                var data = event.originalEvent.touches ?
                        event.originalEvent.touches[ 0 ] :
                        event,
                    start = {
                        time: (new Date).getTime(),
                        coords: [ data.pageX, data.pageY ],
                        origin: $(event.target)
                    },
                    stop;

                function moveHandler(event) {
                    if (!start) {
                        return;
                    }

                    var data = event.originalEvent.touches ?
                        event.originalEvent.touches[ 0 ] :
                        event;
                    stop = {
                        time: (new Date).getTime(),
                        coords: [ data.pageX, data.pageY ]
                    };

                    // prevent scrolling
                    if (Math.abs(start.coords[1] - stop.coords[1]) > 10) {
                        event.preventDefault();
                    }
                }

                $this
                    .bind(touchMoveEvent, moveHandler)
                    .one(touchStopEvent, function (event) {
                        $this.unbind(touchMoveEvent, moveHandler);
                        if (start && stop) {
                            if (stop.time - start.time < 1000 &&
                                Math.abs(start.coords[1] - stop.coords[1]) > 30 &&
                                Math.abs(start.coords[0] - stop.coords[0]) < 75) {
                                start.origin
                                    .trigger("swipeupdown")
                                    .trigger(start.coords[1] > stop.coords[1] ? "swipeup" : "swipedown");
                            }
                        }
                        start = stop = undefined;
                    });
            });
        }
    };

//Adds the events to the jQuery events special collection
    $.each({
        swipedown: "swipeupdown",
        swipeup: "swipeupdown"
    }, function (event, sourceEvent) {
        $.event.special[event] = {
            setup: function () {
                $(this).bind(sourceEvent, $.noop);
            }
        };
        //Adds new events shortcuts
        $.fn[ event ] = function( fn ) {
            return fn ? this.bind( event, fn ) : this.trigger( event );
        };
        // jQuery < 1.8
        if ( $.attrFn ) {
            $.attrFn[ event ] = true;
        }
    });

  // alert $('.photo_stream_container').data('data-photostream

  if ($('.photo_stream_container').length !== 0) {
    var cont = new StreamController($('.photo_stream_container').data('photostream'));
    cont.photostream.convertPhotos();
    cont.initDisplay();

    // $('.photo_stream_container').on("click", ".photo_container", function(){
    // $('.photo_stream_container').on("hover", ".photo_container", function() {

    // $('.photo_stream_container').on('tap', '.photo_container', function(){
    //   console.log("tapped");
    //   // $(this).flip();

    // });


    $('.photo_stream_container').on('swipeleft', '.photo_container', function(){
      console.log("swiped left");
      $(this).draggable();
      cont.displayNext();
    });

    $('.photo_stream_container').on('swiperight', '.photo_container', function(){
      console.log('swiped right');
      // $(this).animate({
      //   left: '250px',
      //   opacity: '0.5',

      // }, "slow", function() { alert('end ani'); } );

      cont.displayNext();
    });

    $('.photo_stream_container').on('swipeupdown', '.photo_container', function(){
      console.log('swiped down');

    });
  };
});



      // $(".photo_container").flip({
      //     axis: "x",
      //     trigger:'click'
      //   });
      // })

      // $('.photo_container').draggable({
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
      //     revert: false,
      //     start: function(event, ui) {
      //       ui.helper.data('dropped', false);
      //     },
      //     stop: function(event, ui) {
      //       // alert('stop: dropped=' + ui.helper.data('dropped'))
      //       // cont.displayNext();
      //     }
      // });

      // $('.stream_stash').droppable({
      //   accept: '.photo_container',
      //   drop: function(event, ui) {

      //     // send signal back to server
      //     ui.helper.data('dropped', true);
      //     cont.displayNext();
      //   }

      // })

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
