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
	has_many :backward_followships, :class_name => "Followship", :foreign_key => "follower_id"
	has_many :backward_followers, :through => :backward_followships, :source => :user
end
