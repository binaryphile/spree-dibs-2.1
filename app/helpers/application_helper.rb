module ApplicationHelper
  def dibs_referral_body
    product_info = []
    @order.line_items.each do |item|
      product_info << "#{item.variant.sku}  #{raw(item.variant.product.name)}  #{raw(item.variant.options_text)}: #{number_to_currency(item.price * item.quantity)}"
      unless item.ad_hoc_option_values.empty?
        product_info << item.ad_hoc_option_values.map { |pov|
          "#{pov.option_value.option_type.presentation} = #{pov.option_value.presentation}"
        }.join(", ")
      end
    end
    footer = <<eos
Helpful Resources:

Remote Support http://support.diditbetter.com/remote-support.aspx

Troubleshooting http://support.diditbetter.com/Forums/Thread.aspx?pageid=1&mid=2&ItemID=1&thread=125

Upgrading Add2Exchange http://support.diditbetter.com/kb/A2E_194.aspx

How Add2Exchange Works http://support.diditbetter.com/Forums/Thread.aspx?pageid=1&mid=2&ItemID=3&thread=80

Licensing http://support.diditbetter.com/product-activation.aspx
eos
      
    "#{product_info.join("\n")}\n\nClick here to purchase:\n\nhttp://#{Spree::Config[:site_url]}/dibs-referral?dibs_referral=#{URI::encode_www_form_component @order.user.email}&#{@order.dibs_referral_line_items.to_param}\n\n#{footer}"
  end
end
