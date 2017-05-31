module Spree
  Variant.class_eval do
    def mark_down
      @mark_down ||= find_mark_down
    end

    def taxon_ids_for_mark_down
      @taxon_ids ||= Spree::Taxon.joins(:classifications).where(spree_products_taxons: { product_id: product_id }).pluck(:id)
    end

    def taxon_ids_for_mark_down_skip
      taxon_ids_for_mark_down
    end

    def find_mark_down(reload = false)
      return nil if @no_mark_down && !reload
      md = Spree::MarkDown
        .joins(:taxons).where("spree_mark_downs_taxons.taxon_id IN (?)", taxon_ids_for_mark_down)
        .joins(:skip_taxons).where.not("spree_mark_downs_skip_taxons.skip_taxon_id IN (?)", taxon_ids_for_mark_down_skip)
        .active
        .first
      @no_mark_down = md.blank?
      md
    end

    def mark_down_sale_price_exists?
      !mark_down_sale_price.nil?
    end

    def mark_down_sale_price
      mark_down.calculate_sale_price(self) unless mark_down.blank?
    end
  end
end
