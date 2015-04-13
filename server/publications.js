Meteor.publish(
	'houses', function () {
		return Houses.find({userId: this.userId});
	}
);
