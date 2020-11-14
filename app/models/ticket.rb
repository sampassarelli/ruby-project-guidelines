class Ticket < ActiveRecord::Base
    belongs_to :user
    belongs_to :event

    # def self.update(updated_quantity)
    #     self.all.quantity = updated_quantity
    #     self.save
    # end
end
