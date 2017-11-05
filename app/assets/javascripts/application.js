// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(document).on("turbolinks:load", function() {

  // For toggling profile list-group-item
  switch (location.pathname.substr(1)) {
    case 'my_tweets':
    $("a[href='/my_tweets']").addClass('active');
    $("a[href='/my_tweets'] span").removeClass('badge-primary').addClass('badge-light');
    break;
    case 'following':
    $("a[href='/following']").addClass('active');
    $("a[href='/following'] span").removeClass('badge-primary').addClass('badge-light');
    break;
    case 'follower':
    $("a[href='/follower']").addClass('active');
    $("a[href='/follower'] span").removeClass('badge-primary').addClass('badge-light');
    break;
  }

  // For toggling new tweet submit button and calculating word count
  const MAX_WORD_COUNT = 140;
  $('.new-tweet-form .btn').attr('disabled', true);
  $('.new-tweet-form textarea').on('input change', function() {
    $('.word-count').text(MAX_WORD_COUNT - $(this).val().length);

    if($(this).val().length == 0) {
      $('.new-tweet-form .btn').attr('disabled', true);
    } else {
      $('.new-tweet-form .btn').attr('disabled', false);
    }

  });

  // Link avatar to filestack btn
  $('.current-user-avatar').click(function() {
    $('.filestack-btn').click();
  });

  // Auto AJAX loading of more tweets
  var justLoaded = false;
  $(window).scroll(function() {
    var pageBottomPosition = $('html, body').scrollTop() + $(window).height();
    var lastTweetPosition = $('.tweets > div:last').offset().top + $('.tweets > div:last').height();
    if (pageBottomPosition >= lastTweetPosition && $('#next-page-link') && !justLoaded) {
      $('#next-page-link')[0].click();
      console.log("Load new tweets");
      justLoaded = true;
      setTimeout(function() {
        justLoaded = false;
      }, 500);
    }
  });

});

function updateAvatar(data) {
  var params = {"avatar_url": data.filesUploaded[0].url };
  $.ajax({
    url: '/update_avatar',
    method: 'PUT',
    data: params
  });
}
