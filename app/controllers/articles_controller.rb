class ArticlesController < ApplicationController
  before_action :set_article, except: %i[ index new create ]
  before_action :set_blog

  # GET /articles or /articles.json
  def index
    @articles = @blog.articles
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params.merge({ blog: @blog, user: current_user }))


    respond_to do |format|
      if @article.save
        format.html { redirect_to blog_article_url(@blog, @article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to blog_article_url(@blog, @article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to blog_articles_path(@blog), notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def publish
    @article.published!
    redirect_to blog_articles_path(@blog)
  end

  def hide
    @article.hidden!
    redirect_to blog_articles_path(@blog)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
