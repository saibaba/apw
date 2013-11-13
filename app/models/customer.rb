class Customer < ActiveRecord::Base
    has_many :applications
end
