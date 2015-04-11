Template.formEditHouse.helpers(
    houseHeading: () ->
        return this.houseType + ' @ ' + this.city
)

ReactiveForms.createFormBlock
    template: 'pricingFormBlock'
    submitType: 'normal'


ReactiveForms.createElement(
    template: 'priceInput'
    validationEvent: 'keyup'
)

ReactiveForms.createElement(
    template: 'selectInput'
    validationEvent: 'change'
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

Template.reactiveEditHouseForm.helpers
  action: ->
    return (els, callbacks) ->
      pricing = _.omit(this, "_id")
      Houses.update({_id: this._id}, {$set: {pricing: pricing}}, (error) ->
        if error
          callbacks.failed()
        else
          callbacks.success()
      )

# Initial data to pass into form
  housePricing: ->
    {pricing: {advancedPayment, currency, price}} = this
    return {_id: this._id, advancedPayment: advancedPayment, currency: currency, price: price}




