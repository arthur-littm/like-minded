$(document).ready(function() {
  var survey_city = $('#survey_city').get(0);

  if (survey_city) {
    var autocomplete = new google.maps.places.Autocomplete(survey_city, { types: ['geocode'] });
    google.maps.event.addDomListener(survey_city, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
