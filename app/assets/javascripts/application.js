//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap.min
// require turbolinks
//= require_tree .

$(document).ready(function() {
  //navigation
  $('#menu > .menu-item').on('click', function() {
    paths = [
      '',
      'about',
      'settings'
    ]

    id = $(this).index();
    document.location.href = '/' + paths[id];
  })	
});