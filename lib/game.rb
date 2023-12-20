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
      label: @label,
      author: @author,
      genre: @genre
    }.to_json(option)
  end
end
