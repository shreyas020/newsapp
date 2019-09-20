class Catalog < ApplicationRecord
    enum ctype: { article: 0, poll: 1, gallery: 2 }
    has_many :articles
    has_many :polls 
    has_many :galleries 
    validates :name, presence: true
    validates :ctype, inclusion: { in: %w(article poll gallery), message: "%{value} is not a valid catalog_type" }
end
