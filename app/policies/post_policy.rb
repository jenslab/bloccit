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

    def destroy?
      user.present? && (record.user == user || user.admin? || user.moderator?)
    end
end