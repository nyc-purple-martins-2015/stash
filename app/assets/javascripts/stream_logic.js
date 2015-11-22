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

Photostream.prototype.displayPhoto = function() {
  var i = Math.floor(Math.random() * this.stream.length);
  var nextPhoto = this.stream[i];
  this.stream.splice(i, 1);
  this.streamShown.push(nextPhoto);

}

