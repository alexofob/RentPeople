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

//Images FS.Collection

var cardImages = new FS.Store.GridFS("cardImages", {transformWrite: creatCardImage});
var slideImages = new FS.Store.GridFS("slideImages", {transformWrite: creatSlideImage});
var profileImages = new FS.Store.GridFS("profileImages");

Images = new FS.Collection("images", {
    stores: [cardImages, slideImages, profileImages]
});

Images.deny({
    insert: function(){
        return false;
    },
    update: function(){
        return false;
    },
    remove: function(){
        return false;
    },
    download: function(){
        return false;
    }
});

Images.allow({
    insert: function(){
        return true;
    },
    update: function(){
        return true;
    },
    remove: function(){
        return true;
    },
    download: function(){
        return true;
    }
});




// Easy Search configuration
Houses.initEasySearch(['city', 'bedrooms'], {
    'limit' : 20,
    'use' : 'mongo-db'
});
