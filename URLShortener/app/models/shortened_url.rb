class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


  # after_initialize do |user|
  #   #calls generate_short_url

  #   ShortenedUrl.random_code
  # end

  def self.random_code
    temp=false
    while !temp
      code = SecureRandom.urlsafe_base64
      temp=true if !ShortenedUrl.exists?(:short_url => code)
    end
    code
  end

end