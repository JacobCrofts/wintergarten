$(".review-rating > span").on("click", function() {
  var value = $(this).attr("class").replace("review-rating-", "");
  var reviewId = $(this).parent().attr("id").replace("review-stars-", "")
  var data = {rateable_id: reviewId, rateable_type: "Review", value: value}
  var filmId = window.location.pathname.replace("/films/", "");
  var request = $.ajax({
    type: 'POST',
    url: '/films/' + filmId + '/reviews/' + reviewId + '/ratings',
    data: {
          data: data,
          authenticity_token: $("#new_review > input[name='authenticity_token']").attr("value")
        }
  });
  request.done(function (response) {
    highlightRatingStars(parseInt(response.value), parseInt(response.review_id));
  });
  request.fail(function (error) {
    console.log(error);
  })
})

$(".review-rating-1").hover(function() {
  $(".review-rating-1").text("★")
}, function() {
  $(".review-rating-1").text("☆")
})

$(".review-rating-2").hover(function() {
  $(".review-rating-1").text("★")
  $(".review-rating-2").text("★")
}, function() {
  $(".review-rating-1").text("☆")
  $(".review-rating-2").text("☆")
})

$(".review-rating-3").hover(function() {
  $(".review-rating-1").text("★")
  $(".review-rating-2").text("★")
  $(".review-rating-3").text("★")
}, function() {
  $(".review-rating-1").text("☆")
  $(".review-rating-2").text("☆")
  $(".review-rating-3").text("☆")
})

$(".review-rating-4").hover(function() {
  $(".review-rating-1").text("★")
  $(".review-rating-2").text("★")
  $(".review-rating-3").text("★")
  $(".review-rating-4").text("★")
}, function() {
  $(".review-rating-1").text("☆")
  $(".review-rating-2").text("☆")
  $(".review-rating-3").text("☆")
  $(".review-rating-4").text("☆")
})

highlightRatingStars = function(value, review_id) {
  $(".review #review-stars-" + review_id).empty();

  for (var counter = 1; counter <= value; counter++) {
    $(".review #review-stars-" + review_id).append('<span class="star-static">★</span>')
  }

  for (var counter = 1; counter <= 4 - value; counter++) {
    $(".review #review-stars-" + review_id).append('<span class="star-static">☆</span>')
  }
}
