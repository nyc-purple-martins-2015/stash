/**
 * jTinder initialization
 */

$(document).ready(function() {
  $("#tinderslide").jTinder({
    // dislike callback
      onDislike: function (item) {
        // set the status text
          $('#status').html('Passed');
      },
    // like callback
      onLike: function (item) {
        // set the status text
        $.ajax({
          method: 'post',
          url: '/users/stash_photo',
          data: { photoid: $(item).data('photoid')}
        }).done(function(data){
          $('#status').html(data);
        });
      },
      onFinish: function (item) {
        console.log("FINISHED");
        $('#status').hide();
        $('#tinderslide').hide();
        $('.wrap').hide();
        $('.finish_stash').toggle();
        $('.ps_logos_container').hide();
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
