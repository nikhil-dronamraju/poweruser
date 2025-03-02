import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["generic", "track", "saga"];
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
    let currentPage = document.getElementById(this.currentPageValue);
    let nextPage = document.getElementById(this.nextPageValue);
    currentPage.classList.add("display-none");
    nextPage.classList.remove("display-none");
  }

}
