class UploadPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  private

  def is_owner?
    record.post.user == user
  end
end
