/**
 * Created by alexofori on 2/13/15.
 */

// Houses Mongo.Collection
Houses = new Mongo.Collection("houses");

Houses.allow({
    update: function(userId, doc) {
        return ownsDocument(userId, doc);
    },
    remove: function(userId, house) {
        return ownsDocument(userId, house);
    }
})





