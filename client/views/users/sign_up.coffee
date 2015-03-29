Template.signUpForm.events({
  'submit #sign-up-form': (e, t) ->
    e.preventDefault()
    Session.set('signUpErrorMessage', false)
    Session.set('signUpSuccessMessage', false)
    firstName = t.find('#signup-fname').value
    lastName = t.find('#signup-lname').value
    email = t.find('#signup-email').value
    password = t.find('#signup-password').value
    profile = {'fname': firstName, 'lname': lastName}
    Accounts.createUser({email, password, profile}, (err) ->
      if err?
        Session.set('signUpErrorMessage', 'Sign Up Failed: ' + err.reason)
      else
        Session.set('signUpSuccessMessage', 'Sign Up Succeeded.')
        Meteor.setTimeout(() ->
          Session.set('signUpSuccessMessage', false)
          t.find('#signup-fname').value = ""
          t.find('#signup-lname').value = ""
          t.find('#signup-email').value = ""
          t.find('#signup-password').value = ""
          $('#signUpModal').modal('hide')
        , 400)
        if Session.get('scenario') == 'listHouse'
          $('#listHouse').trigger('submit')

    )
    return false
})

Template.signUpForm.helpers(
  errorMessage: () ->
    return Session.get('signUpErrorMessage')

  signUpSuccessMessage: () ->
    return Session.get('signUpSuccessMessage')
)
