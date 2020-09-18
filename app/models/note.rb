class Note < ApplicationRecord
    before_save :default_values
    def default_values
        self.title = 'Title' if self.title.nil?
        self.short_content = 'Short Content' if self.short_content.nil?
        self.long_content = 'Long Content' if self.long_content.nil?
        self.x_offset = 0 if self.x_offset.nil?
        self.y_offset = 0 if self.y_offset.nil?
    end
end
