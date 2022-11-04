class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    # @genre.customer_id = current_costomer.id

    if @genre.save
      redirect_to "/admin/#{@genre.id}"
    else
      render :index
    end
  end
  
  def show
    
  end
  
  def update
    if @genre.update(genre_params)
      redirect_to admin_genre_path(@genre.id)
    else
      @genres = Genre.all
      render "edit"
    end
  end
  
  def destroy
  end


private
def genre_params
  params.require(:genre).permit(:name)
end

end