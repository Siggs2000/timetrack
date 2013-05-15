class Job < ActiveRecord::Base
  attr_accessible :job_code, :name, :user_id
  belongs_to :user
  has_many :billables
end
