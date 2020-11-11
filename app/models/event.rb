class Event < ActiveRecord::Base
    has_many :tickets
    has_many :users, through: :tickets 

    def self.find_event_by_city(city)
        city = self.all.select { |event| event.city == city}
        event_details = []
    end

    def self.find_event_by_state(state)
        self.all.select { |event| event.state == state}
    end

    def self.find_event_by_zip(zip)
        self.all.select { |event| event.zip == zip}
    end

end
