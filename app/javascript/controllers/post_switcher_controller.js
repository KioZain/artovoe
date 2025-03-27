// app/javascript/controllers/post_switcher_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["arrow"]

  navigate(event) {
    const url = event.currentTarget.dataset.url
    console.log("Attempting to navigate to:", url) // Добавлено логирование
    
    if (url && url !== '#') {
      window.location.href = url
    } else {
      console.error("Invalid URL:", url)
    }
  }
}