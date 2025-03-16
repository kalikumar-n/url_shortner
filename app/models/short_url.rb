class ShortUrl < ApplicationRecord
  before_validation :generate_short_code, on: :create

  # Validate the URL using the regex
  validates :original_url, presence: true, format: { with: /\A(http|https):\/\/[^\s]+\z/i, message: 'invalid-url' }
  validates :short_code, presence: true, uniqueness: true

  private

  def generate_short_code
    return if short_code.present?

    loop do
      # Generates a random 6-character string
      self.short_code = SecureRandom.alphanumeric(6) 
      
      # Break the loop if the unique URL is found.
      break unless ShortUrl.exists?(short_code: short_code) 
    end
  end
end