# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # For anuthorized users
    can :read, Post
    can :by_tag, Post
    can :by_tag, Collection
    can :read, Collection
    can :read, Comment
    can :read, Profile

  # Removed public: true

  # For authorized users
  return unless user.present?
    can :manage, Post, user: user
    can :manage, Profile, user: user
    can :manage, Collection, user: user

    can :create, Comment
    can [ :update, :destroy ], Comment, user_id: user.id

    return unless user.admin?
    can :manage, :all



    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
