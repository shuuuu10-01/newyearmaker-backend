class ApplicationController < ActionController::API
  
  TOKEN=ENV.fetch("ACCESS_TOKEN")

  before_action :authenticate

  private
  def authenticate
    if request.headers[:token]===TOKEN

    else
      render json: {errors: [{code: 'Error code 89',message: 'Invalid or Expired Token'}]}
    end
  end
end
