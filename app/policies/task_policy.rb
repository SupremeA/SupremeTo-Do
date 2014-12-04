class TaskPolicy < ApplicationPolicy

  def index?
    create?
  end

  def create?
    user.present? && (record.user == user || user.admin?)
  end

  def update?
    create?
  end
end
