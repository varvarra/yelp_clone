class Restaurant < ApplicationRecord

  has_many :reviews,
         -> { extending WithUserAssociationExtension },
         dependent: :destroy
  has_many :users
  validates :name, length: { minimum: 3 }, uniqueness: true
end
