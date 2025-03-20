import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown"]

  connect() {
    document.addEventListener('click', this.handleClickOutside.bind(this))
  }

  toggle(event) {
    const dropdown = event.currentTarget.closest('.M_DropDown')
    dropdown.classList.toggle('active')
  }

  handleClickOutside(event) {
    const dropdowns = document.querySelectorAll('.M_DropDown')
    dropdowns.forEach(dropdown => {
      if (!dropdown.contains(event.target)) {
        dropdown.classList.remove('active')
      }
    })
  }
  
}