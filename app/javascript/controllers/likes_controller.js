// app/javascript/controllers/likes_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  toggle(event) {
    event.preventDefault()
    const button = this.buttonTarget
    const isLiked = button.classList.contains("liked")

    // Мгновенное изменение состояния
    button.classList.toggle("liked", !isLiked)
    
    // Анимация
    button.style.transform = "scale(1.1)"
    setTimeout(() => button.style.transform = "", 300)

    // Отправка запроса
    fetch(button.href, { method: "POST", headers: { "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content } })
      .then(response => {
        if (!response.ok) throw new Error("Network response was not ok")
      })
      .catch(() => {
        // Откат изменений при ошибке
        button.classList.toggle("liked", isLiked)
      })
  }
}