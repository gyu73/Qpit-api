class Api::HomesController < ApplicationController

  def show
   row = Hint.find_by(id: params[:id])
   columns = [:has_like_person, :belongs_to_club, :club, :hair_style, :clothing, :height, :personality, :age, :school, :company, :favorite_phrase, :like_food, :like_music, :hobby, :like_subject, :hate_subject, :has_spoken]
   count = columns.select{|column| row.send(column).presence}.size

   row = SecretHint.find_by(id: params[:id])
   columns = [:like_person_initial, :class_room, :familiar, :contact_line, :like_person_nickname, :first_meeting]
   count2 = columns.select{|column| row.send(column).presence}.size


   if count <= 7 or count2 <= 3
   	@msg = 'My急接近ヒント、Myヒントの記入の数が足りないよ！'
    render json: @msg

   elsif User.find_by(id: params[:id], stock_arrow: 0)
    user = User.find(params[:id])
    @bb = user.last_shoot_arrow_time
    @aa = (@bb - Time.new.to_time)
    @cc = (14400+@aa)
   	render json: @cc
      if @cc <= 0
        User.update(params[:id], stock_arrow: 1)
      end

   else
    aa = User.find(params[:id])
    aa.last_shoot_arrow_time = Time.new.to_time.to_datetime
    aa.save
    User.update(params[:id], stock_arrow: 0)
    taoka = User.find(params[:id])
    taoka.comig_arrow_number = 1+taoka.comig_arrow_number.to_i
    taoka.save
    render json: taoka
   end

  end
 end
