Accounts.onLogin( ->
  if Session.get('house')
    Meteor.call('listHouse', Session.get('house'), (error, result) ->
      if not error
        Session.set('house', null)
        Router.go('editHouse', {_id: result._id})
      else
        Session.set('listHouseFailed', true)
  )
)
