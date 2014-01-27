class DibsReferralsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :dibs_referral_profile
  def dibs_referral_request
    @user ||= spree_current_user
    referral_role = ::Spree::Role.find_by_name :dibs_referral
    @user.spree_roles << referral_role if !@user.spree_roles.include? referral_role
    redirect_to :account, notice: t(:referral_granted)
  end

  def dibs_referral_profile
    user = spree_current_user
    if not user
      redirect_to('http://sales.diditbetter.com/not-logged-in/')
      return
    end
    user.dibs_referral_profile ||= Spree::DibsReferralProfile.new
    user.dibs_referral_profile.update_attributes!(profile_params)
    redirect_to('http://sales.diditbetter.com/whats-next/')
  end
  private

  def profile_params
    params.require(:profile).permit(:firstname , :lastname          , :company_dba       , :num_emp     ,
    :website                 , :comp_desc         , :fax               , :corp_fax    ,
    :ref_name                , :ref_email         , :sales_name        , :sales_email ,
    :support_name            , :support_email     , :mgr_name          , :mgr_email   , :payee    ,
    :tax_id                  , :biz_type          , :biz_demo          , :authorized  ,
    :raa_agree               , :nda_agree         , :company           , :address1    , :address2 ,
    :phone                   , :city              , :state_name        , :zipcode     , :country  , :corporate_address1 ,
    :corporate_address2      , :corporate_phone   , :corporate_city    ,
    :corporate_state_name    , :corporate_zipcode , :corporate_country)
  end
end
