class ResponsesController < ApplicationController
  def series
    if params[:op] == "or"
      @series = Series.where("name like '%#{params[:name]}%' OR casts like '%#{params[:casts]}%' OR crews like '%#{params[:crews]}%'")
    else
      @series = Series.where("name like '%#{params[:name]}%' AND casts like '%#{params[:casts]}%' AND crews like '%#{params[:crews]}%'")
    end
    @series.order("name ASC")
    render json: @series
  end

  def channel_schedules
  end

  def channel_schedules_show
  end
end
