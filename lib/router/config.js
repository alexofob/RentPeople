Router.configure({
    // we use the  mainLayout template to define the layout for the entire app
    layoutTemplate: 'mainLayout',

    // the appNotFound template is used for unknown routes and missing lists
    notFoundTemplate: 'notFound',

    // show the appLoading template whilst the subscriptions below load their data
    loadingTemplate: 'loading'
});


// Cloudinary Client Side Config
if (Meteor.client) {
    $.cloudinary.config({
        cloud_name:"rentpeople"
    });
}

