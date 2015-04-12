ReactiveForms.createFormBlock({
    template: 'listHouseFormBlock',
    submitType: 'normal'
});

ReactiveForms.createElement({
    template: 'textInputHor',
    validationEvent: 'keyup'
});

ReactiveForms.createElement({
    template: 'selectInputHor',
    validationEvent: 'change'
});


Template['listHouseForm'].helpers({
    action: function () {
        return function (els, callbacks) {
            if (!Meteor.user()) {
                Session.set('house', this);
                Router.go('signIn');
                return;
            }
            else {
                Meteor.call('listHouse', this, function(error, result) {
                    // display the error to the user and abort
                    if (error) {
                        callbacks.failed();
                    }
                    else {
                        callbacks.success()
                        Router.go('editHouse', {_id: result._id});
                    }
                });
            }

        };
    },

    listHouseFailed: function() {
        return Session.get('listHouseFailed')
    }
});