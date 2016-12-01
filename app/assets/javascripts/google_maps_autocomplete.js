$(document).ready(function() {
  var survey_city = $('#survey_city').get(0);
  var answer_location = $('#survey_questions_attributes_0_answers_attributes_0_location').get(0);

  if (survey_city) {
    var autocomplete = new google.maps.places.Autocomplete(survey_city, { types: ['(cities)'] });
    google.maps.event.addDomListener(survey_city, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

  if (answer_location) {
    var autocomplete = new google.maps.places.Autocomplete(answer_location, { types: ['establishment'] });
    google.maps.event.addDomListener(answer_location, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

});
