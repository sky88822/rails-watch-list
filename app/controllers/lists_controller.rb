class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/:id
  def show
    @bookmarks = @list.bookmarks
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # GET /lists/:id/edit
  def edit
  end

  # PATCH/PUT /lists/:id
  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/:id
  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private

  # Set the list for show, edit, update, destroy actions
  def set_list
    @list = List.find(params[:id])
  end

  # Strong parameters for creating/updating lists
  def list_params
    params.require(:list).permit(:name)
  end
end
