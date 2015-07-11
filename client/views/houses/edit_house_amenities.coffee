Template.editHouseAmenitiesForm.helpers
  amenitiesSchema: ->
    return window.amenitiesSchema



Template.editHouseDetailsForm.events
  'click #next': ->
    Session.set("editHouseForm", "editHouseDescriptionForm")


  'click #availability': (e,t)->
    dataContext = t.data
    if dataContext.availability
      Houses.update({_id: dataContext._id},
        {$set: {availability: false}}, (error) ->
        if error
          Materialize.toast(error.reason, 4000)
        else
          Materialize.toast("Saved!", 4000)
      )
    else
      Houses.update({_id: dataContext._id},
        {$set: {availability: true}}, (error) ->
        if error
          Materialize.toast(error.reason, 4000)
        else
          Materialize.toast("Saved!", 4000))