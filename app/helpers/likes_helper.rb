module LikesHelper

    def like_or_unlike_button(event, like)
        if !like
            button_to "★ like", event_likes_path(event), method: "post" 
        else
            button_to "★ unlike", event_like_path(event, like), method: "delete" 
        end
                
    end
end
