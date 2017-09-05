class Pokemon

  attr_accessor :name, :type, :id, :db

  def initialize(my_hash)
    @name = my_hash[:name]
    @type = my_hash[:type]
    @db = my_hash[:db]
    @id = my_hash[:id]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE pokemon.id = ?
    SQL

    poke = db.execute(sql, id)
    Pokemon.new({id: poke[0][0], name: poke[0][1], type: poke[0][2], db: db})

  end

end
