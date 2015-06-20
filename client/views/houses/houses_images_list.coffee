Template.imagesList.helpers
  images: ->
    return Images.find({})



Template.imageShow.events
  'blur #photo-description': (e, t) ->
    e.preventDefault()

    photoDescription = $(e.currentTarget).val()

    Images.update({_id: t.data._id}, {$set: {"metadata.description": photoDescription}}, (err, count) ->
      if err
        Materialize.toast("Not Saved!", 4000)
      else
        Materialize.toast("Saved!", 4000)
    )

  'click #delete-photo': (e, t) ->
    e.preventDefault()

    Images.remove(t.data._id, (error) ->
      if error
        Materialize.toast("Delete unsuccessful", 4000)
      else
        Materialize.toast("Deleted", 4000)
    )


Template.imageShow.helpers
  isActive: ->
    description = Images.findOne(this._id).metadata.description
    if description then "active"

