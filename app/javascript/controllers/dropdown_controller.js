import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    // Инициализация состояния
    this.isHovered = false;
  }

  // Показать выпадающее меню
  show() {
    this.contentTarget.style.display = "block";
    this.isHovered = true;
  }

  // Скрыть выпадающее меню
  hide() {
    if (!this.isHovered) {
      this.contentTarget.style.display = "none";
    }
  }

  // Обработчик наведения на контейнер
  mouseEnter() {
    this.isHovered = true;
  }

  // Обработчик ухода курсора с контейнера
  mouseLeave() {
    this.isHovered = false;
    setTimeout(() => {
      if (!this.isHovered) {
        this.contentTarget.style.display = "none";
      }
    }, 100); // Небольшая задержка для более плавного взаимодействия
  }
}