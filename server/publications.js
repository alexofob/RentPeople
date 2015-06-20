Meteor.publish(
	'houses', function () {
		return Houses.find({userId: this.userId});
	}
);

Meteor.publish(
	'images', function(houseId) {
		check(houseId, String);
        if(this.userId) {
            return Images.find({"metadata.houseId": houseId});
        }

	}
);

