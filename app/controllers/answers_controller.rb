class AnswersController < ApplicationController
    respond_to :html, :json

  def index
    @answers = Answer.all
    respond_with(@answers)
  end

  def show
    @answer = Answer.find(params[:id])
    respond_with(@answer)
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    @answer.save
    respond_with(@answer)
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params[:answer])
    respond_with(@answer)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to answers_path
  end
end
