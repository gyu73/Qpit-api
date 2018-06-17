class Api::HintsController < ApplicationController

  def index
    hint = Hint.where(user_id: hint_params_index["id"])[0]
    render json: hint
  end

  def create
    hint_content = request.query_parameters["content"]
    Hint.where(user_id: hint_params_create["id"])[0].update(hint_content => hint_params_create["answer"])
    hint = Hint.where(user_id: hint_params_create["id"])[0]
    render json: hint
  end

  private
  def hint_params_index
    params.permit(:id)
  end

  def hint_params_create
    params.permit(:answer, :id)
  end

end
