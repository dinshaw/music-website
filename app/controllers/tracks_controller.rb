class TracksController < ApplicationController
  http_basic_authenticate_with name: "secret", password: "password"
  def index
    @tracks = AwsWrapper.new.tracks
  end
end
