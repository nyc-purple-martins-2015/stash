// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
    //click mystash button to show my stash
  $(".my_stash").on("click", function(event){
    event.preventDefault();
    hideAllContainersExcept(".my_stash_container")
    var url = $(this).attr("href");
  $.get(url).done(function(data){
    // debugger
      var locals = {photos: data};
      var templateSource = $("#mystash-template").html();
      var template = Handlebars.compile(templateSource);
      var output = template(locals);
      $(".my_stash_container").html(output);
    })
  })


})
