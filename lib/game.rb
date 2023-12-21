require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at && (Date.today - Date.parse(@last_played_at)) > 2 * 365
  end

  def to_json(option = {})
    {
      id: @id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      archived: @archived,
      genre: {
        name: @genre.name,
        id: @genre.id
      },
      label: {
        title: @label.title,
        color: @label.color,
        id: @label.id
      },
      author: {
        first_name: @author.first_name,
        last_name: @author.last_name,
        id: @author.id
      }
    }.to_json(option)
  end
end
