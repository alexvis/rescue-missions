class AnswersController < ApplicationController

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    respond_to do |f|
      if @answer.save
        f.html {redirect_to question_path(@question)}
      else
        f.html {redirect_to question_path(@question)}
      end
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update

    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question_id)
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to question_path(answer.question_id)
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :discription, :question_id, :best_answer)
  end
end
