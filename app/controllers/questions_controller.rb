class QuestionsController < ApplicationController

before_action :set_question, only: %i[ show edit update destroy]

    def edit
    end

    def show
    end



    def update
        if @question.update question_params
            redirect_to question_path
        else
          render :edit
        end
    end

    def destroy
        if @question.destroy
            redirect_to questions_path
        else
            redirect_to questions_path
        end
    end

    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new question_params
        if @question.save
            redirect_to questions_path
        else
            render :new
        end
    end

    private

    def question_params
        params.require(:question).permit(:title, :body)
    end

    def set_question
      @question = Question.find(params[:id])
    end

end
