class Club


  attr_accessor :id, :title, :body

  # Use clubgres to connect to a database
  def self.open_connection
    conn = PG.connect(dbname: "blog")
  end

  def self.all
    conn = self.open_connection

    sql ="SELECT * FROM club ORDER BY id"

    results = conn.exec(sql)

    clubs = results.map do |tuple|
      self.hydrate(tuple)
    end

    return clubs
  end

  def self.hydrate(club_data)
    club = Club.new

    club.id = club_data['id']
    club.title = club_data['title']
    club.body = club_data['body']

    return club
  end

  def self.find(id)
    conn = self.open_connection

    sql ="SELECT * FROM club WHERE id = #{id}"

    results = conn.exec(sql)

    club = self.hydrate(results[0])

    return club
  end

  def save
    conn = Club.open_connection

    if !self.id
      sql = "INSERT INTO club(title, body) VALUES('#{self.title}', '#{self.body}')"
    else
      sql = "UPDATE club SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
    end

    conn.exec(sql)
  end

  def self.destroy(id)
    conn = self.open_connection

    sql = "DELETE FROM club WHERE id = #{id}"

    conn.exec(sql)
  end


end
