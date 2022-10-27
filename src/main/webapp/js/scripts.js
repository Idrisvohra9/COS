const taglinesArr = ["COZ, Why not :)", "COZ, It's the best!!", "Bruhh", "🗿", "More Than you Imagined!", "A project", "An Idea", "By the boys", "💪","In it's development stage..","ChadOperatingSystem!!","Over 26k Line of code!!","100% Organic"];

const tagline = document.getElementById("tagline");

let randTagLine = "";
addEventListener("load", setTagLine)

function randomTagLine() {
    let selRandIndex = Math.floor(Math.random() * taglinesArr.length)
    randTagLine = taglinesArr[selRandIndex];
}

let c = 0;
function typeTaglines() {
    if (c < randTagLine.length) {
        tagline.innerHTML += randTagLine.charAt(c);
        console.log(randTagLine.charAt(c));
        c++;
        setInterval(typeTaglines, 220);
    }
}
function setTagLine(){
    randomTagLine();
    typeTaglines();
}

$(function () {

    // init feather icons
    feather.replace();

    // init tooltip & popovers
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();

    //page scroll
    $('a.page-scroll').bind('click', function (event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top - 20
        }, 1000);
        event.preventDefault();
    });

    // slick slider
    $('.slick-about').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 3000,
        dots: true,
        arrows: false
    });

    //toggle scroll menu
    var scrollTop = 0;
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        //adjust menu background
        if (scroll > 80) {
            if (scroll > scrollTop) {
                $('.smart-scroll').addClass('scrolling').removeClass('up');
            } else {
                $('.smart-scroll').addClass('up');
            }
        } else {
            // remove if scroll = scrollTop
            $('.smart-scroll').removeClass('scrolling').removeClass('up');
        }

        scrollTop = scroll;

        // adjust scroll to top
        if (scroll >= 600) {
            $('.scroll-top').addClass('active');
        } else {
            $('.scroll-top').removeClass('active');
        }
        return false;
    });

    // scroll top top
    $('.scroll-top').click(function () {
        $('html, body').stop().animate({
            scrollTop: 0
        }, 1000);
    });

    /**Theme switcher - DEMO PURPOSE ONLY */
    $('.switcher-trigger').click(function () {
        $('.switcher-wrap').toggleClass('active');
    });
    $('.color-switcher ul li').click(function () {
        var color = $(this).attr('data-color');
        $('#theme-color').attr("href", "css/" + color + ".css");
        $('.color-switcher ul li').removeClass('active');
        $(this).addClass('active');
    });
});