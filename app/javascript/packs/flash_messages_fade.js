document.addEventListener('DOMContentLoaded', function() {
    setTimeout(function() {
        const elements = document.querySelectorAll('.alert, .notice, #flash_alert');
        elements.forEach(function(element) {
            fadeOut(element, 10000, function() {
                element.parentNode.removeChild(element);
            });
        });
    }, 8000);
});

function fadeOut(element, duration, callback) {
    let opacity = 1;
    let interval = 50;
    let delta = interval / duration;

    let timer = setInterval(function() {
        opacity -= delta;
        element.style.opacity = opacity;

        if (opacity <= 0) {
            clearInterval(timer);
            callback();
        }
    }, interval);
}
