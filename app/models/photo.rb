class Photo < ApplicationRecord

	belongs_to :classified, inverse_of: :photos 



	has_attached_file 	:image, 
						:path => ":rails_root/public/images/:id/:filename", #CW branch
					    :url  => "/images/:id/:filename"  #CW branch
						#:styles => { :large => "600x170", :medium => "250x250!",:thumb => "100x100>" },
						#:default_url => ActionController::Base.helpers.asset_path("/images/missing.png")
						#:default_url => lambda { |photo| photo.instance.set_default_url}



	
	#validates_attachment_content_type 	:image, 
										#:content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	#validates_presence_of :classified
	
	#validates_attachment_presence :image

	do_not_validate_attachment_file_type :image # CW branch

	
end
