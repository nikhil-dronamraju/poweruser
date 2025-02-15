import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onboarding"
export default class extends Controller {
  hide_generic_inputs(){
      const userGenericInputs = document.getElementById("generic_input_fields");
      const trackInputs = document.getElementById("track_input_fields");
      userGenericInputs.classList.add("animate__animated", "animate__fadeOut");
      userGenericInputs.classList.add("display-none");
      trackInputs.classList.remove("display-none");
      trackInputs.classList.add("animate__animated", "animate__fadeIn");
  }


}
