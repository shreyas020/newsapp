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

    has_one_attached :url

    # scope :published_at, -> {where(status: :created)} 
    scope :published_and_commented, -> { where(Article.count > 3) }
    #scope :created_before, ->(time) { where("created_at < ? ", time) }
    # def self.created_before(time)
    #     where("created_at < ?", time)
    # end
    scope :active, -> { where status: 'created' }
    scope :inactive, -> { where status: 'published' }
=begin
    
    scope :created_before, ->(time) { where("created_at < ?", time)  
    default_scope { where(published_at: published) }
=end
end
