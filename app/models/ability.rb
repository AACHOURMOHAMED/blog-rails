# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     can %i[create read], Post
#     can %i[create read], Comment
#     can %i[update destroy], Post, user_id: user.id
#     can %i[update destroy], Comment, user_id: user.id

#     return unless user.admin?

#     can :manage, :all
#   end
# end
