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


locationSchemaObject =
  houseNumber:
    type: String
    label: "House Number"
    max: 100
    optional: true

  surburb:
    type: String
    label: "Enter a location"
    max: 50
    optional: true

  address:
    type: String
    label: "Address"
    max: 300
    optional: true


GeoLocationSchemaObject =
  url:
    type: String
    optional: true

  latLng:
    type: Object
    optional: true

  route:
    type: String
    optional: true

  neighborhood:
    type: String
    optional: true

  sublocality:
    type: String
    optional: true

  locality:
    type: String
    optional: true

  region:
    type: String
    optional: true

  country:
    type: String
    optional: true

amenitiesSchemaObject =
  airCondition:
    type: Boolean
    label: "Air Condition"
    allowedValues: [
      true
      false
    ]

  waterHeater:
    type: Boolean
    label: "Water Heater"
    allowedValues: [
      true
      false
    ]

  cableTV:
    type: Boolean
    label: "Cable TV"
    allowedValues: [
      true
      false
    ]

  kitchen:
    type: Boolean
    label: "Kitchen"
    allowedValues: [
      true
      false
    ]

  swimmingPool:
    type: Boolean
    label: "Swimming Pool"
    allowedValues: [
      true
      false
    ]

  parkingSpace:
    type: Boolean
    label: "Parking Space"
    allowedValues: [
      true
      false
    ]

  gym:
    type: Boolean
    label: "Gym"
    allowedValues: [
      true
      false
    ]

  elevator:
    type: Boolean
    label: "Elevator in Building"
    allowedValues: [
      true
      false
    ]


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

  location:
    type: locationSchemaObject

  geoLocation:
    type: GeoLocationSchemaObject

  amenities:
    type: amenitiesSchemaObject



pricingSchema = new SimpleSchema(pricingSchemaObject)

@descriptionSchema = new SimpleSchema(descriptionSchemaObject)

@locationSchema = new SimpleSchema(locationSchemaObject)

@GeoLocationSchema = new SimpleSchema(GeoLocationSchemaObject)

@amenitiesSchema = new SimpleSchema(AmenitiesSchemaObject)

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

Template.editHouseAmenitiesForm.helpers
  amenitiesSchema: ->
    return amenitiesSchema
