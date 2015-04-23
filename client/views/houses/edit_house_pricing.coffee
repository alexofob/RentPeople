ReactiveForms.createFormBlock
  template: 'pricingFormBlock'
  submitType: 'normal'


Template.editHousePricingForm.helpers
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
    if this.pricing
      {pricing: {advancedPayment, currency, price}} = this
      return {_id: this._id, advancedPayment: advancedPayment, currency: currency, price: price}
    else
      datatest = {_id: this._id, advancedPayment: '', currency: '', price: null}
      return datatest
