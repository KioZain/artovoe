import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ['active']
  static targets = ["btn", "tab"]
  static values = { defaultTab: String }

  connect() {
    this.tabTargets.forEach(tab => tab.hidden = true)

    const selectedTab = this.tabTargets.find(tab => tab.id === this.defaultTabValue)
    if (selectedTab) {
      selectedTab.hidden = false
    }

    const selectedBtn = this.btnTargets.find(btn => btn.id === this.defaultTabValue)
    if (selectedBtn) {
      selectedBtn.classList.add(...this.activeClasses)
    }
  }

  select(event) {
    const selectedId = event.currentTarget.id
    const selectedTab = this.tabTargets.find(tab => tab.id === selectedId)

    if (!selectedTab || !selectedTab.hidden) return

    this.tabTargets.forEach(tab => tab.hidden = true)
    this.btnTargets.forEach(btn => btn.classList.remove(...this.activeClasses))

    selectedTab.hidden = false
    event.currentTarget.classList.add(...this.activeClasses)
  }
}