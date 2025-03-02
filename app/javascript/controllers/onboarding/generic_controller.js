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
    console.log(this.usernameTarget);
    inputsAndErrIcons.set(this.usernameTarget, this.usernameErrorTarget);
    inputsAndErrIcons.set(this.nameTarget, this.nameErrorTarget );
    inputsAndErrIcons.set(this.emailTarget, this.emailErrorTarget);
    inputsAndErrIcons.set(this.passwordTarget, this.passwordErrorTarget);
    inputsAndErrIcons.set(this.passwordConfirmationTarget, this.passwordConfirmationErrorTarget);
    let checkBlankValidations = this.validateBlanks(inputsAndErrIcons);
    let checkPasswordMatches = false;
    let checkIsEmail = false;
    if (checkBlankValidations) {
      checkPasswordMatches = this.checkPasswordMatches();
    }
    if (checkPasswordMatches) {
      checkIsEmail = this.checkEmailValid();
    }
    if (checkBlankValidations && checkPasswordMatches && checkIsEmail) {
        if (this.currentPageValue === "generic"){
            this.element.classList.add("display-none");
            let nextPage = document.getElementById(this.nextPageValue);
            nextPage.classList.remove("display-none");
        }
    }
  }

  validateBlanks(fieldMap) {
      for (const [key, value] of fieldMap.entries()) {
          let isBlank = this.checkIsBlank(key, value);
          if (isBlank) {
              return false;
          }
      }
      return true;
  }

  checkIsBlank(field, fieldErrIcon) {
      let targetName = field.dataset["onboarding-GenericTarget"];
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
      if ( this.passwordTarget.value !== this.passwordConfirmationTarget.value ) {
          this.passwordTarget.value = "";
          this.passwordTarget.placeholder = "Passwords must match.";
          this.passwordErrorTarget.classList.remove("display-none");
          this.passwordConfirmationTarget.placeholder = "Passwords must match.";
          this.passwordConfirmationTarget.value = "";
          this.passwordConfirmationErrorTarget.classList.remove("display-none");
          return false;
      } else {
          this.passwordErrorTarget.classList.add("display-none");
          this.passwordConfirmationErrorTarget.classList.add("display-none");
          return true;
      }
  }

  checkEmailValid() {
      const isEmailRegex = /^.+@.+$/;
      const regex = new RegExp(isEmailRegex);
      const isEmail = regex.test(this.emailTarget.value);
      if (isEmail) {
          this.emailErrorTarget.classList.add("display-none");
          return true;
      } else {
          this.emailTarget.value = "";
          this.emailTarget.placeholder = "Invalid email.";
          this.emailErrorTarget.classList.remove("display-none");
          return false;
      }
  }




}
