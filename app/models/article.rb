class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true
	before_create :set_visits_count

	def set_visits_count
		self.visits_count = 0
	end

	def update_visits_count
		self.set_visits_count if self.visits_count.nil?
		#if current_user != self.user
			self.update(visits_count: self.visits_count + 1)
		#end
	end

end
