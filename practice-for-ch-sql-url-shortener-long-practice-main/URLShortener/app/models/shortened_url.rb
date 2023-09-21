class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, :presence: true, uniqueness: true
    validates :user, presence:true

    def self.random_code
        

    end
end