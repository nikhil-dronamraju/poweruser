import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onboarding"
export default class extends Controller {
  toggle_generic_inputs(){
      const userGenericInputs = document.getElementById("generic_input_fields");
      const trackInputs = document.getElementById("track_input_fields");
      userGenericInputs.classList.toggle("animate__animated", "animate__fadeOut");
      userGenericInputs.classList.toggle("display-none");
      trackInputs.classList.toggle("display-none");
      trackInputs.classList.toggle("animate__animated", "animate__fadeIn");
  }

  toggle_saga_inputs() {
      const trackInputs = document.getElementById("track_input_fields");
      const sagaInputs = document.getElementById("saga_input_fields");
      trackInputs.classList.toggle("display-none");
      sagaInputs.classList.toggle("display-none");
  }


}
