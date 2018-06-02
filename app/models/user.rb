class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  belongs_to :person

  validates :person, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  delegate :name, :cpf, :rg, :phones, :address, to: :person
  delegate :member, :occupation, to: :person, allow_nil: true

  def approved?
    !approved_at.nil?
  end
end
