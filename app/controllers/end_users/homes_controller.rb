class EndUsers::HomesController < ApplicationController
  def top
    @items = Item.all.limit(4)
    @genres = Genre.all
  end

  def about
  end
end
