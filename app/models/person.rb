class Person < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy
  has_many :phones, dependent: :destroy, inverse_of: :person

  validates :name, :cpf, :rg, :member, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validates :email, format: /@/
  validate :cpf_format

  accepts_nested_attributes_for :address

  private

  def cpf_format
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf, strict: true)
  end
end
