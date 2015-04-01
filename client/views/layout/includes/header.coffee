Meteor.startup(() ->

  Session.set('signUpErrorMessage', false)
  Session.set('signUpSuccessMessage', false)
  Session.set('loginErrorMessage', false)
)

Template.header.events(
  'click #login': () ->
    $('#loginModal').modal('show')
    Session.set('scenario', 'home')
)

Template.loggedInNav.helpers(
  user: () ->
    return Meteor.user().profile['fname']
)

Template.loggedInNav.events(
  'click #logOut': () ->
    Meteor.logout()
)