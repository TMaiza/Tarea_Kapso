require 'net/http'
require 'json'
require 'uri'

class ExerciseSearchService
  BASE_URL = 'https://wger.de/api/v2/exercise'

  def self.search(query)
    uri = URI("#{BASE_URL}/?name=#{query}")
    response = Net::HTTP.get(uri)
    exercises = JSON.parse(response)['results']
    exercises
  end
end
