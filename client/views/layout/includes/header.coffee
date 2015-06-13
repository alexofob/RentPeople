class LoggedInNavComponent extends BlazeComponent
  # Register a component so that it can be included in templates. It also
  # gives the component the name. The convention is to use the class name.
  @register 'LoggedInNavComponent'

  template: ->
    'loggedInNav'

# Mapping between events and their handlers.
  events: -> [
# You could inline the handler, but the best is to make
# it a method so that it can be extended later on.
    'click #logOut': @onClickLogOut
  ]

  onClickLogOut: (event) ->
    Meteor.logout( ->
      Router.go('home')
    )

# Any component's method is available as a template helper in the template.
  user: ->
    return Meteor.user().profile['firstName']

  onRendered: ->
    Meteor.setTimeout ( ->
      this.$('.dropdown-button').dropdown({
        inDuration: 300,
        outDuration: 225,
        constrain_width: false,
        hover: false,
        alignment: 'right',
        gutter: 0,
        belowOrigin: true
      }).bind(this)), 200

class LoggedInNavMobileComponent extends LoggedInNavComponent

  @register 'LoggedInNavMobileComponent'

  template: ->
    'loggedInNavMobile'

class LoggedOutNavComponent extends BlazeComponent

  @register 'LoggedOutNavComponent'

  template: ->
    'loggedOutNav'

  events: -> [

    #'click #logIn': @onClickLogIn
  ]

  onClickLogIn: (event) ->
    alert 'test'


  onRendered: ->
    $('.modal-trigger').leanModal(
      complete: ->


    )

class LoggedOutNavMobileComponent extends LoggedOutNavComponent

  @register 'LoggedOutNavMobileComponent'

  template: ->
    'loggedOutNavMobile'




