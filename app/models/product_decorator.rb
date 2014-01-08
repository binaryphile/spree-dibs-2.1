Spree::Product.class_eval do
  add_simple_scopes [:ascend_by_available_on]
end
