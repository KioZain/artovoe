import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  async saveAndRedirect(event) {
    event.preventDefault();

    const form = this.element;
    const formData = new FormData(form);

    const response = await fetch(form.action, {
      method: "POST",
      body: formData,
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
        "Accept": "application/json"
      }
    });

    const data = await response.json();

    if (data.id) {
      window.location.href = `/posts/${data.id}/displays/new?saved=1`;
    } else {
      alert("Ошибка при сохранении поста");
    }
  }
}