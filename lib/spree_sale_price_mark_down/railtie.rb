require 'spree_sale_price_mark_down/markdown_helper'

module SpreeSalePriceMarkDown
  class Railtie < Rails::Railtie
    initializer "spree_sale_price_mark_down.markdown_helper" do
      ActionView::Base.send :include, MarkdownHelper
    end
  end
end
