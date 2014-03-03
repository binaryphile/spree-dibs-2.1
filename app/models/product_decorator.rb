Spree::Product.class_eval do
  add_simple_scopes [:ascend_by_available_on]

  def on_sale?
    Spree::Taxon.find_by(:name => 'ON SALE').products.include? self
  end
end
