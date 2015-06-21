Template.editHouseDescriptionForm.helpers

# Initial data to pass into form
  houseDescription: ->
    if this.description
      {description: {title, content}} = this
      return {_id: this._id, title: title, content: content}
    else
      data = {_id: this._id, title: '', content: ''}
      return data

Template.editHouseDescriptionForm.events
  'click #next': ->
    Session.set("editHouseForm", "editHouseLocationForm")

  'click #back': ->
    Session.set("editHouseForm", "editHouseDetailsForm")

  'change #textfield': (e,t)->
    houseId = t.data._id
    title = event.target.value

    # If validation is successful update house

    if Match.test({title: title}, window.descriptionSchema)

      Houses.update({_id: houseId}, {$set: {"description.title": title}}, (error) ->
        if error
          Materialize.toast(error.reason, 4000)
        else
          Materialize.toast("Saved!", 4000)
        )

  'change #textarea': (e,t)->
    houseId = t.data._id
    content = event.target.value

    if Match.test({content: content}, window.descriptionSchema)

      Houses.update({_id: houseId}, {$set: {"description.content": content}}, (error) ->
        if error
          Materialize.toast(error.reason, 4000)
        else
          Materialize.toast("Saved!", 4000)
      )


