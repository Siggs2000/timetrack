class User < ActiveRecord::Base
  attr_accessible :admin, :contractor, :name
end
