class Trip < ActiveRecord::Base
  has_many :participants
  belongs_to :user
  has_many :users, :through => :participants
end
