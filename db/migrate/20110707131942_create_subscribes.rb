class CreateSubscribes < ActiveRecord::Migration
 def self.up
      create_table :subscribes do |t|
        t.references :product
        t.references :users
      end
    end

    def self.down
      drop_table :subscribes
    end
end
