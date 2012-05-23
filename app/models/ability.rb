class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
       if user.role? :super_admin
          can :manage, :all
       elsif user.role? :admin
          can :manage, [Schedule, Teacher, Student, Grade, FinalGrade, InterimGrade, Period, Block, Mark, Effort, SchoolSetup, Course, SectionComment]
       elsif user.role? :admin_ro
       		can :read, :all
       		can :verification, Schedule
       		can :warning_grades, Student
       		can :report_card, Student
       elsif user.role? :teacher
       		can :read, Student
       		can :interim_report_card, Student
       		can :report_card, Student
       		can :create, SectionComment
       		can :read, SectionComment
       		can :update, SectionComment do |sc|
       			user.login == sc.teacher.try(:login) && sc.period == Period.current_grading_period
       		end
          can :read, Schedule
          can :update, Grade do |g|
            g.schedule.teacher.try(:login) == user.login && g.grading_period == Period.current_grading_period
          end
          can :update, FinalGrade do |fg|
          	fg.schedule.teacher.try(:login) == user.login && "Sem2" == Period.current_grading_period
          end
          can [:update, :destroy], InterimGrade do |g|
            g.schedule.teacher.try(:login) == user.login && g.grading_period == Period.current_period
          end
          can :create, [Grade, InterimGrade, FinalGrade]
          
          can :read, [Grade, InterimGrade, FinalGrade]
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
