document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    var totalQuestions  = document.querySelector('.passage-progress').dataset.totalQuestions
    var question = progressBar.dataset.question

    if (question > 1) {
      var width = (question - 1) / totalQuestions * 100
      progressBar.style.width = width + '%'
    }
  }
})
