class VisitController < ApplicationController
  def report
    render json: Visit.all
  end
end
