/**
 * Created by alexofori on 2/13/15.
 */
Houses = new Mongo.Collection("houses");

NonEmptyString = Match.Where(function (x) {
    check(x, String);
    return x.length > 0;
});


Meteor.methods({
    listHouse: function(postAttributes) {
        check(Meteor.userId(), String);
        check(postAttributes, {
            city: String,
            housetype: String,
            bedrooms: String
        });
        check(postAttributes.city, NonEmptyString);

        var user = Meteor.user();
        var house = _.extend(postAttributes, {
            userId: user._id,
            author: user.profile['fname'] + " " + user.profile['lname'],
            submitted: new Date()
        });

        var houseId = Houses.insert(house);

        return {
            _id: houseId
        };
    }
});
