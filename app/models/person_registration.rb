class PersonRegistration
  include ActiveModel::Model

  attr_accessor :cpf

  validates :cpf, presence: true
  validate :cpf_format

  private

  def cpf_format
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf, strict: true)
  end
end
