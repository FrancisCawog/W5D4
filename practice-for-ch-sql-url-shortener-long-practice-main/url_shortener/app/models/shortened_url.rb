# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true
    def self.random_code
        SecureRandom.urlsafe_base64 # random 22 character (16 byte string)
    end

    after_initialize :generate_short_url, if: :new_record? # 
    
    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    
    private
    def generate_short_url
        code = ShortenedUrl.random_code
        while ShortenedUrl.exists?(:short_url => code)
            code = ShortenedUrl.random_code
        end 
        self.short_url =code
    end 


end
