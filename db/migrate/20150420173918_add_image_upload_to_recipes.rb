class AddImageUploadToRecipes < ActiveRecord::Migration
  def change
    add_attachment :recipes, :image_upload
  
  end
end
