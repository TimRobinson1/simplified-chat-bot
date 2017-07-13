Simplified Chat Bot
==============

This simplified chat interface was built in Ruby, using Ruby on Rails, as part of a tech test.
The user is presented with options to choose from and picks one to send. Once sent,
the bot begins to create a response, and once that's through the user can respond once more.
Soon, the chatroom will determine whether you have socialised successfully, or if you've
failed to impress.

Once signed up, you can change around how the bot responds to you and what sentences
you can provide it, customising the conversation and outcomes to your choosing.

Quickstart guide
---------------
* Clone the repo to your local device, using ```git clone https://github.com/TimRobinson1/Simplified-Chat-Bot.git```
* Navigate into the repo using ```cd simplified-chat-bot```
* Install the gem dependencies by running ```bundle install```
* Run ```rspec``` in the command line to ensure everything is working correctly.
* Visit ```http://localhost:3000/``` in your browser of choice - and enjoy!

Example usage
-------------
![Chat Example](example.png?raw=true "An Example conversation")

Technologies used
------------
* Ruby - 2.4.1
* Ruby on Rails - 5.1.2
* Clearance gem - for authentication and routing
* Capybara
* RSpec
* SQLite3

Simplified specifications
------------
* To have a bot respond to set responses, after a pause.
* A higher user ability to interact with the chat flow and adjust it.
* Conversations result in pass/fail status

Development Process & Reflection
-------------
I first approached the issue by drawing out in a notepad a rough diagram of what I thought I might
need to cover in the code and to help me form a better mental image of the process I needed to carry out.
My first diagram and planning session left me with the idea of having the classes ChatbotStatement and UserAnswers, along with the User class for authentication.

My choice for user authentication was the Clearance gem as I have worked with it twice previously and
it has always performed effectively.  Setting up user logins/logouts was my first step because to me the rest relied in part upon that.  For the duration of development, however, any visitor had access to the admin abilities.

My primary struggle was associating responses with answers and allowing an admin user to edit the conversational flow in a way that wasn't obscure or confusing.  This was a great learning step for me as I've gained a lot of insight into the way Rails interacts with CRUD operations and how to present an interface of those operations back to the user.

For the future, I hope to continue to work on this project, and present a much cleaner, friendlier experience and interface for the user.  As it is currently, a user with an account has access to modifying the chatbot flow - the program defines admin as an account-holding user, rather than just a guest or visitor. I'd like to expand upon this and create a subclass of users with less privileges.
