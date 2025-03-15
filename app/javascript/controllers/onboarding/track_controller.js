import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="track"
export default class extends Controller {
  static values = {
      currentPage: String,
      previousPage: String,
      nextPage: String,
      index: Number
  }

  static targets = [ "iconModalOpener", "iconHiddenField", "iconClass" ]
  connect() {
  }

  update_icon_input() {
    const modalOpener = document.getElementById(`modal_opener_${this.indexValue}`);
    const newIcon = this.element.children[0];
    const classList = newIcon.classList.toString();
    const hiddenField = document.getElementById(`user_tracks_attributes_${this.indexValue}_icon`);
    modalOpener.innerHTML = `<i class="${classList}"></i>`;
    hiddenField.value = classList;
  }
}
