class Job < ActiveRecord::Base
  attr_accessible :job_code, :name, :user_id
end
