// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require underscore
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require gmaps/google

window.onload = function() {
    if($('#map-list').length > 0){
		handler = Gmaps.build('Google');
		
		handler.buildMap({ provider: {}, internal: {id: 'map-list'}}, function(){
      const contacts = $('#contacts').data('contacts');
      arrays = []
      for(var key in contacts) {
       arrays.push(contacts[key]);
      }
		  markers = handler.addMarkers(arrays);
		  handler.bounds.extendWith(markers);
		  handler.fitMapToBounds();
		});
	}
}