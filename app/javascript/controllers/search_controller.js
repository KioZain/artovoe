import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.originalPadding = document.body.style.paddingRight;
    this.scrollBarWidth = this.getScrollbarWidth();
  }

  showModal(event) {
    event.target.placeholder = "Тут поиск"
    
    this.modalTarget.classList.add('active')
    
    // document.body.style.paddingRight = `${this.scrollBarWidth}px`;
    // document.body.classList.add('search-modal-open');
    

    document.addEventListener('keyup', this.handleKeyup);
  }

  hideModal = () => {
    const input = this.element.querySelector('.M_MenuSearch')
    input.placeholder = "Поиск"
    
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