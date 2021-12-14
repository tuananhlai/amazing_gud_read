class ChangeDataTypeForReviewContent < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :content, :longtext
  end
end
