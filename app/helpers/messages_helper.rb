


module MessagesHelper

	def recipients_options
    s = ''
	    User.all.each do |user|
	      s << "<option value='#{user.id}'>#{user.id}</option>"
	    end
    s.html_safe
	end


=begin
 def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' #{'selected' if user == chosen_recipient}>#{user.name}</option>"
    end
    s.html_safe
  end

=end

end
