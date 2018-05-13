class Person < ApplicationRecord
  validates :name, :cpf, :rg, :member, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validates :email, format: /@/
  validate :cpf_format

  private

  def cpf_format
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf, strict: true)
  end
end
