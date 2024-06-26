class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show edit update destroy]

  def edit
  end

  def show
    @question = @question.decorate
    @answer = @question.answers.build
    @pagy, @answers = pagy(@question.answers.order(created_at: :desc), request_path: question_path)
    @answer = @answer.decorate

    # @answers = @question.answers.order(created_at: :desc).page(params[:page])
    # @answers = Answer.where(question: @question).order created_ad: :desc
  end

  def update
    if @question.update question_params
      flash[:success] = 'Question updated'
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = 'Question deleted'
      redirect_to questions_path
    else
      redirect_to questions_path
    end
  end

  def index
    @pagy, @questions = pagy(Question.order(created_at: :desc))
    @questions = @questions.decorate
    # @questions = Question.order(created_at: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Question created'
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find(params[:id])
  end
end
