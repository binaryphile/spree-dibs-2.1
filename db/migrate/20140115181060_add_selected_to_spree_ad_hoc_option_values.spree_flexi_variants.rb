# This migration comes from spree_flexi_variants (originally 20121114010125)
class AddSelectedToSpreeAdHocOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_ad_hoc_option_values, :selected, :boolean
  end
end
