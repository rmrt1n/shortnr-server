class UrlObjectController < ApplicationController
  def show
    # analytics (not sure if working bcuz testing in localhost now)
    @v = Visit.new(slug: params[:slug], ip: request.ip, location: request.env['ipinfo'].all.to_s)
    @v.save


    # return url object
    @url = UrlObject.find_by(slug: params[:slug])
    if @url != nil
      render json: @url, status: 200
    else
      render json: {'message': 'not found'}, status: 404
    end
  end

  def shorten
    @url = UrlObject.new(long_url: params[:url])
    @url.shorten_url
    if @url.save
      render json: @url, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end
end
