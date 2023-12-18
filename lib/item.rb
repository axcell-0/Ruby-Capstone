class Item
  attr_accessor :gener, :author, :source, :label
  attr_reader :id, :publish_date, :archived

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def save_genre(genre)
    @genre = genre
  end

  def save_author(author)
    @author = author
  end
end
