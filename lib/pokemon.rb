class Pokemon
  
  attr_accessor :name, :type, :db, :id, :hp

  
  def initialize (pokemon)

    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
    
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find (id, db)
    # The find method creates a new Pokemon after selecting their row from the database by their id number.
    
    poke_name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten[0]
    poke_type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten[0]
    poke_hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten[0]
    
    self.new(id: id, name: poke_name, type: poke_type, db: db, hp: poke_hp)
      
  end
  
  def alter_hp (hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end
  
end
