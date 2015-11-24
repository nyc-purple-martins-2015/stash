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
  var source = $('#flippable-card-template').html();
  var template = Handlebars.compile(source);
  var output = template({photo: photo});

  // $(output).css('left',0);

  $('.photo_stream_container').html("");
  $('.photo_stream_container').html(output);
  $('.photo_container').css({"left": "0", "display": "block", "top":"0"})
  // $('.photo_container').flip({
  //   axis: "x",
  //   trigger: 'manual'
  // });
};


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




