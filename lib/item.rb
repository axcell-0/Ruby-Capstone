require 'date'
class Item
  attr_reader :genre, :author, :source, :label
  attr_accessor :id, :publish_date, :archived

  def initialize(publish_date, archived:false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def save_genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def save_author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def save_source=(source)
    @source = source
    source.add_item(self) unless source.items.include?(self)
  end

  def save_label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    current_year = Date.today.year
    published_year = Date.parse(@publish_date).year
    difference = current_year - published_year
    return false unless difference > 10

    true
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
