class Api::HintsController < ApplicationController

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
  def hint_params
      params.require(:hint).permit(:has_like_person,:belong_to_club,:club,:hair_style,:clothing,:height,:personality,:age,:school,:company,:favorite_phrase,:like_food,:like_music,:hobby,:like_subject,:hate_subject,:has_spoken,:user_id)
  end

end
