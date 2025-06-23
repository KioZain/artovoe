// app/javascript/controllers/collapsible_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "arrow"]
  static classes = ["hidden", "rotated"]

  connect() {
    this.initializeState()
  }

  initializeState() {
    const displayItems = this.contentTarget.querySelectorAll('.M_Display')
    const itemCount = displayItems.length
    
    if (itemCount <= 2) {
      this.contentTarget.style.height = "auto"
      this.contentTarget.style.overflow = "visible"
    } else {
      this.contentTarget.style.height = "0px"
      this.contentTarget.style.overflow = "hidden"
      this.arrowTarget.classList.add(this.rotatedClass)
    }
  }

  toggle() {
    const content = this.contentTarget
    const arrow = this.arrowTarget
    
    if (content.style.height === "0px") {
      const scrollHeight = content.scrollHeight
      content.style.height = scrollHeight + "px"
      arrow.classList.remove(this.rotatedClass)
      

      setTimeout(() => {
        content.style.height = "auto"
        content.style.overflow = "visible"
      }, 300)
    } else {
      // Сворачиваем
      content.style.overflow = "hidden"
      content.style.height = content.scrollHeight + "px"
      content.offsetHeight
      
      content.style.height = "0px"
      arrow.classList.add(this.rotatedClass)
    }
  }
}