Template.editHousePhotoForm.events
  'click button': ->
    uploader = new Slingshot.Upload("myFileUploads")
    uploader.send(document.getElementById('upload-photo'), (error, downloadUrl) ->
      if (!(error))
        Meteor.users.update(Meteor.userId(), {$push: {"profile.files": downloadUrl}})
      else console.error('Error uploading', uploader.xhr.response))

Template.editHousePhotoForm.onCreated( ->
  loadFilePicker()
)


