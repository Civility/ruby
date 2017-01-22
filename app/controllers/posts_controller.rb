class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  # добавил условие отображене контента по id условием  private и указали before_action, что будет вставляться этот метод
  def show
    # @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  # также как и в show
  def edit
  end

  # POST /posts
  # POST /posts.json
  # создание нового объекта и передаем в него параметры для этого создан  def post_params
  def create
    @post = Post.new(post_params)
  # обработчик
    respond_to do |format|
  # вывести созданный пост
      if @post.save
        format.html { redirect_to @post, notice: 'Пост был успешно создан.' }
        format.json { render :show, status: :created, location: @post }
  # если не создали, то вернуть на созджание
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Пост был успешно обновлен.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Пост был успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :summary, :body)
    end
end
