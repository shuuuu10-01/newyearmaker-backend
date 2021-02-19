class Api::V2::UsersController < ApplicationController
  before_action :set_user, only: [:set]
  def set
    if(@user1)
      if @user1.update(user_params)
        render json: { status: 'SUCCESS', data: @user1 }
      else
        render json: { status: 'ERROR', data: @user1.errors }
      end
    else
      if @user0.save 
        render json: { status: 'SUCCESS', data: @user1 }
      else
        render json: { status: 'ERROR', data: @user0.errors }
      end
    end
  end

  def index
    user =User.all();
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: user }
  end
  private
  def set_user
    @user0 = User.new(user_params)
    @user1 = User.find_by(uid: @user0.uid)
  end

  def user_params #ここでPOSTされる中身を選択
    params.permit(:uid,:idToken)
  end
end
