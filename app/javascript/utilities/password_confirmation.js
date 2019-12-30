document.addEventListener('turbolinks:load', function() {
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password_confirmation) {
    password_confirmation.addEventListener('input', password_confirmation_check)
  }
})

function password_confirmation_check () {
  var password = document.getElementById('user_password').value
  var password_confirmation = this.value


  if (!password_confirmation.length) {
    document.querySelector('.octicon-verified').classList.add('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  }

  if (password == password_confirmation) {
    document.querySelector('.octicon-verified').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  }

  else {
    document.querySelector('.octicon-verified').classList.add('hide')
    document.querySelector('.octicon-x').classList.remove('hide')
  }
}
