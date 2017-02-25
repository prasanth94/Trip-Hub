class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :galleries
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

end