class Thumbnail < ApplicationRecord
    belongs_to :thumbnailable, polymorphic: true
end
