class Api::ArticlesController < ApplicationController

  def index
    @item = Item.where('title Like(?)', '%a%').order('id desc').limit(10)

  end
end
