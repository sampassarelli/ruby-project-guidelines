class User < ActiveRecord::Base 
    belongs_to :tickets
    belongs_to :events through: tickets
end