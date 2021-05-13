// Initialize and add the map
function initMap() {
    // The location of Adelaide
    const Adelaide = { lat: -34.9285, lng: 138.6007 };
    // The map, centered at Adelaide
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 4,
      center: Adelaide,
    });
    // The marker, positioned at Adelaide
    const marker = new google.maps.Marker({
      position: Adelaide,
      map: map,
    });
  }