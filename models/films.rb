require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end


  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{ @title }', #{ @price }) RETURNING id"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end


  def update()
    sql = "UPDATE films SET (title, price) = ('#{ @title }', #{ @price }) WHERE id = #{ @id };"
    SqlRunner.run(sql)
  end


  def delete()

  end


  def self.all()

  end


  def self.delete_all()

  end


  def self.get_many()
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end



end