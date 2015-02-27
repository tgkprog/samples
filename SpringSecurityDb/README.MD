Spring is great. One example where it helped solve a business problem with little customization is :
* by default spring security has users and roles
* we add roles to URLs and methods, to 'guard' them, only users with that role can enter
* we keep our users in db and our roles too
* map roles to users

Disadvantage here is that if you have many users or/and roles it can be tedious to edit .
And need to do code changes to change who can see what
Also if you just use 4-5 roles then you have less flexibility .
If your customer wants a level of in direction - so without changing code can have different users have different groups.
Also in one installation might want 4-5 groups, and in another 10.

In this case its nice to have a table of privileges, so each method/ url can be guarded by one.
Then outside if code we can create n number of groups (roles) and users.

*Solution*
One way to solve this is :
Have a mapping table of users-to-roles and another of roles-privileges, and ask sql to:
"give me all privileges of all roles of user X", this can be plugged into just the right place in spring and voila you have extended
spring security with just a XML change
Code:

````xml

   select username, r.privileges from user_roles u, roles_privileges r where username = ? and u.role = r.role

````
 
 You could also write this in a Java class that is the handler for authentication, but again its just a few lines of code.
 
 In data base this would go to Privilidges table.
Users would be in users table.
Business can make its own Roles in Roles table

Then map Privilidges to roles. Link happens in spring security XML to make join and get right roles for a user that are in source.

*Example* 
URL/ function in code can be accessible by a role called admin_user_add, this would be hard coded in source files (xml/java)

*Better to have*
Cache and utility jsp to evict security and user ids and roles.

