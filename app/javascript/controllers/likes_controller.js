import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "count"]
  
  connect() {
   
    this.buttonTarget.addEventListener('ajax:success', () => {
      this.buttonTarget.textContent = this.buttonText()
        console.log('Connected')
    })
  }

  buttonText() {
    return this.buttonTarget.textContent === "Like" ? "Unlike" : "Like"
  }
}