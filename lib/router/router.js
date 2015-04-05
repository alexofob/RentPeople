Router.route('/', {
    name: 'home'
});

Router.route('/about', {
    name: 'about'
});

Router.route('/listHouse', {
    name: 'listHouse'
});

Router.route('/houses/:_id', {
    name: 'editHouse',
    data: function () {
    return Houses.findOne(this.params._id);
}
});

Router.route('/listUserHouses', {
    name: 'listUserHouses'
});

Router.route('/viewHouse', {
    name: 'viewHouse'
});
