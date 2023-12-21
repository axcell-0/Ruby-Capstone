require_relative 'item'

class Movie < Item
  attr_accessor :silent
  attr_reader :publish_date, :title

  def initialize(publish_date, title, silent)
    super(publish_date)
    @silent = silent
    @title = title
  end

  def can_be_archived?
    @silent || super
  end

  def to_json(*_args)
    JSON.pretty_generate(
      {
        JSON.create_id => self.class.name,
        id: @id,
        title: @title,
        publish_date: @publish_date,
        archived: @archived,
        silent: @silent,
        genre: {
          name: @genre.name,
          id: @genre.id
        },
        label: {
          title: @label.title,
          color: @label.color,
          id: @label.id
        },
        source: {
          name: @source.name,
          id: @source.id
        }
      }
    )
  end
end
