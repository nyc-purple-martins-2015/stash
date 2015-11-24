/**
 * jTinder initialization
 */

$(document).ready(function() {
  $("#tinderslide").jTinder({
    // dislike callback
      onDislike: function (item) {
        // set the status text

        console.log("disliked");
          $('#status').html('Passed on ' + (item.index()+1));
      },
    // like callback
      onLike: function (item) {
        // set the status text

        $.ajax({
          method: 'post',
          url: 'users/stashphoto',
          data: { photoid: $(item).data('photoid')}
        }).done(function(data){
          console.log("liked");
          $('#status').html(data);
        });
      },
    animationRevertSpeed: 200,
    animationSpeed: 400,
    threshold: 1,
    likeSelector: '.like',
    dislikeSelector: '.dislike'
  });

  /**
   * Set button action to trigger jTinder like & dislike.
   */
  $('.actions .like, .actions .dislike').click(function(e){
    e.preventDefault();
    $("#tinderslide").jTinder($(this).attr('class'));
  });
});
