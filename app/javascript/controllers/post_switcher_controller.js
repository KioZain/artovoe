// app/javascript/controllers/post_switcher_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  navigate(event) {
    const url = event.currentTarget.dataset.postSwitcherUrl
    const isDisabled = event.currentTarget.classList.contains('disabled')
    
    if (url && !isDisabled) {
      window.location.href = url
    }
  }
}