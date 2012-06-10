$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	$('.calendar').fullCalendar({
		editable: true,   
		ignoreTimeZone: true,     
		header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'month',
        height: 500,
        slotMinutes: 15,
        
        loading: function(bool){
            if (bool) 
                $('#loading').show();
            else 
                $('#loading').hide();
        },
        
        // a future calendar might have many sources.        
        // eventSources: [{
        //             url: '/events',
        //             color: '#08C',
        //             textColor: 'black',
        //             ignoreTimezone: false
        //         }],
        
        timeFormat: 'h:mm t{ - h:mm t} ',
        
        dragOpacity: "0.5",
        
        //http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
        // eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
        //             updateEvent(event);
        //         },
        // 
        //         // http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
        //         eventResize: function(event, dayDelta, minuteDelta, revertFunc){
        //             updateEvent(event);
        //         },
        // 
        //         // http://arshaw.com/fullcalendar/docs/mouse/eventClick/
        //         eventClick: function(event, jsEvent, view){
        //           // would like a lightbox here.
        //           updateEvent(event);
        //         }
        events: {
                url: '/events.json',
                type: 'GET',
                data: {
                    tutor_id: $('.calendar').data('id')
                },
                error: function() {
                    alert('there was an error while fetching events!');
                },
                color: '#FF639A',   // a non-ajax option
                textColor:  '#000'// a non-ajax option
            }
            
        // events: [
        //                 {
        //                     title  : 'Beginner Guitar',
        //                     description  : 'A bunch of kids',
        //                     start  : '2012-06-08'
        //                 },
        //                 {
        //                     title  : 'Advanced Guitar',
        //                     description  : 'A bunch of pre-madonnas',
        //                     start  : '2012-06-15',
        //                     end    : '2012-06-21'
        //                 },
        //                 {
        //                     title  : 'event3',
        //                     start  : '2012-06-12 12:30:00',
        //                     allDay : false // will make the time show
        //                 }
        //             ]
	});
});

function updateEvent(the_event) {
    $.update(
      "/events/" + $('.calendar').data('id'),
      { event: { title: the_event.title,
                 starts_at: "" + the_event.start,
                 ends_at: "" + the_event.end,
                 description: the_event.description,
                 tutor_id: $('.calendar').data('id')
               }
      },
      function (reponse) { alert('successfully updated task.'); }
    );
};