class EventsController < ApplicationController

  def index
    @events = Event.all.order(date: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    artist_name = @event.artist_name

    if @event.spotify_artist_id == nil
      @spotify_data = Event.get_spotify_data(artist_name)
      if @spotify_data == nil
        @spotify_artist_id = nil
      else
        @spotify_artist_id = @spotify_data.id
        @event.spotify_artist_id = @spotify_artist_id
        @event.save
      end
    else
      @spotify_artist_id = @event.spotify_artist_id
    end
  end

end
