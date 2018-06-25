var app = window.app = {};
app.Messages = function() {
  this._input = $('#books-search-txt');
  this._initAutocomplete();
};

app.Messages.prototype = {

};

_initAutocomplete: function() {
  this._input
    .autocomplete({
      source: '/messages',
      appendTo: '#books-search-results',
      select: $.proxy(this._select, this)
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

_select: function(e, ui) {
  this._input.val(ui.item.content);
  return false;

  _render: function(ul, item) {
  var markup = [
    '<span class="title">' + item.content + '</span>'
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}