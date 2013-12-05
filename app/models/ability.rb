class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, Post
    
    elsif user.user?
      can :read, Post
    else 
      cannot :read, Post
    end
  end
end