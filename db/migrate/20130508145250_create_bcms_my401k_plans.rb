class CreateBcmsMy401kPlans < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "BcmsMy401k::Plan", :group_name => "BcmsMy401k::Plan")
    create_content_table :bcms_my401k_plans, :prefix=>false do |t|
      t.integer :plan_sponsor_id
      t.string :name

      t.timestamps
    end
  end
end
