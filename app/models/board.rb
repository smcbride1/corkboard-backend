class Board < ApplicationRecord
    before_save :default_values
    has_many :notes, dependent: :destroy
    def default_values
        self.name = 'New Board' if self.name.nil?
    end
end
