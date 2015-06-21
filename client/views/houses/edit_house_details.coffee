ReactiveForms.createFormBlock
  template: 'detailsFormBlock'
  submitType: 'normal'

Template.editHouseDetailsForm.helpers
  action: ->
    return (els, callbacks) ->
      Houses.update({_id: this._id},
        {$set: {city: this.city, houseType: this.houseType, bedrooms: this.bedrooms, bathrooms: this.bathrooms}}, (error) ->
          if error
            callbacks.failed()
            Materialize.toast(error.reason, 4000)
          else
            callbacks.success()
            Materialize.toast("Saved!", 4000)
      )

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


