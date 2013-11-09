var CamperSessions = (function() {
  return {
    on_load: function() {
      if($("#calendar").length > 0){
        $.ajax({
          url: "/camp_sessions.json",
        }).error(function(error){
          alert("Sorry, the Calendar has failed to load.");
        }).done(function(camp_sessions){
          events_sess = [];
          for (var i = 0; i < camp_sessions.length; i++) {
            session = camp_sessions[i];
            events_sess.push({
              title: session["number"],
              start: moment(session["start_date"]),
              end: moment(session["end_date"])
              // title: session["number"],
              // start: new Date(Date.parse(session["start_date"])),
              // end: new Date(Date.parse(session["end_date"]))
            });
          }
          console.log(events_sess);
          $('#calendar').fullCalendar({
            editable: false,
            events: events_sess
          });

        });
      }


    }
  };
})();

$(document).ready(CamperSessions.on_load);
$(document).on('page:load', CamperSessions.on_load);