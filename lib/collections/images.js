
//Images FS.Collection

var createCardImage = function(fileObj, readStream, writeStream) {
    //Transform the image into a 300 x 300 card  image
    var size = '300';
    gm(readStream).autoOrient().resize(size, size + '^').gravity('Center').extent(size, size).stream('PNG').pipe(writeStream);
};

var createSlideImage = function(fileObj, readStream, writeStream) {
    //Transform the image into a 1024 x 683 card  image
    gm(readStream).autoOrient().resize('1024', '683' + '^').gravity('Center').extent('1024', '683').stream('PNG').pipe(writeStream);
};

var cardImages = new FS.Store.GridFS("cardImages", {transformWrite: createCardImage});
var slideImages = new FS.Store.GridFS("slideImages", {transformWrite: createSlideImage});
var profileImages = new FS.Store.GridFS("profileImages");

Images = new FS.Collection("images", {
    stores: [cardImages, slideImages, profileImages],
    filter: {
        maxSize: 1048576, // in bytes
        allow: {
            contentTypes: ['image/*'],
            extensions: ['png', 'jpg', 'gif', 'jpeg']
        },
        onInvalid: function (message) {
            if (Meteor.isClient) {
                Materialize.toast(message,4000);
            } else {
                console.log(message);
            }
        }
    }
});

Images.allow({
    insert: function(userId, file) {
        return userId && file.metadata && file.metadata.owner === userId; },
    update: function(userId, file, fields, modifier) {
        return userId && file.metadata && file.metadata.owner === userId;
    },
    remove: function(userId, file) {
        return userId && file.metadata && file.metadata.owner === userId; },

    download: function(userId, fileObj){
        return userId;
    }
});



