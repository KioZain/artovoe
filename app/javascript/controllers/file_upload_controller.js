import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "preview", "dropzone", "replaceBtn"]

  connect() {
    console.log('connected')
    
    
    this.dropzoneTarget.addEventListener('dragover', (e) => e.preventDefault())
    this.dropzoneTarget.addEventListener('drop', (e) => {
      e.preventDefault()
      this.inputTarget.files = e.dataTransfer.files
      this.updatePreview()
    })
  }

  openFilePicker() {
    this.inputTarget.click()
  }

  handleFileSelect() {
    this.updatePreview()
  }

  updatePreview() {
    const file = this.inputTarget.files[0]
    
    console.log(this.inputTarget.files[0])

    if (file && file.type.startsWith('image/')) {
      const reader = new FileReader()
      reader.onload = (e) => {
        this.previewTarget.style.backgroundImage = `url(${e.target.result})`
        this.previewTarget.classList.add('has-image')
        this.replaceBtnTarget.style.display = 'block'
      }
      reader.readAsDataURL(file)
    }
  }

  resetFile() {
    this.inputTarget.value = ''
    this.previewTarget.style.backgroundImage = ''
    this.previewTarget.classList.remove('has-image')
    this.replaceBtnTarget.style.display = 'none'
  }
}