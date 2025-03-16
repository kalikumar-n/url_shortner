require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do
  context 'POST #create' do
    it 'creates a new ShortUrl' do
      expect {
        post :create, params: { short_url: { original_url: 'https://stackoverflow.com/questions/6116668/how-to-run-a-single-rspec-test' } }
        puts "Errors: #{assigns(:short_url)&.errors&.full_messages}" # Debugging line
      }.to change(ShortUrl, :count).by(1)
      
      expect(response).to redirect_to(short_urls_path)
      expect(flash[:notice]).to eq('Short URL created successfully!')
    end

    context 'with an existing original_url' do
      it 'does not create a duplicate ShortUrl' do
        existing = ShortUrl.create!(original_url: 'https://example.com', short_code: 'abc123')

        expect {
          post :create, params: { short_url: { original_url: 'https://example.com' } }
        }.not_to change(ShortUrl, :count)

        expect(response).to redirect_to(short_urls_path)
        expect(flash[:notice]).to eq("Short URL already exists: #{existing.short_code}")
      end
    end

    context 'with invalid attributes' do
      it 'renders :new template with errors' do
        post :create, params: { short_url: { original_url: '' } }

        expect(response).to render_template(:new)
        expect(assigns(:short_url).errors[:original_url]).to include("can't be blank")
      end
    end
  end
end