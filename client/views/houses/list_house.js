Template.listHouse.events({
    'submit form': function(e) {
        e.preventDefault();

        var house = {
            city: $(e.target).find('[id=city]').val(),
            housetype: $(e.target).find('[id=housetype]').val(),
            bedrooms: $(e.target).find('[id=bedrooms]').val()
        };

        if (!Meteor.user()) {
            Session.set('house', house);
            Router.go('signIn');
            return;
        }
        else {
            Meteor.call('listHouse', house, function(error, result) {
                // display the error to the user and abort
                if (error)
                    return alert(error.reason);

                Router.go('editHouse', {_id: result._id});
            });
        }

    }
});