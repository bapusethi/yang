const loadMap = function () {
  if ($('#map-list').length > 0) {
    handler = Gmaps.build('Google');

    handler.buildMap({ provider: {}, internal: { id: 'map-list' } }, () => {
      const contacts = $('#contacts').data('contacts');
      arrays = [];
      for (const key in contacts) {
        arrays.push(contacts[key]);
      }
      markers = handler.addMarkers(arrays);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
  }

  if ($('#map').length > 0) {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: { id: 'map' } }, () => {
      markers = handler.addMarkers([
        {
          lat: $('#contact').data('lat'),
          lng: $('#contact').data('long'),
          infowindow: 'hello!',
        },
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
  }
};

$(document).on('turbolinks:load', loadMap);
