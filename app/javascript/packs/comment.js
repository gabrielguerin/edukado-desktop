const minLength = 15;
const checkLength = function () {
    let area = document.getElementById('comment_description') || 'Écrire un commentaire';
    let description = document.getElementById('character_count');
    if (area.value === undefined) {} else {
        if (area.value.length < minLength) {
            description.innerHTML = (minLength - area.value.length) + " caractères restants";
        } else {
            description.innerHTML = '';
        }
    }
}

setInterval(checkLength, 300);