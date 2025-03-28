import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "addedWorks", "hiddenFields"]
  
  connect() {
    console.log('PostSelector controller connected')
    this.selectedPosts = []
    this.loadInitialSelection()
    this.selectedPosts.forEach(id => {
      const post = document.querySelector(`[data-post-id="${id}"]`)
      if (post) {
        this.addToAddedWorks(post)
        this.updateButton(post.querySelector('.A_Toggle'), 'remove')
      }
    })
    document.addEventListener('click', this.handleClickOutside.bind(this))
  }

  loadInitialSelection() {
    const ids = [...this.hiddenFieldsTarget.querySelectorAll('input')].map(i => i.value)
    console.log('Initial hidden posts:', ids)
    ids.forEach(id => this.addPost(id))
  }

  toggleModal() {
    this.modalTarget.style.display = this.modalTarget.style.display === 'flex' ? 'none' : 'flex'
  }

  handleClickOutside(event) {
    if (!this.element.contains(event.target)) this.closeModal()
  }

  togglePost(event) {
    event.stopPropagation()
    const post = event.currentTarget
    const id = post.dataset.postId
    const btn = post.querySelector('.A_Toggle')
    
    this.selectedPosts.includes(id) 
      ? this.removePost(id, btn) 
      : this.addPost(id, btn, post)
    
    this.updateUI()
  }

  addPost(id, btn = null, post = null) {
    if (!this.selectedPosts.includes(id)) {
      this.selectedPosts.push(id)
      btn && this.updateButton(btn, 'remove')
      post && this.addToAddedWorks(post)
    }
  }

  removePost(id, btn) {
    const index = this.selectedPosts.indexOf(id)
    if (index >= 0) {
      this.selectedPosts.splice(index, 1)
      this.updateButton(btn, 'add')
      this.removeFromAddedWorks(id)
    }
  }

  updateButton(btn, action) {
    btn.querySelector('.add').style.display = action === 'add' ? 'inline-block' : 'none'
    btn.querySelector('.remove').style.display = action === 'remove' ? 'inline-block' : 'none'
  }

  addToAddedWorks(post) {
    const clone = post.cloneNode(true)
    clone.querySelector('.A_Toggle')?.remove()
    this.addedWorksTarget.appendChild(clone)
    this.updateEmptyState()
  }

  removeFromAddedWorks(id) {
    const item = this.addedWorksTarget.querySelector(`[data-post-id="${id}"]`)
    item?.remove()
    this.updateEmptyState()
  }

  updateHiddenField() {
    this.hiddenFieldsTarget.querySelectorAll('input').forEach(i => i.remove())
    this.selectedPosts.forEach(id => {
      const input = document.createElement('input')
      input.type = 'hidden'
      input.name = 'collection[post_ids][]'
      input.value = id
      this.hiddenFieldsTarget.appendChild(input)
    })
  }

  updateEmptyState() {
    const empty = this.addedWorksTarget.querySelector('.empty-state')
    const hasPosts = this.selectedPosts.length > 0
    
    if (hasPosts && empty) empty.remove()
    if (!hasPosts && !empty) 
      this.addedWorksTarget.innerHTML = '<div class="empty-state">Нет добавленных работ</div>'
  }

  updateUI() {
    this.updateHiddenField()
    this.updateEmptyState()
  }

  closeModal() {
    this.modalTarget.style.display = 'none'
  }

  disconnect() {
    document.removeEventListener('click', this.handleClickOutside)
  }
}