Rails.application.routes.draw do
  scope "api" do
    get "callback" => "responses#callback"
  end
end
