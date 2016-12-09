class QuestionsController < ApplicationController

  def number
    number = params[:number].to_i
    resource = RestClient.get "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['MOVIE_KEY']}&with_people=287"
    result = JSON.parse(resource.body)
    question = result['results'][number]
    render json: {question: question}
  end

end
