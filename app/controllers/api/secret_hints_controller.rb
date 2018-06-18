class Api::SecretHintsController < ApplicationController

  def index
    secret_hint = SecretHint.where(user_id: secret_hint_params_index["id"])[0]
    render json: secret_hint
  end

  def create
    hint_content = request.query_parameters["content"]
    SecretHint.where(user_id: secret_hint_params_create["id"])[0].update(hint_content => secret_hint_params_create["answer"])
    secret_hint = SecretHint.where(user_id: secret_hint_params_create["id"])[0]
    render json: secret_hint
  end

  private
  def secret_hint_params_index
    params.permit(:id)
  end

  def secret_hint_params_create
    params.permit(:answer, :id)
  end

end
