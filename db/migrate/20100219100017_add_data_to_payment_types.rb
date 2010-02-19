class AddDataToPaymentTypes < ActiveRecord::Migration
  def self.up

    PaymentType.delete_all

    PaymentType.create(:name => 'Check', :short_name => 'check')
    PaymentType.create(:name => 'Credit Card', :short_name => 'cc')
    PaymentType.create(:name => 'Purchase Order', :short_name => 'po')

  end

  def self.down
    PaymentType.delete_all
  end
end
