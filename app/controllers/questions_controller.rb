class QuestionsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    questions = Question.all
    @questions = questions.reverse()

  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @time = @question.created_at.strftime("%B %d %Y")
    @answers = Answer.where(question_id: @question.id)

    best_answer = @answers.where(best_answer: true)

    if !best_answer.empty?
      index = @answers.find_index {|obj| obj.id == best_answer[0].id}
      @best_answer = @answers.slice(index)
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    respond_to do |f|
      if @question.save
        f.html {redirect_to @question, notice: "Question was saved!"}
      else
        f.html {render action: 'new', notice: "Question not save!"}
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    respond_to do |f|
      if @question.update(question_params)
        f.html {redirect_to @question, notince: "Question was Updated"}
      else
        f.html {render action: 'edit'}
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |f|
      f.html { redirect_to questions_path, notince: "Quetion is deleted!"}
    end
  end



  private

  def set_event
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :comment)
  end

end
