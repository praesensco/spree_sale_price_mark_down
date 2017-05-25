module Spree
  Variant.class_eval do
    def mark_down
      Spree::MarkDown.find do |mark_down|
        mark_down.variants.include?(self)
      end
    end

    def mark_down_sale_price_exists?
      !mark_down_sale_price.nil?
    end

    def mark_down_sale_price
      mark_down = Spree::MarkDown.find do |mark_down|
        mark_down.variants.include?(self)
      end

      mark_down ? mark_down.calculate_sale_price(self) : nil
    end
  end
end
