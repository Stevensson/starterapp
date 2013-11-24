# Starterapp

### very work in progress

Every project starts with a number of repetitive tasks, like getting a clean interface, installing some core gems, etc. 

This is a starter app which consists of
- number of gems
- clean starter UI with bootstrap, including
..* logged out home 
..* logged in home
..* sign in and register pages
..* header and footer
..* OPEN display of error messages
..* basic users
..* OPEN admin role



Notes:

* to keep user on same page when logged out -> add to application controller:
def after_sign_out_path_for(resource_or_scope)
  request.referrer
end

*also add Gmail or me.com Style at https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-sign-in-using-their-username-or-email-address


* instructions on how to remove scaffolded items (posts)