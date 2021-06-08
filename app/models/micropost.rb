class Micropost < ApplicationRecord
    belongs_to :user
    validates_presence_of :content, length: { maximum: 140 }
    
end
