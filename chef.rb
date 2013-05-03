require_relative 'chefs_database'
require_relative 'model'

class Chef
	attr_accessor :id, :first_name, :last_name, :mentor

	extend Model 

	def initialize(options = {})
		@id = options['id']
		@first_name = options['first_name']
		@last_name = options['last_name']
		@mentor = options['mentor']
	end

	def self.find_by_id(id)
		query = <<-SQL
			SELECT *
				FROM chefs
			 WHERE chefs.id = :id
		SQL

		query_args = {
			:id => id
		}

		factory(self, query, query_args)
	end


end