require_relative './item'
require_relative 'author_class'
require_relative 'source_class'

class Movie < Item
  attr_accessor :title, :silet, :genre, :label, :archived

  def initialize(title, silet, genre, label, publish_date)
    super(publish_date: publish_date)
    @title = title
    @silet = silet
    @genre = genre
    @label = label
    @publish_date = publish_date
  end

  def can_be_archived?
    @silet || @publish_date < Date.today
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def to_h
    {
      title: @title,
      silet: @silet,
      genre: @genre,
      publish_date: @publish_date,
      label: @label
    }
  end
end
