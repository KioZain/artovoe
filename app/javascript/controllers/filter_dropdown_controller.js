import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.targetId = this.element.dataset.filterDropdownTargetId;
    this.content = document.getElementById(this.targetId);

    this.updateStateFromURL();

    document.addEventListener("turbo:load", this.updateStateFromURL.bind(this));
  }

  disconnect() {
    document.removeEventListener("turbo:load", this.updateStateFromURL.bind(this));
  }

  updateStateFromURL() {
    const url = new URL(window.location.href);
    this.expanded = url.searchParams.has("filter_expanded");

    this.updateContent();
    this.updateIcon();
  }

  toggle() {
    this.expanded = !this.expanded;

    const url = new URL(window.location.href);
    if (this.expanded) {
      url.searchParams.set("filter_expanded", "true");
    } else {
      url.searchParams.delete("filter_expanded");
    }
    history.pushState({}, "", url);

    this.updateContent();
    this.updateIcon();
  }

  updateContent() {
    if (!this.content) return;
    this.content.classList.toggle("expanded", this.expanded);
    this.content.style.maxHeight = this.expanded ? 
      `${this.content.scrollHeight}px` : 
      "0";
  }

  updateIcon() {
    const icon = this.element.querySelector('.icon-arrow');
    icon.style.transform = this.expanded ? 
      "rotate(180deg)" : 
      "rotate(0)";
  }
}