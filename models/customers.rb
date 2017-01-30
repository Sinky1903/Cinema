require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end


  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', #{ @funds }) RETURNING id"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end


  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{ @name }', #{ @funds }) WHERE id = #{ @id }"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE * FROM customers WHERE id = #{@id}"
  end


  def self.all()
    sql = "SELECT * FROM customers"
    customers = Customer.get_many(sql)
    return result
  end


  def self.delete_all()
sql = "DELETE FROM customers"
SqlRunner.run(sql)
  end


  def self.get_many(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end


def films()
sql = "SELECT films.* from films INNER JOIN customers ON tickets.film_id = films.id WHERE tickets.film_id = #{@id};"
return Film.get_many(sql)
end


end