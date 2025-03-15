import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {

  static values = {
      modalId: String
  }
  connect() {
  }

  open_modal() {
    let modalId = this.modalIdValue;
    let modal = document.getElementById(modalId);
    modal.classList.add("is-active");
  }

  close_modal() {
      this.element.classList.remove("is-active");
  }
}
