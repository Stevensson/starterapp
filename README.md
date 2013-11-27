# Starterapp

### very work in progress

Every project starts with a number of repetitive tasks, like getting a clean interface, installing some core gems, etc. Quite unnecessary to reproduce these steps each time. 

This is a starter app which consists of a number of installed gems with basic configurations and a clean UI
* bootsrap included, somewhat presentable
* logged out home 
* logged in home
* basic users
* sign in and register pages
* header and footer
* add username to devise
* use email or username to sign in
* user greeting by name
* OPEN admin role (Need Role Model Gem, then either declarative authorization or CanCan)
* OPEN display of error messages in footer for Admins
* OPEN admin can create, update and delete users in admin dashboard
* OPEN admin can create posts for users
* OPEN admin can edit posts for users
* OPEN admin can delete posts for users
* OPEN tagging for posts
* OPEN tag categories for posts
* OPEN confirm account via email
* OPEN redirect to page when auth filter and hit reg wall
* OPEN send email
* OPEN receive email
* OPEN see only your posts, but not posts from others
* OPEN add user pages, visible only to users and admins // alt: public
* OPEN custom/intelligent headers

* OPEN add beta page for user signup via mailchimp (or other email)
* OPEN user images

* OPEN deploy to Heroku and test

###Questions
- MASSIVE: https://github.com/sferik/rails_admin/wiki

- authorization from scratch
- there's an interesting option for roles and authorization, caled the_role https://github.com/the-teacher/the_role#install

Interesting Gem: 
https://github.com/airblade/paper_trail to track database migrations





Notes:

* Devise notes: http://railscasts.com/episodes/209-devise-revised
* you can configure devise routes to be custom (e.g. user/sign_in vs log_in )
* to add authentication in controllers, add: before_filter :authenticate_user!, 
* need to specify the method when destroying sessions
* 
* 
* 
* 
* 
* 


* to keep user on same page when logged out -> add to application controller:
def after_sign_out_path_for(resource_or_scope)
  request.referrer
end

*Possible future: add Gmail or me.com Style at https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-sign-in-using-their-username-or-email-address




* instructions on how to remove scaffolded items (posts)


How to add user via console: 
	User.new(username: "Tom", email: "tom@shoe.com", password: "dude")

	u = User.new(:email => "user@name.com", :password => "dude", :username => "Tom")
	u.errors will return error messages
	there's a password length validation on this -> so minimum 8 chars.

	u = User.new(:email => "user@name.com", :password => "dudethisisawesome", :username => "Tom")

Faster: 
	u = User.create!(:email => "user1@name.com", :password => "dudethisisawesome", :username => "Tom1")


Adding gem role_model --> default assign role to new users, but requires having a seaprate model for roles
	  after_create :default_role

	  private
	  def default_role
	    self.roles << Role.where(:name => 'User').first
	  end


funky
something else


