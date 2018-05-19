class Person < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy
  has_many :phones, dependent: :destroy, inverse_of: :person

  validates :name, :cpf, :rg, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validates :email, format: /@/, allow_blank: true
  validates_with CPFValidator

  accepts_nested_attributes_for :address

  before_save :normalize_cpf

  private

  def normalize_cpf
    self.cpf = CPF.new(cpf).try(:stripped)
  end
end
