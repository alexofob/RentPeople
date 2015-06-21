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
    optional: true

  price:
    type: Number
    label: 'Price per Month'
    min: 0
    instructions: 'Please enter the price per month'
    optional: true

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
    optional: true

descriptionSchemaObject =
  title:
    type: String
    label: "Listing Name"
    max: 35
    instructions: "Give clear and descriptive name"
    optional: true

  content:
    type: String
    label: "Summary Description"
    max: 250
    instructions: "Tell tenants what is unique about your house."
    optional: true

houseSchemaObject =
  city:
    type: String
    label: 'City where house is located'
    min: 2
    max: 30
    instructions: 'Please enter the city where your house is located'

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
    label: 'Number of Bedrooms'
    allowedValues: [
      '1 Bedroom'
      '2 Bedrooms'
      '3 Bedrooms'
      '4 Bedrooms'
      '5 Bedrooms or more'
    ]

  bathrooms:
    type: String
    label: 'Bathrooms'
    allowedValues: [
      '1 bathroom'
      '2 bathrooms'
      '3 bathrooms'
      '4 bathrooms'
      '5 bathrooms or more'
    ]
    optional: true

  availability:
    type: Boolean
    label: "Availability"
    allowedValues: [
      true
      false
    ]

  pricing:
    type: pricingSchemaObject

  description:
    type: descriptionSchemaObject


pricingSchema = new SimpleSchema(pricingSchemaObject)

@descriptionSchema = new SimpleSchema(descriptionSchemaObject)

houseSchema = new SimpleSchema(houseSchemaObject)

Template.listHouseForm.helpers
  houseSchema: ->
    return houseSchema

  houseTypes: ->
    return houseSchema._schema.houseType.allowedValues

  bedrooms: ->
    return houseSchema._schema.bedrooms.allowedValues


Template.editHousePricingForm.helpers
  pricingSchema: ->
    return pricingSchema

  currency: ->
    return pricingSchema._schema.currency.allowedValues

  advancedPayment: ->
    return pricingSchema._schema.advancedPayment.allowedValues

Template.editHouseDetailsForm.helpers
  houseSchema: ->
    return houseSchema

  houseType: ->
    return houseSchema._schema.houseType.allowedValues

  bedrooms: ->
    return houseSchema._schema.bedrooms.allowedValues

  bathrooms: ->
    return houseSchema._schema.bathrooms.allowedValues

  availability: ->
    return houseSchema._schema.availability.allowedValues


Template.editHouseDescriptionForm.helpers
  descriptionSchema: ->
    return descriptionSchema
