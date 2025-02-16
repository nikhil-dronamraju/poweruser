import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onboarding"
// So - Going off of that..We need to somehow handle client side errors.
// It looks like there's a way to do it using Stimulus events and shit, but it's not pretty.
// L
export default class extends Controller {
  toggle_generic_inputs(){
      if ( document.getElementById("username_input").textContent === "" ) {
          document.getElementById("username_is_blank").classList.remove("display-none");
      } else {
          const userGenericInputs = document.getElementById("generic_input_fields");
          const trackInputs = document.getElementById("track_input_fields");
          userGenericInputs.classList.toggle("animate__animated", "animate__fadeOut");
          userGenericInputs.classList.toggle("display-none");
          trackInputs.classList.toggle("display-none");
          trackInputs.classList.toggle("animate__animated", "animate__fadeIn");
      }

  }

  toggle_saga_inputs() {
      const trackInputs = document.getElementById("track_input_fields");
      const sagaInputs = document.getElementById("saga_input_fields");
      trackInputs.classList.toggle("display-none");
      sagaInputs.classList.toggle("display-none");
  }

  update_icon_input() {
      const buttonElement = this.element;
      const index = this.data.get("index");
      const icon = buttonElement.children[0];
      const inputHiddenField = document.getElementById(`user_track_track_${index}_icon`);
      const openModalButton = document.getElementById(`open_icon_modal_${index}`);
      openModalButton.innerHTML = icon.outerHTML;
      inputHiddenField.value = icon.outerHTML;
  }


}
