import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello from Stimulus!")
  }

  greet() {
    alert("Hello, Stimulus is working!")
  }
}