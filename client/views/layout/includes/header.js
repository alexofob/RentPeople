Template.navigationBar.rendered = function() {
    Meteor.setTimeout(function() {
        this.$('.button-collapse').sideNav({
            menuWidth: 240,
            activationWidth: 70,
            closeOnClick: true
        });

    }.bind(this), 200);

    $( window ).resize(function() {
        $('.button-collapse').sideNav('hide');
    });
};

Template.loggedInNav.rendered = function() {
    Meteor.setTimeout(function() {
        this.$('.dropdown-button').dropdown({
            inDuration: 300,
            outDuration: 225,
            constrain_width: false,
            hover: false,
            alignment: 'right',
            gutter: 0,
            belowOrigin: true
        });

    }.bind(this), 200);
};
