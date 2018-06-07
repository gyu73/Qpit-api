class Api::UsersController < ApplicationController

  def create
  	if (!current_user.hint && !current_user.secret_hint)
        hint = Hint.create(user_id: current_user.id)
        SecretHint.create(hint_id: hint.id, user_id: current_user.id)
    end
  end

  def show
      @user = User.find(params[:id])
      @secret_hint = @user.secret_hint
      @hint = @secret_hint.hint

      render json: { user: @user, secret_hint: @secret_hint, hint: @hint }
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    Hint.update(params[:id], has_like_person: nil, belongs_to_club: nil, club: nil, hair_style: nil, clothing: nil, height: nil, personality: nil, age: nil, school: nil, company: nil, favorite_phrase: nil, like_food: nil, like_music: nil, hobby: nil, like_subject: nil, hate_subject: nil, has_spoken: nil)
    SecretHint.update(params[:id], classroom: nil, like_person_initial: nil, familiar: nil, contact_line: nil, like_person_nickname: nil, first_meeting: nil)
    render json: user
  end

  private
    def user_params
      params.require(:user).permit(:like_person_screen_name,:like_person_twitter_profile_image,:stock_arrow,:coming_arrow_number,:last_shoot_time)
    end
end
