const checkLength = function () {
    const minLength = 15;
    let area = document.getElementById('comment_description');
    let description = document.getElementById('character_count');


    if (area.value.length < minLength) {
        description.innerHTML = (minLength - area.value.length) + " caractères restants";
    } else {
        description.innerHTML = '';
    }
}
setInterval(checkLength, 300);