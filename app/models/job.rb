class Job < ActiveRecord::Base
  belongs_to :tag
  has_many :applications
end
