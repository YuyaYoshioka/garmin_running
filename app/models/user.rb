class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 200 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :normal_heartbeat, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :max_heartbeat, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :maximal_oxygen_consumption, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :lactate_threshold, presence: true, numericality: { greater_than_or_equal_to: 0}

  before_validation :calculate_max_heartbeat, :calculate_maximal_oxygen_consumption, :calculate_lactate_threshold

  enum sex: { man: 1, woman: 2 }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  private

  def calculate_max_heartbeat
    if max_heartbeat.nil? && age
      self.max_heartbeat = 220 - age
    end
  end

  def calculate_maximal_oxygen_consumption
    if maximal_oxygen_consumption.nil? && age && normal_heartbeat
      self.maximal_oxygen_consumption = 15 * max_heartbeat / normal_heartbeat
    end
  end

  def calculate_lactate_threshold
    if lactate_threshold.nil? && age && normal_heartbeat
      self.lactate_threshold = (max_heartbeat - normal_heartbeat) * 0.75 + normal_heartbeat
    end
  end
end
