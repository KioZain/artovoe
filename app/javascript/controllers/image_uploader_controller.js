import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["dropzone", "fileInput", "uploadText", "removeButton", "preview"]
    static values = {
        maxSize: { type: Number, default: 5 }, // 5MB default
        allowedTypes: { type: Array, default: ["image/jpeg", "image/jpg", "image/png", "image/webp"] }
    }

    connect() {
        this.setupEventListeners()
        this.hideRemoveButton()
    }

    disconnect() {
        this.removeEventListeners()
    }

    setupEventListeners() {
        // Click to select file
        this.dropzoneTarget.addEventListener('click', this.handleClick.bind(this))

        // Drag and drop events
        this.dropzoneTarget.addEventListener('dragover', this.handleDragOver.bind(this))
        this.dropzoneTarget.addEventListener('dragleave', this.handleDragLeave.bind(this))
        this.dropzoneTarget.addEventListener('drop', this.handleDrop.bind(this))

        // File input change
        this.fileInputTarget.addEventListener('change', this.handleFileSelect.bind(this))

        // Remove button click
        this.removeButtonTarget.addEventListener('click', this.removeFile.bind(this))
    }

    removeEventListeners() {
        this.dropzoneTarget.removeEventListener('click', this.handleClick.bind(this))
        this.dropzoneTarget.removeEventListener('dragover', this.handleDragOver.bind(this))
        this.dropzoneTarget.removeEventListener('dragleave', this.handleDragLeave.bind(this))
        this.dropzoneTarget.removeEventListener('drop', this.handleDrop.bind(this))
        this.fileInputTarget.removeEventListener('change', this.handleFileSelect.bind(this))
        this.removeButtonTarget.removeEventListener('click', this.removeFile.bind(this))
    }

    handleClick(event) {
        // Don't trigger if clicking on remove button
        if (event.target.closest('[data-image-uploader-target="removeButton"]')) {
            return
        }
        this.fileInputTarget.click()
    }

    handleDragOver(event) {
        event.preventDefault()
        this.dropzoneTarget.classList.add('drag-over')
    }

    handleDragLeave(event) {
        event.preventDefault()
        // Only remove class if leaving the dropzone entirely
        if (!this.dropzoneTarget.contains(event.relatedTarget)) {
            this.dropzoneTarget.classList.remove('drag-over')
        }
    }

    handleDrop(event) {
        event.preventDefault()
        this.dropzoneTarget.classList.remove('drag-over')

        const files = event.dataTransfer.files
        if (files.length > 0) {
            this.processFile(files[0])
        }
    }

    handleFileSelect(event) {
        const file = event.target.files[0]
        if (file) {
            this.processFile(file)
        }
    }

    processFile(file) {
        // Validate file type
        if (!this.allowedTypesValue.includes(file.type)) {
            this.showError('Неподдерживаемый формат файла. Используйте JPG, JPEG, PNG или WEBP.')
            return
        }

        // Validate file size (convert MB to bytes)
        const maxSizeBytes = this.maxSizeValue * 1024 * 1024
        if (file.size > maxSizeBytes) {
            this.showError(`Файл слишком большой. Максимальный размер: ${this.maxSizeValue}МБ`)
            return
        }

        // Update UI
        this.updateUploadText(file.name)
        this.showRemoveButton()
        this.showPreview(file)

        // Add success state
        this.dropzoneTarget.classList.add('has-file')
    }

    showPreview(file) {
        const reader = new FileReader()
        reader.onload = (event) => {
            this.previewTarget.style.backgroundImage = `url(${event.target.result})`
            this.previewTarget.classList.add('visible')
        }
        reader.readAsDataURL(file)
    }

    updateUploadText(fileName) {
        this.uploadTextTarget.textContent = fileName
    }

    showRemoveButton() {
        this.removeButtonTarget.style.display = 'flex'
    }

    hideRemoveButton() {
        this.removeButtonTarget.style.display = 'none'
    }

    removeFile(event) {
        event.stopPropagation()

        // Clear file input
        this.fileInputTarget.value = ''

        // Reset UI
        this.uploadTextTarget.innerHTML = 'Нажмите, чтобы загрузить файл,<br>либо перетащите сюда'
        this.hideRemoveButton()
        this.dropzoneTarget.classList.remove('has-file')

        // Clear preview
        this.previewTarget.style.backgroundImage = ''
        this.previewTarget.classList.remove('visible')
    }

    showError(message) {
        // You can implement a more sophisticated error display
        alert(message)
    }
} 