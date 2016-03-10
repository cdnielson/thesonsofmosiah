function scrollToElement(el){
    $('html,body').animate({
        scrollTop: $(el).offset().top
    }, 500);
}

$(document).ready(function() {
    var offset = 220;
    var duration = 500;
    $(window).scroll(function() {
        if ($(this).scrollTop() > offset) {
            $('.bottom-menu')
                .css("display", "flex")
                .css("opacity", ".7")
                .fadeIn(duration);
        } else {
            $('.bottom-menu')
                .fadeOut(duration);
        }
    });

    $('#back-to-top').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, duration);
        return false;
    });

});
