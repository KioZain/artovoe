import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.originalPadding = document.body.style.paddingRight;
    this.scrollBarWidth = this.getScrollbarWidth();
    this.lastScrollTop = 0;
    this.header = document.querySelector('.S_Header');
    this.isScrolling = false;

    // Add scroll event listener
    window.addEventListener('scroll', this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll.bind(this));
  }

  handleScroll() {
    if (this.isScrolling) return;

    this.isScrolling = true;
    requestAnimationFrame(() => {
      this.updateHeaderVisibility();
      this.isScrolling = false;
    });
  }

  updateHeaderVisibility() {
    const currentScrollTop = window.pageYOffset || document.documentElement.scrollTop;
    const isModalActive = this.modalTarget.classList.contains('active');

    // Always show header when modal is active
    if (isModalActive) {
      this.showHeader();
      return;
    }

    // Don't hide header at the very top of the page
    if (currentScrollTop <= 100) {
      this.showHeader();
      this.lastScrollTop = currentScrollTop;
      return;
    }

    // Hide header when scrolling down, show when scrolling up
    if (currentScrollTop > this.lastScrollTop && currentScrollTop > 100) {
      this.hideHeader();
    } else if (currentScrollTop < this.lastScrollTop) {
      this.showHeader();
    }

    this.lastScrollTop = currentScrollTop;
  }

  showHeader() {
    if (this.header) {
      this.header.classList.remove('header-hidden');
      this.header.classList.add('header-visible');
    }
  }

  hideHeader() {
    if (this.header) {
      this.header.classList.remove('header-visible');
      this.header.classList.add('header-hidden');
    }
  }

  showModal(event) {
    if (this.modalTarget.classList.contains('active')) {
      this.hideModal();
      return;
    }

    this.modalTarget.classList.add('active')
    document.addEventListener('keyup', this.handleKeyup);

    // Ensure header is visible when modal opens
    this.showHeader();
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

      // Update header visibility after modal closes
      this.updateHeaderVisibility();
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