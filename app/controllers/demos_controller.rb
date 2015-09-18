class DemosController < ApplicationController
  def index
    @demo_tracks = AwsWrapper.new.demos
    @covers = DropboxWrapper.new.covers
  end
end
