class Phone < ApplicationRecord
  belongs_to :person, inverse_of: :phones

  validates :person, :number, :kind, presence: true
  validates :kind, inclusion: { in: PhoneKind.names }
  validates :number, uniqueness: { scope: :person_id }
  validates :number, format: /\b\d{8,11}\b/
end
