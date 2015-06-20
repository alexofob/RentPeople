Template.editHousePhotoForm.events
  'click #upload-button': ->
    $('#upload-photo').trigger('click')
    return false

  'change #upload-photo': (e,t)->
    e.preventDefault()
    file = e.currentTarget.files[0]
    if not file? then return

    #processImage and upload
    imageResized = processImage file, 300, 300, (data) ->
      img = new FS.File(data)

      img.metadata =
        houseId: t.data._id
        description: ""

      Images.insert img,  (err, fileObj) ->
        if err
          console.log err
          Materialize.toast("Cannot Add Photo", 4000)
        else
          Materialize.toast("Photo Added!", 4000)

  'click #next': ->
    Session.set("editHouseForm", "editHouseAmenitiesForm")

  'click #back': ->
    Session.set("editHouseForm", "editHouseDetailsForm")

Template.editHousePhotoForm.helpers

  imageFound: ->
    return Images.find({}).count()

  numOfPhotos: ->
    imageCount = Images.find({}).count()
    if imageCount is 0
      return "No Photos"
    else if imageCount is 1
      return "1 Photo"
    else
      return imageCount + " Photos"


Template.editHousePhotoForm.onCreated ->
  self = this

  self.autorun ->
    dataContext = Template.currentData()
    subscription = self.subscribe("images", dataContext._id)






