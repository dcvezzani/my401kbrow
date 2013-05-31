class CreateBcmsMy401kContacts < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "BcmsMy401k::Contact", :group_name => "BcmsMy401k::Contact")
    create_content_table :bcms_my401k_contacts, :prefix=>false do |t|
      t.integer :plan_id
      t.string :name
      t.text :address
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
