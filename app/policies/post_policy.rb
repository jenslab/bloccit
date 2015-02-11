class PostPolicy < ApplicationPolicy
class Scope < Scope

    def resolve
      if user.admin? || user.moderator?
        scope.all
        else 
        scope.where(:user => user)
        end
      end
    end

    def index?
      user.admin? || user.moderator?
    end
end