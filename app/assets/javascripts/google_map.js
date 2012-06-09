
function google_map_initialize( ) {
  var myLatlng = new google.maps.LatLng($("#map_canvas").data('latitude'),-$("#map_canvas").data('longitude'));
  var myOptions = {
    center: myLatlng,
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  };
  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title:"Hello World!"
    });
};

$( google_map_initialize ); 