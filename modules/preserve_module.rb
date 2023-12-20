require_relative '../classes/movie'
require_relative '../classes/source'
require 'json'

module Preserve
  attr_accessor :games, :movies, :author, :source

  def fetch_file(file)
    file_path = "./JSONdata/#{file}.json"
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.write(file_path, '[]') if File.empty?(file_path)
    contents = File.read(file_path)
    JSON.parse(contents)
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json_data = JSON.generate(data, opts)
    File.write("./JSONdata/#{file}.json", json_data)
  end

  def load_movies
    fetch_file('movies').map { |movie| Movie.new(movie['publish_date'], movie['title'], movie['silent']) }
  end

  def load_source
    fetch_file('source').map { |source| Source.new(source['name']) }
  end

end