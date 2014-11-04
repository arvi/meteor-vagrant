if meteor --version >/dev/null 2>&1; then
	echo "Meteor was already installed."
	meteor --version
else
	echo ">>>>>Installing Meteor<<<<<"
	curl https://install.meteor.com | sh

	echo "Meteor installed."
	meteor --version
fi