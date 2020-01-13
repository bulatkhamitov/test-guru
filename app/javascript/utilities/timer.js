document.addEventListener('turbolinks:load', function () {
  var timer = document.getElementById('timer')

  if (timer) { start(timer) }
})

function start() {
  var initialTime = timer.dataset.initialTime
  var passageTime = timer.dataset.passageTime
  var elapsedTime = Math.trunc(Date.now() / 1000) - initialTime
  var remainingTime = passageTime - elapsedTime

  if (elapsedTime >= passageTime) {
    document.querySelector('.test-passage-form').submit()
    return
  }

  var hours   = Math.trunc(remainingTime / 3600)
  var minutes = Math.trunc((remainingTime - (hours * 3600)) / 60)
  var seconds = remainingTime - (hours * 3600) - (minutes * 60)

  if (seconds < 10) { seconds = '0' + seconds }

  if (minutes < 10) { minutes = '0' + minutes }

  if (hours < 10) { hours = '0' + hours }

  timer.textContent = hours + ':' + minutes + ':' + seconds

  setTimeout(start, 1000, timer)
}
