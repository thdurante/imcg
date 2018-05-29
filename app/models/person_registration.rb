class PersonRegistration
  include ActiveModel::Model

  attr_accessor :cpf

  validates :cpf, presence: true
  validates_with CPFValidator
end
