class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @topic = Topic.find(params[:topic_id])
    @questions = @topic.questions.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:question])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:question])
  end

  # POST /questions
  # POST /questions.json
  def create
     @topic = Topic.find(params[:topic_id])
     @question = @topic.questions.create(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to :back, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:question])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to :back, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    # @topic = Topic.find(params[:topic_id])
    # @question = @topic.questions.find(params[:question])
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Question was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
