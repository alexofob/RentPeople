Meteor.startup(() ->

  Session.set('signUpErrorMessage', false)
  Session.set('signUpSuccessMessage', false)
  Session.set('loginErrorMessage', false)
)

Template.loggedInNav.helpers(
  user: () ->
    return Meteor.user().profile['firstName']
)

Template.loggedInNav.events(
  'click #logOut': () ->
    Meteor.logout( ->
      Router.go('home')
    )
)