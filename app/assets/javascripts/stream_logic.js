var Photo = function(args){
  this.displayed = false;
};

var Photostream = function(args){
  this.stream = args.stream || [];
  this.streamShown = [];
};

Photostream.prototype.convertPhotos = function() {
  for (var i = 0; i < this.stream.length; i++) {
    this.stream[i] = new Photo(this.stream[i]);
  }
}

Photostream.prototype.choosePhoto = function() {
  var i = Math.floor(Math.random() * this.stream.length);
  var nextPhoto = this.stream[i];
  this.stream.splice(i, 1);
  this.streamShown.push(nextPhoto);
}

var View = function(){

}

View.prototype.displayPhoto(photo) {
  $('.photo_container').html(photo);

}


var Controller = function(view, photostream){
  this.view = view;
  this.photostream = photostream;
}

Controller.prototype.initDisplay = function() {
  this.photostream.convertPhotos();
  var photo = this.phtostream.choosePhoto();
  this.view.displayPhoto(photo);
}
