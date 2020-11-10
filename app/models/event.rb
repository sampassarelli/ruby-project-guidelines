class Event < ActiveRecord::Base
    has_many :tickets
    has_many :users thorugh :tickets
end
