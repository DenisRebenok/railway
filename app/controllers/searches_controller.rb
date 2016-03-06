class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
    prms = params[:start_station_id] && params[:end_station_id]
    if prms
      @start_station = RailwayStation.find(params[:start_station_id]).first
      @end_station = RailwayStation.find(params[:end_station_id]).first
      @routes = @start_station.routes & @end_station.routes
    end
  end
end