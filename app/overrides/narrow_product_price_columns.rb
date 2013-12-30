Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                                  :name => 'narrow_product_price_columns',
                                  :set_attributes => '[data-hook="product_price"]',
                                  :attributes => {:class => 'columns four <% if !@product.has_variants? %> alpha <% else %> omega <% end %>'},
                                  :original => '<div data-hook="product_price" class="columns five <% if !@product.has_variants? %> alpha <% else %> omega <% end %>">'
                                  )
