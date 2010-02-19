class PaymentTypes < ActiveRecord::Migration
  def self.up
    create_table :payment_types do |t|

      t.string :name
      t.string :short_name

    end
  end

  def self.down
    drop_table :payment_types
  end
end
