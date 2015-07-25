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

$(document).ready(function() {
    $('select').material_select();
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
});

var mapInstance;
var marker;

function placeMarker(location) {
    if (marker) {
        marker.setPosition(location);
    } else {
        marker = new google.maps.Marker({
            position: location,
            map: mapInstance
        });
    }
}
function submitAction() {
    alert("Value of latlng is " + $("#latlngfield").val());
}

$(document).ready(function() {
    var latlng = new google.maps.LatLng(40.776093, -73.960562);
    var mapOptions = {
        zoom: 12,
        scrollwheel: false,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DEFAULT
        }
    };
    mapInstance = new google.maps.Map(document.getElementById("map"), mapOptions);

    google.maps.event.addListener(mapInstance, 'click', function(event) {
        placeMarker(event.latLng);
    });

    $("#submitbutton").on("click", function(e) {
        // Prevent normal submit action
        // e.preventDefault();
        // Collect current latlng of marker and put in hidden form field
        if (marker) {
            $("#latlngfield").val(marker.getPosition().toString());
        } else {
            $("#latlngfield").val("not entered");
        }
        // Show results for debugging
        // submitAction();
        // Uncomment this for production and remove submitAction() call
        // $("#dataform").submit();
    });
});
