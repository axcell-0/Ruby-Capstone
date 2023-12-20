require_relative './item'

class Movie < Item
  attr_accessor :silent
  attr_reader :publish_date, :title

  def initialize(publish_date, title, silent)
    super(publish_date)
    @silent = silent
    @publish_date = publish_date
    @title = title
  end

  def can_be_archived?
    @silent || super
  end
end
