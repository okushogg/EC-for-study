class Admins::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item.id),flash:{notice:'新規商品を登録しました。'}
    else
      render "new"
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path,flash:{notice:'商品を変更しました。'}
    else
      render "edit"
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :image, :price, :is_active)
  end

end
