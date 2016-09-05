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

	has_many :followships
	has_many :followers, :through => :followships
	has_many :inverse_followships, :class_name => 'Followship', :foreign_key => "follower_id"
	has_many :inverse_followers, :through => :inverse_followships, :source => :user, :foreign_key => "followed_id"
end
