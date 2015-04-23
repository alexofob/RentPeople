Template.formEditHouse.helpers(
    houseHeading: () ->
        return this.houseType + ' @ ' + this.city
)

ReactiveForms.createElement(
    template: 'priceInput'
    validationEvent: 'keyup'
)

ReactiveForms.createElement(
    template: 'selectInput'
    validationEvent: 'change'
)

ReactiveForms.createElement(
  template: 'textInput'
  validationEvent: 'keyup'
)

Template['priceInput'].helpers
    disabled: ->
        inst = Template.instance()
        if inst.loading && inst.loading.get()
            return "disabled"

Template.selectInput.helpers
# Selects the stored item from the selection element
  isSelected: (option, value) ->
    if option is value
      return "selected"
    else
      return ""


Template.formEditHouse.onRendered(
  -> Session.setDefault("editHouseForm", "editHousePricingForm")
)

Template.formEditHouse.helpers
  editHouseForm: -> Session.get("editHouseForm")

Template.navElements.events
  'click #pricing': ->
    Session.set("editHouseForm", "editHousePricingForm")
  'click #details': ->
    Session.set("editHouseForm", "editHouseDetailsForm")
  'click #photo': ->
    Session.set("editHouseForm", "editHousePhotoForm")
  'click #location': ->
    Session.set("editHouseForm", "editHouseLocationForm")
  'click #amenities': ->
    Session.set("editHouseForm", "editHouseAmenitiesForm")

