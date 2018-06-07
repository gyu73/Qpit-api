class Api::SecretHintsController < ApplicationController

  def show

   if !SecretHint.find_by(id: params[:id]).blank?

	 @login_id = User.find_by(params[:id])
	 @like_id = User.find_by_like_person_screen_name (@login_id)
     @other_like_id = User.find_by_like_person_screen_name (@like_id)

      if @login_id == @other_like_id

	 	render json: SecretHint.find_by(id: params[:id])

	  else
       @msg = 'はずれたよ'
       render json: @msg

	  end
   else
     @msg = 'はずれたよ'
     render json: @msg
   end
  end

  def update
    @secret_hint = SecretHint.find(params[:id])
    @secret_hint.update(secret_hint_params)
    render json: @secret_hint
  end

  private
  def secret_hint_params
    params.require(:secret_hint).permit(:like_person_initial,:familiar,:contact_line,:like_person_nickname,:first_meeting,:user_id,:hint_id)
  end

end
