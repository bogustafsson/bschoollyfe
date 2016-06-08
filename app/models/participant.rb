class Participant < ActiveRecord::Base
#trip_id: must be present
validates :trip_id, :presence => true, :uniqueness => { :scope => :user_id, message: "You have already joined this trip"}

#user_id: must be present
validates :user_id, :presence => true


  belongs_to :user
  belongs_to :trip

end
