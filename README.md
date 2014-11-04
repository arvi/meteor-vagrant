#Meteor Vagrant

A simple vagrant box for doing meteor apps

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
1. **cd /meteor**
2. **meteor create test-app** where (replace test-app with your meteor project name)

##Running a meteor app
1. **cd /vagrant | ls -la**
2. **cd test-app/**
3. **meteor**
4. Open your web browser and copy displayed link after running no. 3 e.g **http://localhost:3000**

##Hot code reload in action
1. Go to the directory that holds all your meteor project (either via new terminal tab or finder)
2. Go to your project e.g test-app
3. Open the directory using your preferred text editor 
4. Edit content of test-app like test-app.html to test if sync is working correctly
5. Check your browser where you entered no. 4 in **Running a meteor app** section... you should see it reloaded the page automatically

Now you can run meteor via vagrant and edit the files on your usual project directory. Nice! :)

##Thanks to the ff:
1. https://github.com/mfasanya/vagrant-meteor (brilliant Vagrantfile configuration)
2. https://github.com/thematrimix/jekyll-vagrant (really neat shell provision)

##TO DO:
Fix Meteor isn't running a local MongoDB server.
