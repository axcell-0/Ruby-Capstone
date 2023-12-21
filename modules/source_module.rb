require './lib/source'
require 'fileutils'
module SourceModule
  SOURCE_PATH = './data/source.json'.freeze
  def check_source_file
    return if File.exist?(SOURCE_PATH)

    FileUtils.touch(SOURCE_PATH)
  end

  def write_source_to_file(source)
    check_source_file
    file = File.read(SOURCE_PATH)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(source.to_json))
    File.write(SOURCE_PATH, JSON.pretty_generate(data))
  end

  def create_source
    print 'Source Name:'
    name = gets.chomp
    source = Source.new(name)
    write_source_to_file(source)
    source
  end

  def show_all_sources
    puts 'No Sources have been added yet' if File.empty?(SOURCE_PATH) || !File.exist?(SOURCE_PATH)
    data = JSON.parse(File.read(SOURCE_PATH))
    puts 'Sources:'
    data.each do |source|
      puts "  ID: #{source['id']}, Name: #{source['name']}"
    end
  end
end
