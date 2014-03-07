Spree::Product.class_eval do
  add_simple_scopes [:ascend_by_available_on]

  def on_sale?
    taxon = Spree::Taxon.find_by(:name => 'ON SALE')
    taxon && taxon.products.include?(self)
  end
end
