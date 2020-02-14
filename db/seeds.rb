User.create(username: "TheBen", password: "123", email: "ben@benmail.com", admin: 1)
User.create(username: "Dyl", password: "abc", email: "dyl@benmail.com")
User.create(username: "Frank", password: "this", email: "frank@gmail.com")

Page.create(name: "Funny", about: "The funniest place on fleddit.")
Page.create(name: "Aww", about: "Cute pics.")
Page.create(name: "Memes", about: "Stay up to date with the latest memes!")

UserPage.create(user_id: 1, page_id: 1)
UserPage.create(user_id: 1, page_id: 2)
UserPage.create(user_id: 1, page_id: 3)
UserPage.create(user_id: 2, page_id: 2, mod: 1)
UserPage.create(user_id: 2, page_id: 3)
UserPage.create(user_id: 3, page_id: 1)
UserPage.create(user_id: 3, page_id: 2)

Post.create(title: "This", content: "Whoa this is awesome!", page_id: 3, user_id: 2)
Post.create(title: "That", content: "So cute!", page_id: 2, user_id: 1)
Post.create(title: "Roflcopter", content: "lolololololol", page_id: 1, user_id: 3)
