import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    console.log('Connected filter_dropdown')
    this.expanded = false;
  }

  toggle() {
    this.expanded = !this.expanded;
    this.contentTarget.style.maxHeight = this.expanded ? "500px" : "0";
    this.contentTarget.style.opacity = this.expanded ? "1" : "0";
    
    // Поворот иконки
    const icon = this.element.querySelector('.icon-arrow');
    icon.style.transform = this.expanded ? "rotate(180deg)" : "rotate(0)";
  }
}