class ShortUrlsController < ApplicationController
  
  def index
    @short_urls = ShortUrl.all.order(created_at: :desc) # Show latest first
  end

  def new
    @short_url = ShortUrl.new
  end

  def create
    existing_url = ShortUrl.find_by(original_url: short_url_params[:original_url])
  
    # if the original url has been shorten already, then return the short code record.
    if existing_url
      redirect_to short_urls_path, notice: "Short URL already exists: #{existing_url.short_code}"
    else
      @short_url = ShortUrl.new(short_url_params)

      if @short_url.save
        redirect_to short_urls_path, notice: "Short URL created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def redirect
    @short_url = ShortUrl.find_by(short_code: params[:short_code])

    # redirecting the url to the original url 
    if @short_url
      redirect_to @short_url.original_url, allow_other_host: true
    else
      render plain: "URL not found", status: :not_found
    end
  end

  private

  def short_url_params
    params.require(:short_url).permit(:original_url)
  end
end