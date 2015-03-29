Template.listHouse.events({
    'submit form': function(e) {
        e.preventDefault();

        if (!Meteor.user()) {
            $('#loginModal').modal('show');
            Session.set('scenario', 'listHouse')
            return;
        }

        var house = {
            city: $(e.target).find('[id=city]').val(),
            housetype: $(e.target).find('[id=housetype]').val(),
            bedrooms: $(e.target).find('[id=bedrooms]').val()
        };


        Meteor.call('listHouse', house, function(error, result) {
            // display the error to the user and abort
            if (error)
                return alert(error.reason);

            Router.go('editHouse', {_id: result._id});
        });

    }
});