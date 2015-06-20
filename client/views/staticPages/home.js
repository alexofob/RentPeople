/**
 * Created by ealeofo on 5/28/2015.
 */

Template.home.rendered = function() {
    var i = 1;
    var images = ['/img/bedroom-dark-bg.jpg','/img/banner-bg.jpg','/img/full-house-dark.jpg'];
    var image = $('.intro-header');
    //Initial background image setup
    image.css('background-image', 'url(/img/bedroom-dark-bg.jpg)')
    //Change image at regular intervals
    setInterval(function() {
        image.css('background-image', 'url(' + images [i++] + ')');
        if (i == images.length)
            i = 0;
        }, 20000);
    };



