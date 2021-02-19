class Api::V1::CardsController < ApplicationController
  before_action :set_card, only: [:show,:update,:destroy]
  before_action :authenticate, only: [:update,:destroy]
  rescue_from StandardError,with: :error500 

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @card }
  end

  def create
    card= Card.new(card_params)
    if card.save
      render json: { status: 'SUCCESS', data: card }
    else
      render json: { status: 'ERROR', data: card.errors }
    end
  end

  def where
    cards = Card.where(uid: params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: cards }
  end

  def destroy
    if params[:uid]==@card.uid
      @card.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the post', data: @card }
    else
      render json: {errors: [{code: '403',message: 'Forbidden'}]}
    end
  end

  def update
    card= Card.new(card_params)
    if card.uid==@uid[0]
      if @card.update(card_params)
      render json: { status: 'SUCCESS', message: 'Updated the post', data: @card }
      else
        render json: { status: 'ERROR', message: 'Not updated', data: @card.errors }
      end
    else
      render json: {errors: [{code: '403',message: 'Forbidden'}]}
    end
  end
  private
  def set_card
    @card = Card.find_by(public_uid: params[:id])
  end

  def authenticate
    access_token = extract_access_token_from_header
    @uid = access_token[0]['firebase']['identities']['twitter.com']
  end

  def extract_access_token_from_header
    Firebase::Auth::IDTokenKeeper::IDToken.new(token_from_request_headers).verified_id_token
  end

  def token_from_request_headers 
    request.headers['idToken']
  end 

  def card_params #ここでPOSTされる中身を選択
    params.require(:card).permit(:uid,:text,:gif,:share,:display_name,:DM_id,:top,:left,:width,:height,:select)
  end

  def error500(error)
    render json: {errors: [{code: 'E9999',message: 'カードが見つかりませんでした'}]}, status: :internal_server_error
  end
end
