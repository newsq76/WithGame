class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :profile, length: { maximum: 100 }
  
  has_secure_password
  
  has_many :groups
  has_many :group_users
  has_many :groupposts
  
  has_many :favoritegroups, through: :group_users, source: :group
  
  def like(group)
    self.group_users.find_or_create_by(group_id: group.id)
  end
  
  def unlike(group)
    favorite = self.group_users.find_by(group_id: group.id)
    favorite.destroy if favorite
  end
  
  def likes?(group)
    self.favoritegroups.include?(group)
  end
end
