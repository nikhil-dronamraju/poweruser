function deleteMessageComponent(elementId) {
    let messageElement = document.getElementById(elementId);
    console.log( messageElement );
    messageElement.classList.remove("animate__fadeIn");
    messageElement.classList.add("animate__fadeOut");
}