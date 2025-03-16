require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe 'validations' do
    it 'is valid with a valid original_url' do
      short_url = ShortUrl.new(original_url: 'https://example.com')
      expect(short_url).to be_valid
    end

    it 'is invalid without an original_url' do
      short_url = ShortUrl.new(short_code: 'abc123')
      expect(short_url).not_to be_valid
      expect(short_url.errors[:original_url]).to include("can't be blank")
    end

    it 'is invalid with a duplicate short_code' do
      ShortUrl.create!(original_url: 'https://example.com', short_code: 'abc123')
      duplicate = ShortUrl.new(original_url: 'https://example2.com', short_code: 'abc123')

      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:short_code]).to include("has already been taken")
    end

    it 'is invalid with an incorrectly formatted URL' do
      short_url = ShortUrl.new(original_url: 'invalid-url', short_code: 'xyz789')
      expect(short_url).not_to be_valid
      expect(short_url.errors[:original_url]).to include("invalid-url")
    end
  end
end