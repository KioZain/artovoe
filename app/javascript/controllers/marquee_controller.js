import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("connected")
    this.cloneContent()
  }

  cloneContent() {
    const content = this.element.querySelector('.A_TickerContent')
    const clone = content.cloneNode(true)
    content.parentNode.appendChild(clone)
  }
}