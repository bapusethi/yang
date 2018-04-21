$(document).ready(function() {
    console.log('ready');
	handler = Gmaps.build('Google');
	
	handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
	  markers = handler.addMarkers([
	    {
	      "lat": $('#contact').data('lat'),
	      "lng": $('#contact').data('long'),
	      "infowindow": "hello!"
	    }
	  ]);
	  handler.bounds.extendWith(markers);
	  handler.fitMapToBounds();
	});
})