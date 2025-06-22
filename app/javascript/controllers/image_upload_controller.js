import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropzone", "fileInput", "uploaderText"]

  connect() {
    this.originalText = this.uploaderTextTarget.innerHTML
    console.log("ImageUploadController connected")
  }

  triggerFileInput() {
    this.fileInputTarget.click()
  }

  handleFileSelect(event) {
    const file = event.target.files[0]
    if (file) {
      this.updateUI(file)
    }
  }

  handleDragOver(event) {
    event.preventDefault()
    event.stopPropagation()
    this.dropzoneTarget.classList.add("drag-over")
  }

  handleDragLeave(event) {
    event.preventDefault()
    event.stopPropagation()
    if (!this.dropzoneTarget.contains(event.relatedTarget)) {
      this.dropzoneTarget.classList.remove("drag-over")
    }
  }

  handleDrop(event) {
    event.preventDefault()
    event.stopPropagation()
    this.dropzoneTarget.classList.remove("drag-over")
    
    const files = event.dataTransfer.files
    if (files.length > 0) {
      const file = files[0]
      this.setFileToInput(file)
      this.updateUI(file)
    }
  }

  setFileToInput(file) {
    const dataTransfer = new DataTransfer()
    dataTransfer.items.add(file)
    this.fileInputTarget.files = dataTransfer.files
  }

  updateUI(file) {
    this.uploaderTextTarget.innerHTML = `<strong>${file.name}</strong><br><small>Нажмите, чтобы выбрать другой файл</small>`
    this.dropzoneTarget.classList.add("file-uploaded")
  }

  reset() {
    this.uploaderTextTarget.innerHTML = this.originalText
    this.dropzoneTarget.classList.remove("file-uploaded", "drag-over")
    this.fileInputTarget.value = ""
  }
}