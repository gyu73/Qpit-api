class Api::HintsController < ApplicationController

  def create
    hint_content = request.query_parameters["content"]
    Hint.where(user_id: secret_hint_params["id"])[0].update(hint_content => secret_hint_params["answer"])
    hint = Hint.where(user_id: secret_hint_params["id"])[0]
    render json: hint
  end

  def show
    @helo = !Hint.find_by(id: params[:id])
    if @helo.blank?
      render json: Hint.find_by(id: params[:id])
    else
      @msg = 'はずれたよ'
      render json: @msg
    end
  end

  def update
    @hint = Hint.find(params[:id])
    @hint.update(hint_params)
    render json: @hint
  end

  private
  def secret_hint_params
    params.permit(:answer, :id)
  end

end
