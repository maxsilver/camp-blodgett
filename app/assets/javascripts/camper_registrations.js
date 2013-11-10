var CamperRegistrations = (function() {
    return {
	on_load: function() {
	    $('select#camp_season').on('change', function(event) {
		$(this).closest('form').submit();
	    });

	    $('#camper_registration_tetanus_booster_shot').datepicker();
	    $('#camper_registration_measles_mumps_shot').datepicker();
	    $('#camper_registration_polio_shot').datepicker();
	    $('#camper_registration_hepatitis_b_shot').datepicker();
	}
    };
})();

$(document).ready(CamperRegistrations.on_load);
$(document).on('page:load', CamperRegistrations.on_load);
