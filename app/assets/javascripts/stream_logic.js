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

  $('.photo_stream_container').html("<div class='photo_container' id='card'><div class='front'><img src="+photo.image_url+"></div><div class='back'>"+photo.pricetag+"</div></div>")
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



