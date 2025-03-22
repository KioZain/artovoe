import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.originalPadding = document.body.style.paddingRight;
    this.scrollBarWidth = this.getScrollbarWidth();
  }

  showModal(event) {

  if (this.modalTarget.classList.contains('active')) {
    this.hideModal();
    return;
  }

  this.modalTarget.classList.add('active')    
  document.addEventListener('keyup', this.handleKeyup);
    
    // document.body.style.paddingRight = `${this.scrollBarWidth}px`;
    // document.body.classList.add('search-modal-open');

  }

  hideModal = () => {
    const input = this.element.querySelector('.M_MenuSearch')
    
    this.modalTarget.classList.remove('active')
    this.modalTarget.classList.add('closing')
    
    setTimeout(() => {
      this.modalTarget.classList.remove('closing')
      document.body.style.paddingRight = this.originalPadding;
      document.body.classList.remove('search-modal-open');
      input.blur()
    }, 300); 
  }

  handleKeyup = (event) => {
    if (event.key === "Escape") this.hideModal()
  }


  getScrollbarWidth() {
    return window.innerWidth - document.documentElement.clientWidth;
  }

  clickOutside(event) {
    if (!this.element.contains(event.target) && 
        !this.modalTarget.contains(event.target) &&
        this.modalTarget.classList.contains('active')) {
      this.hideModal()
    }
  }
}