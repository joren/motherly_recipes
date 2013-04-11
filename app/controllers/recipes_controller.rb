class RecipesController < ApplicationController
  autocomplete :ingredient, :name

  # GET /recipes
  # GET /recipes.json

  def index
    @recipes_filtered = Recipe.where("origin LIKE '%#{params[:q]}%' OR name LIKE '%#{params[:q]}%' OR description LIKE '%#{params[:q]}%' OR preparation LIKE '%#{params[:q]}%'").limit(10).order('name')
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 8, :order => 'id DESC')
    @types = Type.all

    if !params[:search].blank?
      @recipes = Recipe.where("origin LIKE '%#{params[:search]}%' OR name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%' OR preparation LIKE '%#{params[:search]}%'").limit(10).order('name').paginate(:page => params[:page], :per_page => 8, :order => 'id DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json{ render json: @recipes_filtered.to_json}
    end
  end

  def show_category
    @types = Type.all
    type = Type.find_by_name(params[:type].gsub('-','/'))
    @recipes = Recipe.where(type_id: type.id).paginate(:page => params[:page], :per_page => 8, :order => 'id DESC')
  end

  def ingredients
    @ingredients = Ingredient.where('name LIKE ?', "%#{params[:term]}%").limit(20).order('name').uniq_by { |obj| obj.name }
    respond_to do |format|
      format.json
    end
  end

  # GET /recipten
  # GET /recipten.json
  def list
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 10, :order => 'id DESC').where(user_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    redirect_if_invalid_user
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Het recept werd aangemaakt.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    redirect_if_invalid_user

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Het recept werd aangepast.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    redirect_if_invalid_user
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  def edit_all
    @recipes = Recipe.all
    @people = User.all
  end

  def update_all
    params['recipe'].keys.each do |id|
      @recipe = Recipe.find(id.to_i)
      @recipe.update_attributes(params['recipe'][id])
    end
    redirect_to(recipes_url)
  end

  def redirect_if_invalid_user
    if @recipe.user_id != current_user.id
      redirect_to @recipe, alert: "Jij mag dit recept niet aanpassen."
    end
  end
end
