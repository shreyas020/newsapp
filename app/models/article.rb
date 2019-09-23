class Article < ApplicationRecord
    enum status: {
                    created: 0,
                    composed: 1,
                    published: 2,
                    recomposed: 3,
                    republished: 4,
                    unpublished: 5,
                    rejected: 6
                }
    validates :title, presence: true
    validates :long_description, presence: true
    validates :short_description, presence: true
    validates :status, inclusion: { in: %w(created composed published recomposed republished unpublished rejected), message: "%{value} is not a valid status_type" }

    has_many :media, as: :mediable
    has_one :thumbnails, as: :thumbnailable
    has_many :comments, as: :commentable 
end
