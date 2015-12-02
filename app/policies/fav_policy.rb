class FavPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    record.user == user
  end
end
