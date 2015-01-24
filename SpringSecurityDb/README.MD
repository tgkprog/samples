Spring security with one more level of indirection

So Spring roles map to code ROLES, but users map to groups of ROLES

Meaning business can decide final roles by data base changes (and restart/ reload ) in app.

Example : URL/ function in code can be accessible by a role called admin_user_add, this would be hard coded in source files (xml/java)

In data base this would go to Privilidges table.
Users would be in users table.
Business can make its own Roles in Roles table

Then map Privilidges to roles. Link happens in XML to make join and get right roles for a user that are in source.

Dont commit other IDE files but .classpath sometimes is useful. If it causes issues can delete and auto generate by re importing project in local.

TODO:
Cache and utility jsp to evict security and user ids and roles.

Need to : Change from xml to bean impl so that other changes can be made?