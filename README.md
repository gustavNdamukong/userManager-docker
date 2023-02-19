# A Dockerized version of the userManager app

## Features 
    * User registration
    * Two types of users, 'admin' and 'member' users
    * Newly registered users are autmoatically given the 'member' user type
    * New user email verification via email activation link
  	* User login/logout
    * Only users with verified/activated emails can login
    * Admin user can create, edit or delete other users
    * Admin users can change the type of another user, & thus control their privileges
    * Registration can be allowed/turned off from config file
  	* DB interaction via mysqli extension
  	* Use of the a DB model class with powerful handy methods for 
      querying the DB in various ways to get data; all protected 
      against SQL injection by the use of prepared statements. 
    * Docker environment with configured docker-compose.yml file
    
    * It comes with two users to pre-insert into the DB. One is an admin user, & the other 
      is a regular member to get you started. The password for both users is 1234567 

### Use Case
    It could make a great starting point for any PHP & MySQL 
    interactive application, especially membership sites with user accounts
