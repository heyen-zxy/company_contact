class Ability
  include CanCan::Ability

  def initialize(admin)
    pp admin, 1111
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    if admin.admin?
        can :manage, :all
    end

    if admin.normal_admin?
      can_session
      can :manage, :users
    end

    if admin.user?
      can_session
      can :read, :users
    end

    def can_session
      # 登陆后各个权限都可以的操作
      can :manage, :admin_session # login相关操作
    end

  end
end
