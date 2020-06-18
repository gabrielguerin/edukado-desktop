const minLength = 15;
let area = document.getElementById('comment_description');
let description = document.getElementById('character_count');

const checkLength = function () {
    if (area.value.length < minLength) {
        description.innerHTML = (minLength - area.value.length) + " caractères restants";
    } else {
        description.innerHTML = '';
    }
}
if (area == null) {

} else {
    setInterval(checkLength, 300);
}