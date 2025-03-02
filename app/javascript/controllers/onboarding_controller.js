import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "username", "name", "password", "passwordConfirmation", "email", "usernameError", "nameError", "passwordError", "passwordConfirmationError", "emailError" ];
  static values = {
      currentPage: String,
      nextPage: String
  }
  update_icon_input() {
      const buttonElement = this.element;
      const index = this.data.get("index");
      const icon = buttonElement.children[0];
      const inputHiddenField = document.getElementById(`user_tracks_attributes_${index}_icon`);
      const openModalButton = document.getElementById(`open_icon_modal_${index}`);
      openModalButton.innerHTML = icon.outerHTML;
      inputHiddenField.value = icon.outerHTML;
  }

  flip_to_page(){
    let inputsAndErrIcons = new Map();
    inputsAndErrIcons.set(this.usernameTarget, this.usernameErrorTarget);
    inputsAndErrIcons.set(this.nameTarget, this.nameErrorTarget );
    inputsAndErrIcons.set(this.emailTarget, this.emailErrorTarget);
    inputsAndErrIcons.set(this.passwordTarget, this.passwordErrorTarget);
    inputsAndErrIcons.set(this.passwordConfirmationTarget, this.passwordConfirmationErrorTarget);
    let checkBlankValidations = this.validateBlanks(inputsAndErrIcons);
    let checkPasswordMatches = this.checkPasswordMatches();
    let checkIsEmail = this.checkEmailValid();
    if (checkBlankValidations && checkPasswordMatches && checkIsEmail) {
        // Flip to the next page?
        if (this.currentPageValue === "generic"){
            this.element.classList.add("display-none");

        }
    }
  }

  validateBlanks(fieldMap) {
      fieldMap.keys().forEach((k) => {
          let isBlank = this.checkIsBlank(k, fieldMap.get(k));
          if (isBlank) {
              return false;
          }
      });
      return true;
  }

  checkIsBlank(field, fieldErrIcon) {
      let targetName = field.dataset.onboardingTarget;
      let capitalizedTargetName = String(targetName[0]).toUpperCase() + String(targetName).slice(1);
      if (capitalizedTargetName === "PasswordConfirmation") {
          capitalizedTargetName = "Password confirmation"
      }
      let isBlank = field.value === ""
      if (isBlank) {
          fieldErrIcon.classList.remove("display-none");
          field.placeholder = `${capitalizedTargetName} cannot be blank`;
          return true;
      } else {
          fieldErrIcon.classList.add("display-none");
          return false;
      }
  }

  checkPasswordMatches() {
      return this.passwordTarget.value === this.passwordConfirmationTarget.value;
  }

  checkEmailValid() {
      const isEmail = /^.+@.+$/;
      const regex = new RegExp(isEmail);
      return regex.test(this.emailTarget.value);
  }




}
