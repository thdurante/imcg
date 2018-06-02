class Person < ApplicationRecord
  has_one :user, dependent: :restrict_with_error
  has_one :address, as: :addressable, dependent: :destroy
  has_many :phones, dependent: :destroy, inverse_of: :person

  validates :name, :cpf, :rg, :address, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validates :email, format: /@/, allow_blank: true
  validate :at_least_one_phone
  validates_with CPFValidator

  accepts_nested_attributes_for :address, allow_destroy: false
  accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: ->(attr) { attr['number'].blank? }

  before_save :normalize_cpf

  private

  def normalize_cpf
    self.cpf = CPF.new(cpf).try(:stripped)
  end

  def at_least_one_phone
    errors.add(:base, :at_least_one) if phones.reject(&:marked_for_destruction?).blank?
  end
end
