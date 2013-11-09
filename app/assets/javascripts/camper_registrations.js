var CamperRegistrations = (function() {
    return {
	on_load: function() {
	    $('select#camp_season').on('change', function(event) {
		$(this).closest('form').submit();
	    });
	}
    };
})();

$(document).ready(CamperRegistrations.on_load);
$(document).on('page:load', CamperRegistrations.on_load);
