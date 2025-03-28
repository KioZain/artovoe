
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static classes = ["active"];
  static targets = ["btn", "tab"];
  static values = {
    defaultTab: String, 
  };

  connect() {
    console.log('Tabs for form')
    this.showTab(this.defaultTabValue);
  }

  select(event) {
    event.preventDefault();
    const target = event.currentTarget.dataset.target;
    this.showTab(target);
  }

  showTab(target) {
    this.tabTargets.forEach((tab) => {
      tab.classList.toggle("active", tab.id === target);
    });

    this.btnTargets.forEach((btn) => {
      btn.classList.toggle(this.activeClass, btn.dataset.target === target);
    });
  }
}