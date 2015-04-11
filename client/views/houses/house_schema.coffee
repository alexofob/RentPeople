# House Schema

pricingSchemaObject =
  currency:
    type: String
    label: 'Currency'
    allowedValues: [
      'GHS'
      'USD'
      'EUR'
    ]

  price:
    type: Number
    label: 'Price per Month'
    min: 0
    instructions: 'Please enter the price per month'

  advancedPayment:
    type: String
    label: 'Payment Plan'
    allowedValues: [
      'Monthly'
      '1 Year advanced payment'
      '2 Year advanced Payment'
      '3 Year advanced Payment'
      '4 Year advanced Payment'
      '5 Year advanced Payment'
    ]


houseSchemaObject =
  city:
    type: String
    label: 'City'
    min: 2
    max: 30
    instructions: 'Please enter the city where house is located'

  houseType:
    type: String
    label: 'House type'
    allowedValues: [
      'Whole House'
      'Apartment or Flat'
      'Compound House'
    ]

  bedrooms:
    type: String
    label: 'Bedrooms'
    allowedValues: [
      '1'
      '2'
      '3'
      '4'
      '5 or more'
    ]

  pricing:
    type: pricingSchemaObject

pricingSchema = new SimpleSchema(pricingSchemaObject)

houseSchema = new SimpleSchema(houseSchemaObject)


Template.listHouseForm.helpers
  houseSchema: ->
    return houseSchema

  houseTypes: ->
    return houseSchema._schema.houseType.allowedValues

  bedrooms: ->
    return houseSchema._schema.bedrooms.allowedValues


Template.reactiveEditHouseForm.helpers
  pricingSchema: ->
    return pricingSchema


