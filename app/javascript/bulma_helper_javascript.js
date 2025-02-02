/**
 * The first section is to handle the error removal, and stuff like that
 */

function deleteMessageComponent(elementId) {
    let messageElement = document.getElementById(elementId);
    console.log( messageElement );
    messageElement.classList.remove("animate__fadeIn");
    messageElement.classList.add("animate__fadeOut");
}