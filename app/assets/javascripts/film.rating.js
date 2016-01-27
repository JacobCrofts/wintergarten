$(".star").on("click", function() {
  var value = $(this).attr("id").replace("film-rating-", "");
  var filmId = window.location.pathname.replace("/films/", "");
  var filmData = {rateable_id: filmId, rateable_type: "Film", value: value}
  var request = $.ajax({
    type: 'POST',
    url: '/films/' + filmId + '/ratings',
    data: {
          film_data: filmData,
          authenticity_token: $("#new_review > input[name='authenticity_token']").attr("value")
        }
  });
  request.done(function (response) {
    highlightStars(parseInt(response.value));
  });
  request.fail(function (error) {
    console.log(error);
  })
})


// this can be refactored for DRYness later

$("#film-rating-1").hover(function() {
  $("#film-rating-1").text("★")
}, function() {
  $("#film-rating-1").text("☆")
})

$("#film-rating-2").hover(function() {
  $("#film-rating-1").text("★")
  $("#film-rating-2").text("★")
}, function() {
  $("#film-rating-1").text("☆")
  $("#film-rating-2").text("☆")
})

$("#film-rating-3").hover(function() {
  $("#film-rating-1").text("★")
  $("#film-rating-2").text("★")
  $("#film-rating-3").text("★")
}, function() {
  $("#film-rating-1").text("☆")
  $("#film-rating-2").text("☆")
  $("#film-rating-3").text("☆")
})

$("#film-rating-4").hover(function() {
  $("#film-rating-1").text("★")
  $("#film-rating-2").text("★")
  $("#film-rating-3").text("★")
  $("#film-rating-4").text("★")
}, function() {
  $("#film-rating-1").text("☆")
  $("#film-rating-2").text("☆")
  $("#film-rating-3").text("☆")
  $("#film-rating-4").text("☆")
})

highlightStars = function(value) {
  $(".film-rating").empty();
  $(".film-rating").append('<span class="star-static" id="film-rating-1">☆</span><span class="star-static" id="film-rating-2">☆</span><span class="star-static" id="film-rating-3">☆</span><span class="star-static" id="film-rating-4">☆</span>')

  for (var counter = 1; counter <= value; counter++) {
    $("#film-rating-" + counter).text("★")
  }
}
