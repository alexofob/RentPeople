/**
 * Created by alexofori on 2/13/15.
 */
Houses = new Mongo.Collection("houses");

Houses.allow({
    update: function(userId, doc) {
        return ownsDocument(userId, doc);
    },
    remove: function(userId, house) {
        return ownsDocument(userId, house);
    }
})

NonEmptyString = Match.Where(function (x) {
    check(x, String);
    return x.length > 0;
});


Meteor.methods({
    listHouse: function(postAttributes) {
        check(Meteor.userId(), String);
        check(postAttributes, {
            city: String,
            houseType: String,
            bedrooms: String
        });
        check(postAttributes.city, NonEmptyString);

        var user = Meteor.user();
        var house = _.extend(postAttributes, {
            userId: user._id,
            author: user.profile['firstName'] + " " + user.profile['lastName'],
            submitted: new Date()
        });

        var houseId = Houses.insert(house);

        return {
            _id: houseId
        };
    }
});

Houses.initEasySearch('city');
