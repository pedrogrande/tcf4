class AddContentToEnquiries < ActiveRecord::Migration
  def change
    add_column :enquiries, :content, :text
  end
end
