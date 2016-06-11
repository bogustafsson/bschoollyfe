class Trip < ActiveRecord::Base
  has_many :participants
  belongs_to :user
  has_many :users, :through => :participants

  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :location, :presence => true
  validates :date, :presence => true, :timeliness => {:after => Date.current}
end
