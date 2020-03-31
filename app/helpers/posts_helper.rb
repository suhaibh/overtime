module PostsHelper
	def status_label(status)
		status_span_generator(status)
	end

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

	private
		
		def status_span_generator(status)
			case status
			when 'submitted'
				content_tag(:span, status.upcase, class: 'label label-primary')
			when 'approved'
				content_tag(:span, status.upcase, class: 'label label-success')
			when 'rejected'
				content_tag(:span, status.upcase, class: 'label label-danger')
			end
		end

end
