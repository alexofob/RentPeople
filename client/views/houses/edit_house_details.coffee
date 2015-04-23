ReactiveForms.createFormBlock
  template: 'detailsFormBlock'
  submitType: 'normal'

Template.editHouseDetailsForm.helpers
  action: ->
    return (els, callbacks) ->
      Houses.update({_id: this._id}, {$set: {city: this.city, houseType: this.houseType, bedrooms: this.bedrooms, bathrooms: this.bathrooms}}, (error) ->
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
