class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	has_many :photos

	validates :fullname, presence: true, length: { maximum: 50}

	validates :nickname, presence: true, 
			length: { maximum: 50},
			uniqueness: true
end
