#Create a bookshelf using sqlite database

#input: map id and characters id's
#output: characters with most frequent wins
#steps:
  # create SQLite3 database
  # create 3 tables with books, authors, publishers
  # Initialize method to create database and tables
  # create a method to log the wins into a table
  # create a method that returns the combo with the most wins according to the map input
  # create a method that prints the data


require 'sqlite3'
#
# create SQLite3 database
#
def inititalize_database
  include CharacterData

  db = SQLite3::Database.new("bookshelf.db")
  db.results_as_hash = true

  # create a tables with publishers, authors, and books
  publishers_table = <<-SQL
    CREATE TABLE IF NOT EXISTS publishers (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255)
    );
  SQL

  authors_table = <<-SQL
    CREATE TABLE IF NOT EXISTS authors (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255)
    );
  SQL

  books_table = <<-SQL
    CREATE TABLE IF NOT EXISTS books (
      id INTEGER PRIMARY KEY,
      title VARCHAR(255),
      author_id INTEGER,
      publisher_id INTEGER,
      FOREIGN KEY (author_id) REFERENCES authors(id),
      FOREIGN KEY (pubisher_id) REFERENCES publishers(id)
    );
  SQL

  #
  # create the tables if needed
  #
  db.execute(publishers_table)
  db.execute(authors_table)
  db.execute(books_table)


  #
  # seed with data if needed
  #
  rows = db.execute("SELECT * FROM books")

  p rows

  __END__

  if rows.length == 0

    # maps is included in the data module
    maps.each do |map|
     db.execute("INSERT INTO maps (name) VALUES (?) ", map)
    end
  end

  rows2 = db.execute("SELECT * FROM characters")
  if rows2.length == 0

    # characeters is included in the data module
    characters.each do |char|
     db.execute("INSERT INTO characters (name) VALUES (?) ", char)
    end
  end

  db
end

#
# create a method that will allow the user to input information into the table
#
def print_info(db, table_name)
  rows = db.execute("select id, name from #{table_name}")

  rows.each do |row|
    puts "#{row[0]} \t #{row[1]}"
  end
end

def log_win(db)
  print_info(db, 'maps')

  puts "Map number please: "
  map = gets.chomp

  print_info(db, 'characters')

  puts "First character: "
  player_1 = gets.chomp

  puts "Second character: "
  player_2 = gets.chomp

  db.execute("INSERT INTO games_won (map_id, player_1_id, player_2_id) VALUES (?, ?, ?) ", [map,player_1,player_2])
end

#
# create a method that returns the map with the most wins
#
def best_combo(db)
  # pseudocode
  #
  # search through the heroes_info according to the user input for map
  # find the player_1 and player_2 combo that appears most frequent and return that
  print_info(db, 'maps')
  puts "Map number please: "
  map_id = gets.chomp

  rows = db.execute( "
    SELECT c1.name, c2.name FROM games_won g
    JOIN characters c1 ON c1.id = g.player_1_id
    JOIN characters c2 ON c2.id = g.player_2_id
    WHERE g.map_id=(?)",[map_id])

  wins = rows.inject(Hash.new(0)){ |h, v| h[v] += 1; h }
  best_combo = rows.max_by {|v| wins[v] }

  if best_combo.nil?
    puts "No games have been logged for this map :("
  else
    puts "Player one should be: #{best_combo[0]} and Player two should be: #{best_combo[1]}"
  end
end

#
# driver code
#
db = inititalize_database
user_input = nil

until user_input == "done"

  puts "Welcome to the program that can calculate the best combo of heroes for the map of your choosing based on your wins.
  To log your wins, please enter 'log', to see the best possible combo for a map type 'combo', otherwise type 'done'."

  user_input = gets.chomp

  if user_input == 'log'
    log_win(db)
  elsif user_input == 'combo'
    best_combo(db)
  end
end
