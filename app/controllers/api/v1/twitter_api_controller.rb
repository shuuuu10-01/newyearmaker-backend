class Api::V1::TwitterApiController < ApplicationController
  require 'httpclient'
    def follow
      url = "#{ENV.fetch("TWITTER_API_HTTPS_FRIENDSHIP")}.json?source_id=#{params[:source_id]}&target_id=#{params[:target_id]}"
      header = { Authorization: "Bearer #{ENV.fetch("TWITTER_BEARER_TOKEN")}"}
      client = HTTPClient.new
      response = client.get(url, header: header)
      
      render json: JSON.parse(response.body)
    end

    def check
      url = "#{ENV.fetch("TWITTER_API_HTTPS_FRIENDSHIP")}.json?source_id=#{params[:source_id]}&target_screen_name=#{params[:target_screen_name]}"
      header = { Authorization: "Bearer #{ENV.fetch("TWITTER_BEARER_TOKEN")}"}
      client = HTTPClient.new
      response = client.get(url, header: header)
      render json: JSON.parse(response.body)
    end
end
