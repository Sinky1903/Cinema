require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize( options )
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end


  def save()
sql = "INSERT INTO tickets (customer_id, film_id) VALUES (#{@customer_id}, #{@film_id}) RETURNING id"
ticket = SqlRunner.run(sql).first
id = ticket['id'].to_i
  end


  def update()
sql = "UPDATE tickets SET (customer_id, film_id) = (#{@customer_id}, #{@film_id}) WHERE id = #{@id};"
SqlRunner.run(sql)
  end


  def delete()
sql = "DELETE * FROM tickets WHERE id = #{@id}"
  end


  def self.all()
sql = "SELECT * FROM tickets;"
tickets = Ticket.get_many(sql)
return result
  end


  def self.delete_all()
sql = "DELETE FROM tickets;"
SqlRunner.run(sql)
  end


  def self.get_many()
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end


def customers()
sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
customer = SqlRunner.first(sql)
return Customer.new( customer )
end


def films()
sql = "SELECT * FROM films WHERE id = #{@film_id};"
film = SqlRunner.first(sql)
return Film.new( film )
end



end