class ListPolicy < ApplicationPolicy

  def index?
    create?
  end

  def create?
    user.present? || user.admin?
  end

  def update?
    create?
  end
end
