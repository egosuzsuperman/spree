class CreateSubscribe < ActiveRecord::Migration
     def self.up
      create_table :subscribe do |t|
        t.references :product
        t.references :users
      end
    end

    def self.down
      drop_table :subscribe
    end
end
