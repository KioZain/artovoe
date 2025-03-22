import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.isVisible = false;
    document.addEventListener("click", this.handleOutsideClick.bind(this));
  }

  disconnect() {
    document.removeEventListener("click", this.handleOutsideClick.bind(this));
  }

  toggle(event) {
    event.stopPropagation(); 
    if (this.isVisible) {
      this.hide();
    } else {
      this.show();
    }
  }
  show() {
    this.contentTarget.style.display = "block"; 
    this.isVisible = true;
  }

  hide() {
    this.contentTarget.style.display = "none"; 
    this.isVisible = false;
  }

  handleOutsideClick(event) {
    const dropdownElement = this.element; 

    if (!dropdownElement.contains(event.target)) {
      this.hide();
    }
  }
}