class Restaurant < ApplicationRecord

  belongs_to :user
  has_many :reviews,
         -> { extending WithUserAssociationExtension },
         dependent: :destroy
  # has_many :users
  validates :name, length: { minimum: 3 }, uniqueness: true

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end

end
