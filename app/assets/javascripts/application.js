//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var addRemoveNestedFields = function() {
    $('form').on('click', '.remove_fields', function(event) {
	$(this).prev('input[type=hidden]').val('1');
	$(this).closest('fieldset').hide();
	event.preventDefault();
    });

    $('form').on('click', '.add_fields', function(event) {
	time = new Date().getTime();
	regexp = new RegExp($(this).data('id'), 'g');
	$(this).before($(this).data('fields').replace(regexp, time));
	event.preventDefault();
    });
};

$(document).ready(addRemoveNestedFields);
$(document).on('page:load', addRemoveNestedFields);
