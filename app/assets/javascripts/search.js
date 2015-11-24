var app = window.app = {};

app.FoodTags = function() {
  this._input = $('#search-form');
  this._initAutocomplete();
};

app.FoodTags.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/foodtags',
        appendTo: '.foodtag_photos_container',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, tag) {
    var markup = [
      '<span class="description">' + tag.description + '</span>',
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.tag.description);
    return false;
  }
};
