class ApplicationController < ActionController::API
  
  TOKEN=ENV.fetch("ACCESS_TOKEN")

  before_action :authenticate

  private
  def authenticate
    if request.headers[:TOKEN]===TOKEN

    else
      render json: {errors: [{code: 'E9999',message: 'token error'}]}
    end
  end
end
