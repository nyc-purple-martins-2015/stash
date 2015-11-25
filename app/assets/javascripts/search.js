$(document).ready(function(){
    // var availableTags = [
    //       "ActionScript",
    //   "AppleScript",
    //   "Asp",
    //   "BASIC",
    //   "C",
    //   "C++",
    //   "Clojure",
    //   "COBOL",
    //   "ColdFusion",
    //   "Erlang",
    //   "Fortran",
    //   "Groovy",
    //   "Haskell",
    //   "Java",
    //   "JavaScript",
    //   "Lisp",
    //   "Perl",
    //   "PHP",
    //   "Python",
    //   "Ruby",
    //   "Scala",
    //   "Scheme"
    // ]

    // $( "#search-box" ).autocomplete({
    //   source: availableTags
    // });

  $('#search-box').autocomplete({
    var tags = $.ajax({
      method: "get",
      url: '/foodtags/autocomplete_tag_name',
      data: $(this).serialize(),
    });
    source: tags
  });

});
