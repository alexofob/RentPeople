

AccountsTemplates.addField({
    _id: 'firstName',
    type: 'text',
    placeholder: {
        signUp: "First Name"
    },
    required: true,
    minLength: 2
});

AccountsTemplates.addField({
    _id: 'lastName',
    type: 'text',
    placeholder: {
        signUp: "Surname"
    },
    minLength: 2
});

AccountsTemplates.removeField('email');
AccountsTemplates.addField({
    _id: 'email',
    type: 'email',
    required: true,
    re: /.+@(.+){2,}\.(.+){2,}/,
    errStr: 'error.accounts.Invalid email',
    trim: true,
    lowercase: true
});

AccountsTemplates.removeField('password');
AccountsTemplates.addField({
    _id: 'password',
    type: 'password',
    required: true,
    minLength: 6,
    errStr: 'error.minChar'
});

var submitForm = function(error, state){
    if (!error && Session.get('house')) {
        Meteor.call('listHouse', Session.get('house'), function(error, result) {
            // display the error to the user and abort
            if (error)
                return alert(error.reason);

            Session.set('house', null);
            Router.go('editHouse', {_id: result._id});
        });
    }
};

AccountsTemplates.configure({
    // Behaviour
    confirmPassword: true,
    enablePasswordChange: true,
    forbidClientAccountCreation: false,
    overrideLoginErrors: true,
    sendVerificationEmail: false,
    lowercaseUsername: false,

    // Appearance
    showAddRemoveServices: false,
    showForgotPasswordLink: false,
    showLabels: false,
    showPlaceholders: true,

    // Client-side Validation
    continuousValidation: false,
    negativeFeedback: false,
    negativeValidation: true,
    positiveValidation: true,
    positiveFeedback: true,
    showValidating: true,

    // Privacy Policy and Terms of Use
    privacyUrl: 'privacy',
    termsUrl: 'terms-of-use',

    // Redirects
    homeRoutePath: '/',
    redirectTimeout: 4000,

    // Hooks
    //onLogoutHook: onLogout,
    onSubmitHook: submitForm,

    // Texts
    texts: {
        button: {
            signUp: "Register Now!"
        },
        socialSignUp: "Register",
        socialIcons: {
            "meteor-developer": "fa fa-rocket"
        },
        title: {
            forgotPwd: "Recover Your Password"
        }
    }
});

AccountsTemplates.configureRoute('signIn', {
    name: 'signIn',
    path: '/signin',
    template: 'signIn'
});

AccountsTemplates.configureRoute('signUp', {
    name: 'signUp',
    path: '/signup',
    template: 'signIn'
});

Router.plugin('ensureSignedIn', {
    except: ['home', 'atForgotPassword', 'signIn', 'signUp', 'about', 'listHouse']
});

