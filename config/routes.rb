Rails.application.routes.draw do
  scope "api" do
    get "series" => "responses#series"
    get "channel_schedules" => "responses#channel_schedules"
    get "channel_schedules/:id" => "responses#channel_schedules_show"
  end
end
