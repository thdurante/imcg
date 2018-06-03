class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  belongs_to :person

  validates :person, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  delegate :name, :cpf, :rg, :phones, :address, to: :person
  delegate :member, :occupation, to: :person, allow_nil: true

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def approved?
    !approved_at.nil?
  end
end
