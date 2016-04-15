$(".upvote").on("submit", function(event) {
  event.preventDefault();

var url = $(this).attr("href");
var voteDisplay = $(this).parent().find(".vote-total");

  var request = $.ajax({
    type: "POST",
    url: url,
    dataType: "json",
    success: function(response) {
      voteDisplay.text(response);
    }
  });
});

$(".downvote").on("submit", function(event) {
  event.preventDefault();

var url = $(this).attr("href");
var voteDisplay = $(this).parent().find(".vote-total");

  var request = $.ajax({
    type: "POST",
    url: url,
    dataType: "json",
    success: function(response) {
      voteDisplay.text(response);
    }
  });
});
