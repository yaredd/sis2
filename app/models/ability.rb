class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
       if user.role? :super_admin
          can :manage, :all
       elsif user.role? :admin
          can :manage, [Schedule, Teacher, Student, Grade, InterimGrade, Period, Block, Mark, Effort, SchoolSetup, Course]
       elsif user.role? :admin_ro
       		can :read, [Schedule, Teacher, Student, Grade, InterimGrade, Period, Block, Mark, Effort, SchoolSetup, Course]
       elsif user.role? :teacher
          can :read, Schedule
          can :update, Grade do |g|
            g.schedule.teacher.try(:login) == user.login && g.grading_period == Period.current_period
          end
          can :update, InterimGrade do |g|
            g.schedule.teacher.try(:login) == user.login && g.grading_period == Period.current_period
          end
          can :create, [Grade, InterimGrade]
          
          can :read, [Grade, InterimGrade]
       else
          can :read, Schedule
       end
    
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
