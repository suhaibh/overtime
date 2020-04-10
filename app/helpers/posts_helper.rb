module PostsHelper

	def link_to_edit_icon(post)
		link_to edit_post_path(post) do 
			content_tag(:i, "", class: "glyphicon glyphicon-pencil icon icon-edit", id: "edit-post-#{post.id}")  
		end
	end

	def link_to_delete_icon(post)
		link_to post, method: :delete do
			content_tag(:i, "", class: "glyphicon glyphicon-trash icon icon-delete", id: "delete-post-#{post.id}")
		end
	end

end
