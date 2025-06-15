// display_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Проверяем, что элемент действительно в DOM
    if (this.element.isConnected && this.element.id) {
      console.log("Form properly connected with ID:", this.element.id);
    }
  }
  
  disconnect() {
    console.log("Form disconnecting");
  }
}