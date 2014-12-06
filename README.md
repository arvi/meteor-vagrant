#Meteor Vagrant

A simple vagrant box for doing meteor apps

Note to self. :)

##Getting Started
1. Create meteor projects directory to handle all your meteor projects in local machine e.g., mkdir ~/srv/http/**meteor**
2. Clone git repo: **git clone https://github.com/arvi/meteor-vagrant.git ~/srv/http/meteor**
	- you may modify Vagrantfile to your preferred settings e.g change port, virtual machine box etc.
3. **vagrant up**
4. **vagrant reload**
5. **vagrant plugin install vagrant-gatling-rsync** (for synchronization purposes)
6. **vagrant gatling-rsync-auto** (to make sure all changes are being watched)
7. create new terminal tab (cmd + t)
8. Change directory to your meteor projects directory e.g., **cd ~/srv/http/meteor**
9. **vagrant ssh**
10. **cd /vagrant**
11. **meteor --version** (will install meteor on first-time use)

##Creating a new meteor app
1. Make sure you've already done **vagrant ssh** to your meteor projects directory before doing this
2. **cd /meteor**
3. **meteor create test-app** where (replace test-app with your meteor project name)

##Running a meteor app
1. Make sure you've already done **vagrant ssh** to your meteor projects directory before doing this
2. **cd /vagrant | ls -la**
3. **cd test-app/**
4. **meteor**
5. Open your web browser and copy displayed link after running no. 3 e.g **http://localhost:3000**

##Hot code reload in action
1. Go to the directory that holds all your meteor project (either via new terminal tab or finder)
2. Go to your project e.g test-app
3. Open the directory using your preferred text editor 
4. Edit content of test-app like test-app.html to test if sync is working correctly
5. Check your browser where you entered no. 4 in ***Running a meteor app*** section... you should see it reloaded the page automatically

Now you can run meteor via vagrant and edit the files on your usual project directory. Nice! :)

##Syncing local file changes
1. Make sure you're running a meteor app. *See* ***Running a meteor app*** *section*
2. Open a new terminal tab
3. **vagrant ssh** to your meteor projects directory
4. **vagrant gatling-rsync-auto**

##Accessing MongoDB
1. Make sure you're running a meteor app. *See* ***Running a meteor app*** *section*
2. Open a new terminal tab
3. Change directory to folder that holds all your meteor project
4. Change directory to your meteor project e.g test-app
5. **vagrant ssh**
6. **cd /vagrant/test-app**
7. **meteor mongo**
Note: If you're not running a meteor app (step 1), your screen will display something like this:
*mongo: Meteor isn't running a local MongoDB server....*

##Terminal tabs
When doing meteor apps via vagrant, all in all you'll have 3-4 terminal tabs:

1. Where you run **meteor** command to run your app. *See* ***Running a meteor app*** *section*
2. Where you run **vagrant gatling-rsync-auto** command so you can edit locally. *See* ***Syncing local file changes*** *section*
3. Where you run **meteor mongo** command to access mongodb. *See* ***Accessing MongoDB*** *section*
4. Your local project directory (optional, if you prefer to do it via finder)

##Removing meteor app
Note: This will remove the app in /meteor, /vagrant, and your local meteor project directory

1. Make sure you've already done **vagrant ssh** to your meteor projects directory before doing this
2. Make sure **vagrant gatling-rsync-auto** has been run in another tab
3. **cd /meteor**
4. **rm -rf test-app**

##Thanks to the ff:
1. https://github.com/mfasanya/vagrant-meteor (brilliant Vagrantfile configuration)
2. https://github.com/thematrimix/jekyll-vagrant (really neat shell provision)
