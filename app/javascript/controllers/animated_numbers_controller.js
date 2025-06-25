import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { 
    speed: { type: Number, default: 800 },           
    fadeSpeed: { type: Number, default: 300 },      
    animationDuration: { type: Number, default: 400 }
  }

  connect() {
    console.log('connected animated_numbers_controller')
    this.currentNumber = 1
    this.activeElements = []
    this.colors = ['#fff25e', '#6bb5ff', '#2ddc63', '#ff94d3'] 
    this.isAnimating = false
    this.mouseX = 0
    this.mouseY = 0
    
    this.mouseMoveHandler = this.handleMouseMove.bind(this)
    this.element.addEventListener('mousemove', this.mouseMoveHandler)
    
    this.startAnimation()
  }

  disconnect() {
    this.stopAnimation()
    this.element.removeEventListener('mousemove', this.mouseMoveHandler)
  }

  startAnimation() {
    if (this.isAnimating) return
    
    this.isAnimating = true
    this.showNextNumber()
  }

  stopAnimation() {
    this.isAnimating = false
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
    this.clearAllNumbers()
  }

  showNextNumber() {
    if (!this.isAnimating) return

    const numberElement = this.createNumberElement(this.currentNumber)
    this.activeElements.push(numberElement)
    this.element.appendChild(numberElement)

    numberElement.classList.add('pop-in')

    this.currentNumber++

    if (this.currentNumber > 9) {
      this.timeout = setTimeout(() => {
        this.hideAllNumbers()
      }, this.speedValue)
    } else {
      this.timeout = setTimeout(() => {
        this.showNextNumber()
      }, this.speedValue)
    }
  }

  createNumberElement(number) {
    const element = document.createElement('div')
    element.className = 'animated-number'
    element.textContent = number
    
    const randomColor = this.colors[Math.floor(Math.random() * this.colors.length)]
    element.style.backgroundColor = randomColor
    
    const margin = 26
    const maxX = this.element.offsetWidth - margin
    const maxY = this.element.offsetHeight - margin
    
    const randomX = Math.random() * (maxX - margin) + margin
    const randomY = Math.random() * (maxY - margin) + margin
    
    element.style.left = `${randomX}px`
    element.style.top = `${randomY}px`
    
    return element
  }

  hideAllNumbers() {
    if (this.activeElements.length === 0) {
      this.resetAndRestart()
      return
    }

    const element = this.activeElements.shift()
    
    element.classList.remove('pop-in')
    element.classList.add('pop-out')
    
    setTimeout(() => {
      if (element.parentNode) {
        element.parentNode.removeChild(element)
      }
      
      this.timeout = setTimeout(() => {
        this.hideAllNumbers()
      }, this.fadeSpeedValue)
    }, this.animationDurationValue) 
  }

  resetAndRestart() {
    this.currentNumber = 1
    this.activeElements = []
    
    this.timeout = setTimeout(() => {
      this.showNextNumber()
    }, this.speedValue)
  }

  clearAllNumbers() {
    this.activeElements.forEach(element => {
      if (element.parentNode) {
        element.parentNode.removeChild(element)
      }
    })
    this.activeElements = []
  }

  handleMouseMove(event) {
    const rect = this.element.getBoundingClientRect()
    this.mouseX = event.clientX - rect.left
    this.mouseY = event.clientY - rect.top
    
    // console.log(this.mouseX, this.mouseY, 'elem:', this.activeElements.length)

    this.updateElementsPosition()
  }

  updateElementsPosition() {
    this.activeElements.forEach(element => {
      if (!element.originalX) {
        element.originalX = parseInt(element.style.left)
        element.originalY = parseInt(element.style.top)
      }
      
      const deltaX = this.mouseX - element.originalX
      const deltaY = this.mouseY - element.originalY
      
      const maxOffset = 8
      const offsetX = Math.max(-maxOffset, Math.min(maxOffset, deltaX * 0.05))
      const offsetY = Math.max(-maxOffset, Math.min(maxOffset, deltaY * 0.05))
      
      element.style.transform = `translate(-50%, -50%) scale(1) translate(${offsetX}px, ${offsetY}px)`
    })
  }
}