# Rails Toy App

[Heroku App](https://gentle-eyrie-92883.herokuapp.com/)
___
### Changing the homepage from 'Hello' to '/users'
Inside `config > routes.rb`:
```ruby
Rails.application.routes.draw do
  resources :users

  root 'application#hello'
end
```
The line `resources :users` is created when we scaffolded the User table.

From here we can change the `root 'application#hello'` to:
```ruby
Rails.application.routes.draw do
  resources :users

  root 'users#index'
end
```
The prefix determines the controller we are reading from. The suffix is the function that returns some data needed to render the page.
What this code then does is calls on `app > models > user.rb` to grab all the users defined from the controller `@users = User.all`. It then gets used in `app > views > users > index.html.erb` to iterate through all the Users and display them on the page.
#### How does the /edit route know which user to edit?
At the top of the user controller, there is a `before_action :set_user, only: %i[ show edit update destroy ]` line that runs only before the specified action, edit included. This way a user is set before the edit action and then the action goes through and lead into `app > views > users > edit.html.erb` which renders the page.
#### Weakness of scaffold
- No data validations.
- No authentication (logging in/out).
- No styling
___
### Microposts
When first scaffolding the Microposts, the `text` collumn will allow for more than 140 characters. To circumvent this, we can limit it with the `length validator`.
**Length Validator**
Inside `app > models > micropost.rb` we can add the validation to limit the amount of characters the post can be.
```ruby
class Micropost < ApplicationRecord
    validates :content, lengthL { maximum: 140 }
end
```
___
### Associations
To create associations between tables, go into their respective model files. Input the code `belongs_to :table` or `has_many :tables` to create the association.
#### How to navigate through the table associations
# INPUT IMAGE HERE (ASSOCIATION IMAGE)
- `first_user = User.first` grabs the first user and assigns it to the variable first_user.
- `first_user.microposts` returns all the microposts with the **user_id** equal to the id of **first_user**.
- `micropost.user` returns the user associated with the post.
___
When deploying to Heroku, it won't know the tables/relations we have created. To run the migrations we have created:
> heroku run rails db:migrate
___
# What We Learned in this Chapter
- Scaffolding automatically creates code to model data and interact with it through the web.
- Scaffolding is good for getting started quickly but is bad for understanding.
- Rails uses the model-view-controller (MVC) pattern for structuring web applications.
- As interpreted by Rails, the REST architecture includes a standard set of URLs and controller actions for interacting with data models.
- Rails supports data validations to place constraints on the values of data model attributes.
- Rails comes with built-in functions for defining associations between different data models.
- We can interact with Rails applications at the command line using the Rails console.