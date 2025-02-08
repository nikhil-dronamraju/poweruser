const quill = new Quill('#editor', {
    theme: 'snow'
});

const contentInput = document.getElementById("saga_content");
quill.on('text-change', () => {
    contentInput.value = quill.getSemanticHTML();
});