class UserAnswersController < ApplicationController
    respond_to :html, :json

  def index
    @user_answers = UserAnswer.all
    respond_with(@user_answers)
  end

  def show
    @user_answer = UserAnswer.find(params[:id])
    @questions = @user_answer.questions

    if !params[:show]
      respond_with(@user_answer)
    else
      respond_with(@questions)
    end
  end

  def new
    @user_answer = UserAnswer.new
  end

  def create
    @user_answer = UserAnswer.new(params[:user_answer])
    @user_answer.save
    respond_with(@user_answer)
  end

  def edit
    @user_answer = UserAnswer.find(params[:id])
  end

  def update
    @user_answer = UserAnswer.find(params[:id])
    @user_answer.update_attributes(params[:user_answer])
    respond_with(@user_answer)
  end

  def destroy
    @user_answer = UserAnswer.find(params[:id])
    @user_answer.destroy
    redirect_to user_answers_path
  end
end
