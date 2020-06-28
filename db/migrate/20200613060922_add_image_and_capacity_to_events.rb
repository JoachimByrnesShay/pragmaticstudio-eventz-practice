class AddImageAndCapacityToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :image_file_name, :string, default: "placeholder.png"
    add_column :events, :capacity, :Integer, default: 1
  end

#   private
#   def img_file_name_replace
# 		name.downcase.gsub(' ', '-')
#   end

#   def image_exists(image_name)
# 	Rails.application.assets.has_asset(image_name)
# end
#   def image_default
# 		image_exists(img_file_name_replace) ? img_file_name_replace : "placeholder.png"
#   end

end
