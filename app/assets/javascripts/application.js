// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require handlebars-205c61c

// function hideAllContainersExcept(divNotHidden) {
//   $('div.container > [class*="container"]').hide();
//   $(divNotHidden).show()
// };

// initialize();

// function initialize() {
//   google.maps.event.addDomListener(window, 'load', function() {
//     codeAddress('New York');
// });
// }

$(document).ready(function() {

// autocomplete place details

  (function initialize (){  

    var lat = 40.7127,
        lng = -74.0059,
        latlng = new google.maps.LatLng(lat, lng),
        image = 'http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png';
    
    var myOptions = {
      center: new google.maps.LatLng(lat, lng),
      zoom: 17,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map"), myOptions);

    // Get's user's current location
    var input = document.getElementById('searchTextField');         
    
    var autocomplete = new google.maps.places.Autocomplete(input, {
          types: ["restaurant"]
    });          
    
    autocomplete.bindTo('bounds', map); 
    var infowindow = new google.maps.InfoWindow(); 
 
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        infowindow.close();
        var place = autocomplete.getPlace();
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  
        }
        
        
    });  
    
    $("input").focusin(function () {
        $(document).keypress(function (e) {
            if (e.which == 13) {
                infowindow.close();
                var firstResult = $("#pac-input").text();
                
                var geocoder = new google.maps.Geocoder();
                geocoder.geocode({"address":firstResult }, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var lat = results[0].geometry.location.lat(),
                            lng = results[0].geometry.location.lng(),
                            placeName = results[0].address_components[0].long_name,
                            latlng = new google.maps.LatLng(lat, lng);
                        
                        moveMarker(placeName, latlng);
                        $("input").val(firstResult);
                    }
                });
            }
        });
    });

    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
  
      map.setCenter(initialLocation);

      var marker = new google.maps.Marker({
        position: initialLocation,
        map: map,
        title: 'Hello World!'
      });
    });
     
 
//evoke funciton
  }) ();
  

//document ready end
});