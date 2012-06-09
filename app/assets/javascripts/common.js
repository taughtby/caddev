$(function() {
  var render, select;
  $('#search-input').focus();
  render = function(term, data, type) {
    console.log(term)
    return term;
  };
  select = function(term, data, type) {
    $('#search-input').val(term);
    $('#search-input').click();
    return console.log("Selected " + term);
  };
  // $('#search-input').soulmate({
  //     url: '/sm/search',
  //     types: ['subject'],
  //     renderCallback: render,
  //     selectCallback: select,
  //     minQueryLength: 2,
  //     maxResults: 5
  //   });
});

$('.typeahead').typeahead()

$(function () {
    $('#myTab a:first').tab('show');
  })