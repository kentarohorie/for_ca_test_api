class ResponsesController < ApplicationController
  def series
    if params[:op] != "or" and params[:op] != "and" and params[:op] != nil
      @response = {
        status: 400
      }
      render json: @response
    else
      if params[:op] == "or"
        @series = Series.where("name like '%#{params[:name]}%' OR casts like '%#{params[:casts]}%' OR crews like '%#{params[:crews]}%'").order("name ASC")
      else
        @series = Series.where("name like '%#{params[:name]}%' AND casts like '%#{params[:casts]}%' AND crews like '%#{params[:crews]}%'").order("name ASC")
      end
        render json: @series
    end
  end

  def channel_schedules
    @news = ChannelSchedule.where(channel: "Newsチャンネル").order("start_at ASC")
    @anime = ChannelSchedule.where(channel: "アニメチャンネル").order("start_at ASC")
    @bara = ChannelSchedule.where(channel: "バラエティチャンネル").order("start_at ASC")
    @response = {
      "Newsチャンネル": @news,
      "バラエティチャンネル": @bara,
      "アニメチャンネル": @anime
    }
    render json: @response
  end

  def channel_schedules_show
    @cs = ChannelSchedule.find_by_id(params[:id])
    if @cs == nil
      @response = {
        status: 404
      }
    elsif params[:exclude] != "comments" and params[:exclude] != nil
      @response = {
        status: 400
      }
    else
      @pg = @cs.program
      @comments = @cs.comments
      @response = {
        id: @cs.id,
        channel: @cs.channel,
        startAt: @cs.start_at,
        endAt: @cs.end_at,
        program: {
          title: @pg.title,
          content: @pg.content,
          highlight: @pg.highlight,
          casts: @pg.casts,
          crews: @pg.crews
        },
        comments: @comments
      }
      @response.delete(:comments)  if params[:exclude] == "comments"
    end
    render json: @response
  end
end
