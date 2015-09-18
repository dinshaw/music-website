class DemosController < ApplicationController
  def index
    @demos = AwsWrapper.new.demos
  end
end
