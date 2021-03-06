class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	validates :fullname, presence: true, length: { maximum: 50}

	validates :nickname, presence: true, 
			length: { maximum: 50},
			uniqueness: true

	has_many :photos
	has_many :comments
	has_many :likes

	has_many :followships
	has_many :followers, :through => :followships
	has_many :back_followships, :class_name => "Followship", :foreign_key => "follower_id"
	has_many :back_followers, :through => :back_followships, :source => :user
end
