#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
class CreateTableTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets, :primary_key => :number do |t|
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
