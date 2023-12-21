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

  def to_json(*_args)
    JSON.pretty_generate(
      {
        JSON.create_id => self.class.name,
        id: @id,
        publish_date: @publish_date,
        archived: @archived,
        on_spotify: @on_spotify,
        genre: {
          name: @genre.name,
          id: @genre.id
<<<<<<< HEAD
        }
        # label: {
        #   title: @label.title,
        #   color: @label.color,
        #   id: @label.id
        # },
        # author: {
        #   first_name: @author.first_name,
        #   last_name: @author.last_name,
        #   id: @author.id
        # }
=======
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
>>>>>>> b7e3f65b95ebd7c6567d67ec9e95de3c0c67683f
      }
    )
  end
end
