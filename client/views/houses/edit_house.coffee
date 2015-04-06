Template.formEditHouse.helpers(
    houseHeading: () ->
        return this.housetype + ' @ ' + this.city
)

ReactiveForms.createFormBlock
    template: 'pricingFormBlock'
    submitType: 'normal'


ReactiveForms.createElement(
    template: 'textInput'
    validationEvent: 'keyup'
)

ReactiveForms.createElement(
    template: 'selectInput'
    validationEvent: 'change'
)

Template['textInput'].helpers
    disabled: ->
        inst = Template.instance()
        if inst.loading && inst.loading.get()
            return "disabled"


Template['selectInput'].helpers
    currencyOptions: ->
        return ['GHC', 'USD', 'EUR']
    advpaymentOptions: ->
        return ['Monthly', '6 Months', '1 Year', '2 Years', '3 Years']

Template['pricingFormBlock'].helpers
    any: ->
        x = false
        for arg in arguments
            if arg is true
                x = true
        return x


# Set up
# ------------------------

pricingFormSchema = new SimpleSchema
    price:
        type: Number
        min: 0
        instructions: "Enter the price per payment plan!"

    currency:
        type: String

    advanced_payment:
        type: String
        label: "Advanced Payment"


# Pass schema, data, action to form block
Template['reactiveEditHouseForm'].helpers
    schema: ->
        return pricingFormSchema

# Initial data to pass into form
    pricingData: ->
        return {price: 0, currency: 'GHS', advanced_payment: '1 Year'}

    action: ->
        return (els, callbacks) ->
            console.log "Action running!", els, callbacks, this

            message = """WORD UP from inside the action function!

        Data context:
        #{JSON.stringify this}

        We used setTimeout() to create a 2-second delay before showing this prompt.

        Note the disabled input...
        Note the loading spinner...

        This package has 7 reactive form states that make it easy to build an awesome form flow.
        Check out the code at the bottom of the page!

        Click OK for success, cancel for failed."""

            Meteor.setTimeout =>
                if confirm(message)
                    callbacks.success()
                else
                    callbacks.failed()
            , 2000

