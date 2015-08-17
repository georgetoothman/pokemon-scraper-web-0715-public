class Pokemon
  attr_accessor :id, :name, :type, :hp

  def initialize(id, name, type, hp, db)
    @id = id
    @name = name
    @type = type
    @hp = hp
  end

  def self.save(name, type, db)
    scraper = Scaper.new(db)
    scaper.insert(name, type)
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon(name, type) VALUES (?, ?);"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    row = db.execute(sql, id)

    p = Pokemon.new(*row.first, db)
  end

  def alter_hp(new_hp)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    @db.execute(sql, new_hp, self.alter_hp)
  end
end