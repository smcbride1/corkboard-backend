class Board < ApplicationRecord
    before_save :default_values
    def default_values
        self.name = 'New Board' if self.name.nil?
    end
end
