module EventsHelper
	def price(event)
		if event.free?
			'Free'
		else
			number_to_currency(event.price, precision: 0) 
		end
	end

  def main_image(event)
    if event.main_image.attached?
      image_tag event.main_image.variant(resize_to_limit:[75,75])
     # url_for(event.main_image)
      # /rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--7ed22d57aba240f0c670606d66acc981cce32f51/lion.jpg 
    else 
      image_tag "placeholder.png"
    end
  end
	
	def day_and_time(event)
		event.starts_at.strftime("%B %d at %I:%M %P") 
	end

end
