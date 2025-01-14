module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: %i[edit update destroy]

    # GET /posts
    def index
      @posts = current_author.posts.all
    end

    # GET /posts/new
    def new
      @post = current_author.posts.build
    end

    # GET /posts/1/edit
    def edit; end

    # POST /posts
    def create
      @post = current_author.posts.build(post_params)

      if @post.save
        redirect_to edit_post_path(@post), notice: 'Post was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to edit_post_path(@post), notice: 'Post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_author.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :header_image)
    end
  end
end
