class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :participants
         has_many :created_trips , :class_name => "Trip", :foreign_key => "user_id"
         has_many :trips, :through => :participants
         validates :first_name, :presence => true
         validates :last_name, :presence => true
         validates :email, :presence => true
         validates :image, :presence => true
end
