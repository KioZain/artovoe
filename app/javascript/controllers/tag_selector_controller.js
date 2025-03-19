import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tag", "hiddenInput"]
  static values = { context: String }

  connect() {
    console.log("Контроллер tag-selector подключен для контекста:", this.contextValue)
    this.selectedTags = []
    this.updateSelectedTagsUI()
  }

  toggleTag(event) {
    const tagName = event.currentTarget.dataset.tagName
    console.log("Кликнут тег:", tagName)

    if (this.selectedTags.includes(tagName)) {
      this.selectedTags = this.selectedTags.filter(t => t !== tagName)
    } else {
      this.selectedTags.push(tagName)
    }

    console.log("Выбранные теги:", this.selectedTags)
    this.updateHiddenInput()
    this.updateSelectedTagsUI()
  }

  updateHiddenInput() {
    this.hiddenInputTarget.value = JSON.stringify(this.selectedTags)
    console.log("Скрытое поле обновлено:", this.hiddenInputTarget.value)
  }

  updateSelectedTagsUI() {
    this.tagTargets.forEach(tagElement => {
      const tagName = tagElement.dataset.tagName
      const isSelected = this.selectedTags.includes(tagName)
      tagElement.classList.toggle("selected", isSelected)
    })
  }
}