Router.route('/', {
    name: 'home'
});

Router.route('/about', {
    name: 'about'
});

Router.route('/listHouse', {
    name: 'listHouse',
    layoutTemplate: 'appLayout'
});

Router.route('/houses/:_id', {
    name: 'editHouse',
    data: function () {
    return Houses.findOne(this.params._id);
},
    waitOn: function () {
        // return one handle, a function, or an array
        return Meteor.subscribe('houses');
    },
    layoutTemplate: 'appLayout'
});

Router.route('/listUserHouses', {
    name: 'listUserHouses'
});

Router.route('/viewHouse', {
    name: 'viewHouse'
});

Router.plugin('dataNotFound', {notFoundTemplate: 'notFound'});