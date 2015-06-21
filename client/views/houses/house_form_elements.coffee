
ReactiveForms.createElement(
    template: 'priceInput'
    validationEvent: 'keyup'
)

ReactiveForms.createElement(
    template: 'textArea'
    validationEvent: 'keyup'
)

ReactiveForms.createElement(
    template: 'selectInput'
    validationEvent: 'change'
)

ReactiveForms.createElement(
    template: 'switchInput'
    validationEvent: 'change'
)

ReactiveForms.createElement(
    template: 'textInput'
    validationEvent: 'keyup'
)

Template['textInputHor'].helpers
    disabled: ->
        inst = Template.instance()
        if inst.loading && inst.loading.get()
            return "disabled"
    isActive: (value) ->
        if value
            return "active"
        else
            return ""

Template.selectInput.helpers
# Selects the stored item from the selection element
    isSelected: (option, value) ->
        if option is value
            return "selected"
        else
            return ""

Template.switchInput.helpers
# Selects the stored item from the switch element
    isChecked: (value) ->
        if value
            return "Checked"
        else
            return ""

Template.textArea.helpers
    isActive: ->
        if this.data.content then "active"
    length: ->
        this.length
