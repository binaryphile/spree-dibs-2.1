class CreateDibsReferralProfiles < ActiveRecord::Migration
  def change
    create_table :spree_dibs_referral_profiles do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :company
      t.string :raa_agree
      t.string :nda_agree
      t.string :company_dba
      t.string :num_emp
      t.string :website
      t.string :comp_desc
      t.string :fax
      t.string :corp_fax
      t.string :ref_name
      t.string :ref_email
      t.string :sales_name
      t.string :sales_email
      t.string :support_name
      t.string :support_email
      t.string :mgr_name
      t.string :mgr_email
      t.string :authorized
      t.string :payee
      t.string :tax_id
      t.string :biz_type
      t.string :biz_demo
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :city
      t.string :state_name
      t.string :zipcode
      t.string :country
      t.string :corporate_address1
      t.string :corporate_address2
      t.string :corporate_phone
      t.string :corporate_city
      t.string :corporate_state_name
      t.string :corporate_zipcode
      t.string :corporate_country
      t.timestamps
    end
  end
end
