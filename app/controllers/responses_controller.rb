class ResponsesController < ApplicationController
  def callback
    response = {
      name: "horie",
      age: "21"
    }
    render json: response
  end
end
