import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tag", "hiddenInput"]
  static values = { context: String }

  connect() {
    console.log("Connected:", this.contextValue)
    this.selectedTags = []
    this.updateSelectedTagsUI()
  }

  toggleTag(event) {
    const tagName = event.currentTarget.dataset.tagName
    console.log("clicked:", tagName)

    if (this.selectedTags.includes(tagName)) {
      this.selectedTags = this.selectedTags.filter(t => t !== tagName)
    } else {
      this.selectedTags.push(tagName)
    }

    console.log("tags:", this.selectedTags)
    this.updateHiddenInput()
    this.updateSelectedTagsUI()
  }

  updateHiddenInput() {
  while (this.hiddenInputTarget.firstChild) {
    this.hiddenInputTarget.removeChild(this.hiddenInputTarget.firstChild)
  }

  this.selectedTags.forEach(tag => {
    const input = document.createElement('input')
    input.type = 'hidden'
    input.name = this.hiddenInputTarget.name
    input.value = tag
    this.hiddenInputTarget.appendChild(input)
  })
}

  updateSelectedTagsUI() {
    this.tagTargets.forEach(tagElement => {
      const tagName = tagElement.dataset.tagName
      const isSelected = this.selectedTags.includes(tagName)
      tagElement.classList.toggle("selected", isSelected)
    })
  }
}