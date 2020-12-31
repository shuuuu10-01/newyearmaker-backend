class Api::V1::RecievesController < ApplicationController
  def add
    recieve = Recieve.new(recieve_params)
    if Recieve.find_by(uid: recieve.uid,public_uid: recieve.public_uid)===nil #重複を防ぐ
      if recieve.save
      render json: { status: 'SUCCESS', data: recieve }
      else
      render json: { status: 'ERROR', data: card.errors }
      end
    else
      render json: { status: 'ERROR', data: card.errors }
    end
  end

  def where
    recieves = Recieve.where(uid: params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: recieves }
  end

  private
  def recieve_params #ここでPOSTされる中身を選択
    params.permit(:uid,:public_uid,:display_name)
  end
end
