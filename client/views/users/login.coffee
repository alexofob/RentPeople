Template.loginForm.events({
  'submit #login-form': (e, t) ->
    e.preventDefault()

    Session.set('loginErrorMessage', false)
    email = t.find('#login-email').value
    password = t.find('#login-password').value
    Meteor.loginWithPassword(email, password, (err) ->
      if err?
        Session.set('loginErrorMessage', 'Sign In Failed: ' + err.reason)
      else
        Meteor.setTimeout(() ->
          t.find('#login-email').value = ""
          t.find('#login-password').value = ""
          $('#loginModal').modal('hide')
        , 400)
        if Session.get('scenario') == 'listHouse'
          $('#listHouse').trigger('submit')
    )
    return false

  'click #sign-up-button': () ->
    $('#loginModal').on('hidden.bs.modal', () ->
      $('#signUpModal').modal('show')
    ).modal('hide')
    return false
})

Template.loginForm.helpers(
  errorMessage: () ->
    return Session.get('loginErrorMessage')

  currentUserMessage: () ->
    if Meteor.user()
      return 'Logged in as: ' + Meteor.user().emails[0].address
    else
      return false
)