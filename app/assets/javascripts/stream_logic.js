// var Photo = function(args){
//   debugger
//   this.displayed = false;
//   this.created_at = args.created_at
//   this.

// };

var Photostream = function(photostream){
  this.stream = photostream || [];
  this.streamShown = [];
};

Photostream.prototype.convertPhotos = function() {
  for (var i = 0; i < this.stream.length; i++) {
    this.stream[i].displayed = false
  }
}

Photostream.prototype.choosePhoto = function() {
  var i = Math.floor(Math.random() * this.stream.length);
  var nextPhoto = this.stream[i];
  this.stream.splice(i, 1);
  this.streamShown.push(nextPhoto);
  return nextPhoto;
}

var StreamView = function(){

}

StreamView.prototype.displayPhoto = function(photo) {
  // function makeDraggable(){
  //   $('.photo_container').draggable({
  //         revert: false,
  //         start: function(event, ui) {
  //           ui.helper.data('dropped', false);
  //         },
  //         stop: function(event, ui) {
  //           cont.displayNext();
  //         }
  //     });
  // };
  var source = $('#flippable-card-template').html();
  var template = Handlebars.compile(source);
  var output = templag({photo: photo});
  $('.photo_stream_container').html(output);

  $('.photo_container').flip({trigger: 'click'});


  // $('.photo_stream_container').html("<div class='photo_container ui-draggable ui-draggable-handle' id='card'><div class='front' style='height: 100%; width: 100%; backface-visibility: hidden; transform-style: preserve-3d; position: absolute; z-index: 1; transition: all 0.5s ease-out;'><img src="+photo.image_url+"></div><div class='back' style='transform: rotateX(-180deg); height: 100%; width: 100%; backface-visibility: hidden; transform-style: preserve-3d; position: absolute; z-index: 0; transition: all 0.5s ease-out;'>"+photo.pricetag+"</div></div>").flip({axis: "x", trigger: "click"}).draggable({revert: false, start: function(event, ui) {ui.helper.data('dropped', false);},stop: function(event, ui) {cont.displayNext();}})
  // .draggable({
  //     revert : function(event, ui) {

  //           $(this).data("uiDraggable").originalPosition = {
  //               top : 0,
  //               left : 0
  //           };
  //           return !event;
            // that evaluate like this:
            // return event !== false ? false : true;
        // })
  // .flip({
  //       axis: "x",
  //       trigger:'click'
  //     });

}


// style='height: 100%; width: 100%; backface-visibility: hidden; transform-style: preserve-3d; position: absolute; z-index: 1; transition: all 0.5s ease-out;'

// style='transform: rotateX(-180deg); height: 100%; width: 100%; backface-visibility: hidden; transform-style: preserve-3d; position: absolute; z-index: 0; transition: all 0.5s ease-out;'

var StreamController = function(photostream){
  this.streamview = new StreamView;
  this.photostream = new Photostream(photostream);
}

StreamController.prototype.initDisplay = function() {
  this.photostream.convertPhotos();
  var photo = this.photostream.choosePhoto();
  this.streamview.displayPhoto(photo);
}

StreamController.prototype.addToStash = function() {

}

StreamController.prototype.displayNext = function() {
  var photo = this.photostream.choosePhoto();
  this.streamview.displayPhoto(photo);
}



