// display_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Form connected");
    this.element.addEventListener("submit", this.handleSubmit.bind(this));
  }

  disconnect() {
    console.log("Form disconnecting");
    this.element.removeEventListener("submit", this.handleSubmit.bind(this));
  }

  handleSubmit(event) {
    console.log("Form submission intercepted");
    // Clear form fields after successful submission
    this.element.addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        this.clearForm();
      }
    }, { once: true });
  }

  clearForm() {
    const inputs = this.element.querySelectorAll('input[type="text"], select');
    inputs.forEach(input => {
      if (input.type === 'text') {
        input.value = '';
      } else if (input.tagName === 'SELECT') {
        input.selectedIndex = 0;
      }
    });
  }
}