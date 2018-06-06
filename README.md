# RoR learning experiment

This is a simple Ruby on Rails app for learning purpose.

####Features

- User
	- Listing
	- Creation
	- Edition
	- Deletion
	
	
- Photo
	- Listing on the user's profile
	- Creation (link reference)
	- Edition
	- Deletion

####Setup
Download of clone the repo
```shell
git clone https://github.com/NicolasMica/RoR-learning.git demo
```
 
Install the dependencies
```shell
cd demo
bundle install
```

Migrate & seed the database
```shell
rake db:migrate && rake db:seed
```

Start the server and navigate to [http://localhost:3000](http://localhost:3000)
```shell
rails server
```
