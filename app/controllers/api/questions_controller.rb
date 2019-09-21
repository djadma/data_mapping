class Api::QuestionsController < ApplicationController
  def index
    questions = Question.all
    render :json=> {
      questions: ActiveModel::Serializer::CollectionSerializer.new(questions, each_serializer: QuestionSerializer)
    }
  end

  def create
    question = Question.new(question_params)
    if question.save
      render json: question, serializer: QuestionSerializer
    else
      render json: question.errors
    end

  rescue ActiveRecord::RecordNotFound 
    render json: { message: "Something went wrong" }
  end

  def edit
    question = Question.find(params[:id])
    render json: question, serializer: QuestionSerializer

  rescue ActiveRecord::RecordNotFound
    render json: { message: "record not found" }
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(question_params)
    render json: question, serializer: QuestionSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { message: "record not found" }
  end

  private

  def question_params
    params.require(:question).permit(:title, :role_id, :mapping_id)
  end
end