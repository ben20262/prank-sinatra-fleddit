# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
    - Created User, Page, and Post classes

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - User has many Pages and vice versa via UserPages, User and Page both have many Posts. 

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - Posts belong to a User and A Page

- [x] Include user accounts with unique login attribute (username or email)
    - Usernames must be unique as well as Page names.

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - Pages and Posts both have routes for CRUD.

- [x] Ensure that users can't modify content created by other users
    - I made it so that mods within pages can delete other people posts within the pages that they are mods as a way to ensure that the content is within the guidelines of the community. However I didn't let them edit posts as that could possibly lead to some serious scenarios if a mod were overactive. Mods may also delete the page that they are moderators of. An admin user is essentially a super mod who has the same powers but for all pages.

- [x] Include user input validations
    - System checks to ensure that Users do not enter empty data to ensure only good data can be saved.

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
