class WeekendProgramme < ActiveRecord::Base
  belongs_to :popular_programme
  belongs_to :location
end
