require_relative 'item'
require 'date'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  def to_json
    JSON.pretty_generate(
      {
        JSON.create_id: self.class.name,
        id: @id,
        publish_date: @publish_date,
        archived: @archived,
        on_spotify: @on_spotify,
        genre: {
          @genre.name
        },
        label: {
          title: @label.title,
          color: @label.color
        }
      }
    )
  end
end
