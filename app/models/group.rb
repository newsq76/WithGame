class Group < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 18 }
  
  has_many :group_users, dependent: :destroy
  has_many :favoritegroups, through: :group_users, source: :user
  has_many :groupposts
end
