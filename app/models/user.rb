class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def approved?
    !approved_at.nil?
  end
end
