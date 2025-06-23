// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"





// notice and notifications hide
document.addEventListener("turbo:load", () => {
    const notice = document.getElementById('notice');
    if (notice) {

      if (!notice.dataset.noticeFading) {
        notice.dataset.noticeFading = "true";
  
        setTimeout(() => {
          notice.classList.add('hide');
          setTimeout(() => {
            notice.remove();
          }, 200); 
        }, 1500); 
      }
    }
  });