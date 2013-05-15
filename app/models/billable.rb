class Billable < ActiveRecord::Base
  attr_accessible :date_in, :date_out, :job_id, :time_in, :time_out
  belongs_to :job
end
