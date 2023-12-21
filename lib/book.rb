class Book < Item
  attr_accessor :publisher, :cover_state, :item_id

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    JSON.pretty_generate(
      {
        JSON.create_id => self.class.name,
        id: @id,
        publish_date: @publish_date,
        archived: @archived,
        publisher: @publisher,
        cover_state: @cover_state,
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
      }
    )
  end
end
