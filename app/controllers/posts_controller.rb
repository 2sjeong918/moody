class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if(params[:mood4]) 
     @posts = Post.where('mood1 LIKE ? AND mood2 LIKE ? AND mood3 LIKE ? AND mood4 LIKE ? AND mood5 LIKE ? AND mood6 LIKE ? AND mood7 LIKE ? AND mood8 LIKE ? AND mood9 LIKE ? AND mood10 LIKE ? AND mood11 LIKE ? AND mood12 LIKE ?', '%'+params[:mood1]+'%', '%'+params[:mood2]+'%', '%'+params[:mood3]+'%', '%'+params[:mood4]+'%', '%'+params[:mood5]+'%', '%'+params[:mood6]+'%', '%'+params[:mood7]+'%', '%'+params[:mood8]+'%', '%'+params[:mood9]+'%', '%'+params[:mood10]+'%', '%'+params[:mood11]+'%', '%'+params[:mood12]+'%').all
     #SELECT postid, postimg
     #FROM post
    else 
       @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @loves_count = Love.where(post_id: @post.id).count
  end

  # GET /posts/new
  def new
    @post = Post.new
    
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id=params[:post][:user_id]
    @post.save
    

    
    @point = ['0', '0', '0', '0', '0']
    
    for i in 0..4
        @point[i] = Point.new
    end
   
  
    for i in 0..4
      @latitude = "latitude" + i.to_s
      @longitude = "longitude" + i.to_s
      @point_title = "point_title" + i.to_s
      @content = "content" + i.to_s
      @cardimg = "cardimg" + i.to_s
      
      if(@longitude)
        
         @point[i].latitude = params[:post][@latitude]
         @point[i].longitude = params[:post][@longitude]
         @point[i].point_title = params[:post][@point_title]
         @point[i].content = params[:post][@content]
         @point[i].cardimg = params[:post][@cardimg]
         @point[i].post_id = @post.id
         @point[i].save
      
      else
        
      end
      
    end

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
  def destroy
    @loves = Love.where(post_id: @post.id)
    @loves.each do |love|
      love.destroy
    end  
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id ])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :posst, :title, :postimg, :mood1, :mood2, :mood3, :mood4, :mood5, :mood6, :mood7, :mood8, :mood9, :mood10, :mood11, :mood12, :latitude, :longitude, :point_title, :content, :cardimg)
    end
  end
