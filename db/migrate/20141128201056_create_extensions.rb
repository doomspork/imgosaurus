class CreateExtensions < ActiveRecord::Migration
  def up
    execute 'CREATE EXTENSION "uuid-ossp"'
    execute 'CREATE EXTENSION "hstore"'
  end

  def down
    execute 'DROP EXTENSION "hstore"'
    execute 'DROP EXTENSION "uuid-ossp"'
  end
end
