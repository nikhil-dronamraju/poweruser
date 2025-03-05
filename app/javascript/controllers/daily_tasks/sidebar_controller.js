import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Connected");
    }
    open_nav() {
        console.log("check");
        document.getElementById("mySidebar").style.width = "30rem";
        document.getElementById("main").style.marginLeft = "30rem";
    }

    /* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
    close_nav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
    }

    create_draft_task() {
        let createDraftTaskPath = `${window.location.href} + "/create_draft_task"`
    }
}
