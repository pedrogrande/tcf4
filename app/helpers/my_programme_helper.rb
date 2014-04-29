module MyProgrammeHelper
	def programme_credits(programme)
		programme.units.map(&:workshop_credits).sum
	end
end
