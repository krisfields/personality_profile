class QuizzesController < ApplicationController
    respond_to :html, :json

  def index
    @quizzes = Quiz.all
    respond_with(@quizzes)
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions

    if !params[:show]
      respond_with(@quiz)
    else
      respond_with(@questions)
    end
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    @quiz.save
    respond_with(@quiz)
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.update_attributes(params[:quiz])
    respond_with(@quiz)
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_path
  end
end
