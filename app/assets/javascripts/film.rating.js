$(".star").on("click", function() {
  var id = parseInt($(this).attr("id").replace("film-rating-", ""));
  var filmId = parseInt(window.location.pathname.replace("/films/", ""));
  $.ajax({
    type: 'POST',
    url: '/films/' + filmId + '/ratings',
    data: {id: id}
  })
})

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