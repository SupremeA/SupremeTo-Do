class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :lists
  has_many :tasks
  has_many :completes, dependent: :destroy

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  def completed(task)
    completes.where(task_id: task.id).first
  end
end
