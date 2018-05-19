class CPFValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:cpf, :invalid) unless CPF.valid?(record.cpf, strict: true)
  end
end
