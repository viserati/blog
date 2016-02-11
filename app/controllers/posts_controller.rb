class PostsController < ApplicationController
  # The before_action iss a class method that automatically calls the set_post
  # method [BELOW]. This eliminates duplicate code in the other methods [DRY].
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json

  # The index action retrieves all posts from the database.
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json

  # The show action retrieves a single post from the database, but the show
  # method contains no code at all. This method relies on the Rails
  # before_action [TOP OF THIS PAGE].
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit

  # The edit action displays a form for editing an existing post. This form
  # uses the set_post method [BOTTOM OF THIS PAGE].
  def edit
  end

  # POST /posts
  # POST /posts.json

  # The create method is responsible for creating a post using the params from
  # the new post form.
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json

  # The update method is similiar to the create method but it checks the
  # return value of @post.update instead of @post.save.
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json

  # The destroy method destroys the post and redirects user back to the index page.
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # The set_post method calls the post.find method to retrieve the post with
    # an id corresponding to a parameter passed to the controller.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :author, :body)
    end
end
