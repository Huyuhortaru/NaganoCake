class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def index
    @item = Item.new
    @items = Item.all
  end
  
  def create
    @item = Item.new(item_params) 
    @items = Item.all
    
    if @item.save
      redirect_to "/admin/items"
    else
      render :new
    end
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end
  
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre, :is_activ, :image)
  end
  
end
