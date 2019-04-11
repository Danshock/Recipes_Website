class ActiveRecord::Base
	mattr_accessor :shared_connection
	@@shared_connection = nil

	def self.connection
		@@shared_connection || retrive_connection	
	end
end

ActiveRecord::Base.shared_connection=ActiveRecord::Base.connection