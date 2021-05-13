class LinksController < ApplicationController
  @@url = "#"
  @@error = nil
  def index
    if params[:short]
      redirect_to Link.find_by(short: params[:short]).url
    else
      @links = Link.all
    end
  end

  def new
    @error = @@error
    @url = @@url
  end

  def create
    @@error = nil
    # Delete port for Heroku and change http to https (if not working)!
    @@url = "http://#{request.host}:#{request.port}/"
    link = Link.where(url: params[:message]).first
    if link
      @@url += link.short
      p @@url
    else
      short = generate_short(6)
      link = Link.create(short: short, url: params[:message])
      if link.id
        @@url += link.short
      else
        @@url = "#"
        @@error = 'Invalid URL' 
      end
    end
    redirect_to '/new'
  end

  def generate_short(number)
    charset = Array('a'..'z')
    short = Array.new(number) { charset.sample }.join
    short = Array.new(number) { charset.sample }.join until Link.where(short: short).empty?
    short
  end
end
