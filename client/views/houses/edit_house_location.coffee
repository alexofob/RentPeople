Template.editHouseLocationForm.onCreated ->
  Session.setDefault("hasAddress", false)

Template.editHouseLocationForm.onRendered ->

  city = @data.city
  houseId = @data._id
  if @data.geoLocation and @data.geoLocation.latLng
    location = [@data.geoLocation.latLng.A, @data.geoLocation.latLng.F]
  else
    location = city

  fillDetails = (result) ->
    data = {}
    location = result.geometry.location
    # Create a simplified version of the address components.
    $.each result.address_components, (index, object) ->
      name = object.types[0]
      $.each object.types, (index, name) ->
        data[name] = object.long_name
        return
      return

    # Add infos about the address and geometry.
    $.extend data,
      formatted_address: result.formatted_address
      url: result.url
      latLng: location
      name: result.name
    @data = data
    data


  @autorun ->
# Wait for API to be loaded
    if GoogleMaps.loaded()

      $('#surburb').geocomplete
        map: '.map-container'
        markerOptions: draggable: true
        details: '#auto-complete'
        location: location

      $('#surburb').bind 'geocode:dragged', (event, latLng) ->
        Houses.update({_id: houseId}, {$set: {"geoLocation.latLng": latLng}}, (error) ->
          if error
            Materialize.toast(error.reason, 4000)
          else
            Materialize.toast("Saved!", 4000)
        )
        return

      $('#surburb').bind 'geocode:result', (event, result) ->
        geoLocation = fillDetails result

        console.log JSON.stringify(geoLocation), 4000

        Houses.update({_id: houseId}, {$set: {"geoLocation": geoLocation}, "location.surburb": 'accra'}, (error) ->
          if error
            Materialize.toast(error.reason, 4000)
          else
            Materialize.toast("Saved!", 4000)
        )
      return
    return
  return

Template.editHouseLocationForm.helpers
  locationSchema: ->
    return locationSchema

# Initial data to pass into form
  houseLocation: ->
    if this.location
      {location: {houseNumber, surburb, address}} = this
      return {_id: this._id, houseNumber: houseNumber, surburb: surburb, address: address}
    else
      data = {_id: this._id, houseNumber: '', surburb: '', address: ''}


Template.editHouseLocationForm.events
  'click #next': ->
    Session.set("editHouseForm", "editHouseAmenitiesForm")

  'click #back': ->
    Session.set("editHouseForm", "editHouseDescriptionForm")

  'change #houseNumber': (e,t)->
    houseId = t.data._id
    houseNumber = event.target.value

    # If validation is successful update house

    if Match.test({houseNumber: houseNumber}, window.locationSchema)

      Houses.update({_id: houseId}, {$set: {"location.houseNumber": houseNumber}}, (error) ->
        if error
          Materialize.toast(error.reason, 4000)
        else
          Materialize.toast("Saved!", 4000)
      )


  'change #address': (e,t)->
    houseId = t.data._id
    address = event.target.value

    if Match.test({address: address}, window.locationSchema)

      Houses.update({_id: houseId}, {$set: {"location.address": address}}, (error) ->
        if error
          Materialize.toast(error.reason, 4000)
        else
          Materialize.toast("Saved!", 4000)
          Session.set("hasAddress", true);

      )

