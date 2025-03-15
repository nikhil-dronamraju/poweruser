class User < ApplicationRecord
  has_secure_password validations: false
  has_many :tracks, dependent: :destroy
  has_many :sagas, dependent: :destroy
  has_many :daily_tasks, dependent: :destroy
  has_many :smart_goals, dependent: :destroy
  # validations:
  validates :username, presence: { message: "Must enter a username" }
  validates :username, uniqueness: { message: "Username already taken" }
  validates :name, presence: { message: "Must enter a name" }
  validates :password, presence: { message: "Must enter a password" }
  validates :tracks, length: { is: 6, message: "Must select at least one track." }
  validates :sagas, length: { minimum: 1, message: "Must have at least one saga." }
  validates :email, presence: { message: "Must enter a email" }
  has_many :workouts, dependent: :destroy
  accepts_nested_attributes_for :sagas, allow_destroy: true
  accepts_nested_attributes_for :tracks, allow_destroy: true

  def first_name
    self.name.split(" ")[0]
  end

  def smart_goals
    goal_ids = []
    tracks.each do |track|
      goal_ids << track.smart_goal_ids
    end

    SmartGoal.where(id: goal_ids.flatten)
  end

  def daily_tasks
    task_ids = []
    smart_goals.each do |smart_goal|
      task_ids << smart_goal.daily_task_ids
    end

    DailyTask.where(id: task_ids.flatten)
  end
end
