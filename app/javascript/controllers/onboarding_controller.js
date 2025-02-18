import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["generic", "track", "saga"];

  update_icon_input() {
      const buttonElement = this.element;
      const index = this.data.get("index");
      const icon = buttonElement.children[0];
      const inputHiddenField = document.getElementById(`user_track_${index}_icon`);
      const openModalButton = document.getElementById(`open_icon_modal_${index}`);
      openModalButton.innerHTML = icon.outerHTML;
      inputHiddenField.value = icon.outerHTML;
  }

  flip_to_track(){
      this.genericTarget.classList.add("display-none");
      this.genericTarget.classList.remove("animate__animated", "animate__fadeIn");
      this.trackTarget.classList.add("animate__animated", "animate__fadeIn");
      this.trackTarget.classList.remove("display-none");
      this.sagaTarget.classList.add("display-none");
      this.sagaTarget.classList.remove("animate__animated", "animate__fadeIn");
  }

  flip_to_generic(){
    this.genericTarget.classList.remove("display-none");
    this.genericTarget.classList.add("animate__animated", "animate__fadeIn");
    this.trackTarget.classList.add("display-none");
    this.trackTarget.classList.remove("animate__animated", "animate__fadeIn");
    this.sagaTarget.classList.add("display-none");
    this.sagaTarget.classList.remove("animate__animated", "animate__fadeIn");
  }

  flip_to_saga() {
      this.genericTarget.classList.add("display-none");
      this.genericTarget.classList.remove("animate__animated", "animate__fadeIn");
      this.trackTarget.classList.add("display-none");
      this.trackTarget.classList.remove("animate__animated", "animate__fadeIn");
      this.sagaTarget.classList.add("animate__animated", "animate__fadeIn");
      this.sagaTarget.classList.remove("display-none");
  }


}
