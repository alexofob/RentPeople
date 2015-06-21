Template.editHouse.helpers(
  houseHeading: () ->
    return this.houseType + ' @ ' + this.city
)

Template.formEditHouse.onRendered(
  -> Session.setDefault("editHouseForm", "editHouseDetailsForm")
)

Template.formEditHouse.helpers
  editHouseForm: -> Session.get("editHouseForm")

Template.menuEditHouse.events
  'click #pricing': ->
    Session.set("editHouseForm", "editHousePricingForm")
  'click #details': ->
    Session.set("editHouseForm", "editHouseDetailsForm")
  'click #description': ->
    Session.set("editHouseForm", "editHouseDescriptionForm")
  'click #photo': ->
    Session.set("editHouseForm", "editHousePhotoForm")
  'click #location': ->
    Session.set("editHouseForm", "editHouseLocationForm")
  'click #amenities': ->
    Session.set("editHouseForm", "editHouseAmenitiesForm")

