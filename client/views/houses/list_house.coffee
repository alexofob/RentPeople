Template.listHouseForm.helpers
  houseSchema: ->
    return houseSchema

  houseTypes: ->
    return houseSchema._schema.houseType.allowedValues

  bedrooms: ->
    return houseSchema._schema.bedrooms.allowedValues