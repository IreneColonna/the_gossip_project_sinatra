require 'pry'
require 'csv'

class Gossip
	attr_accessor :author, :content


	def initialize(author, content)
		@author = author
		@content = content
	end 

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
		end
	end

	def self.all
		all_gossips = []
		CSV.foreach("./db/gossip.csv") do |csv_line|
			gossip_temp = Gossip.new(csv_line[0], csv_line[1])
			all_gossips << gossip_temp
		end
		all_gossips
	end	

	def self.find(id)
		Gossip.all[id - 1]
	end

end


