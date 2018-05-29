class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :addressable, :street, :number, :complement, :neighborhood, :city, :state, presence: true
end
