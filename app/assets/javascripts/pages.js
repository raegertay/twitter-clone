$(document).on("turbolinks:load", function() {

  // Auto AJAX loading of more tweets
  var readyToLoad = true;

  var resetLoadStatus = function() {
    setTimeout(function() {
      readyToLoad = true;
      // console.log(`Ready to load(reset): ${readyToLoad}`);
    }, 500);
  };

  $(window).scroll(function() {
    var pageBottomPosition = $('html, body').scrollTop() + $(window).height();
    if ($('.tweets > div:last').length) {
      var lastTweetPosition = $('.tweets > div:last').offset().top + $('.tweets > div:last').height();
    }
    // console.log(`Ready to load(before if): ${readyToLoad}`);
    if (readyToLoad && pageBottomPosition >= lastTweetPosition && $('#next-page-link').length) {
      $('.spinner').css("visibility", 'visible')
      $('#next-page-link')[0].click();
      // console.log("Loading new tweets");
      readyToLoad = false;
      // console.log(`Ready to load(after click): ${readyToLoad}`);
      resetLoadStatus();
    }
  });

});
