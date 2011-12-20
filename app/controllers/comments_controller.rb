class CommentsController < ApplicationController
  before_filter :get_post

  def get_post
    @post = Post.find(params[:post_id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render json: @post, status: :created, location: [@post, @comment] }
      else
        flash[:comment] = @comment
        format.html { redirect_to @post, notice: 'errors you fool'}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
