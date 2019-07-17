class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_comment, only: [:show, :update, :destroy]
  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    comments = @blog.comments
    render json: comments, status: :ok
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    comment = Comment.find(params[:id])
    render json: comment, status: :ok
  end

  # POST /comments
  # POST /comments.json
  def create
     #@comment = Comment.new(comment_params)
    @comment = @blog.comments.new(comment_params)
   
    if @comment.save
      render json: @comment, status: :created
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
  end

  private

    def set_blog
      @blog = Blog.find(params[:blog_id])
      render json: {
        error: 'not found'
        }, status: 404 if @blog.nil?
          
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      render json: {
        error: 'not found'
      },status: 404 if @comment.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.permit(:name, :comment, :blog_id)
    end
end
