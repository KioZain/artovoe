import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {

    this.isHovered = false;
  }

  show() {
    this.contentTarget.style.display = "block";
    this.isHovered = true;
  }

  hide() {
    if (!this.isHovered) {
      this.contentTarget.style.display = "none";
    }
  }

  mouseEnter() {
    this.isHovered = true;
  }

  mouseLeave() {
    this.isHovered = false;
    setTimeout(() => {
      if (!this.isHovered) {
        this.contentTarget.style.display = "none";
      }
    }, 100);
  }
}