module Spree
  class MarkDown < ActiveRecord::Base
    has_and_belongs_to_many :taxons
    has_and_belongs_to_many :skip_taxons,
      association_foreign_key: :skip_taxon_id,
      join_table: :spree_mark_downs_skip_taxons,
      class_name: "Spree::Taxon"

    default_scope { order(created_at: :asc) }
    scope :active, -> { where(active: true) }

    def active?
      active && (start_at.nil? || start_at < Time.zone.now) && (stop_at.nil? || stop_at > Time.zone.now)
    end

    def apply
      begin
        ActiveRecord::Base.transaction do
          apply_to_collection products
          apply_to_collection variants
        end
      rescue => error
        raise error
      end
    end

    def apply_to_collection(collection)
      collection.each do |element|
        sale_price = calculate_sale_price(element)
        element.update(sale_price: sale_price) if sale_price != element.sale_price
      end
    end

    def calculate_sale_price(element)
      return nil unless active?
      if promotion_type == 'percent'
        element.original_price * (1 - amount/100)
      elsif promotion_type == 'amount'
        element.original_price - amount
      end
    end

    def products
      Spree::Product.joins(:classifications)
        .where(spree_products_taxons: { taxon_id: taxon_ids })
        .where.not(spree_products_taxons: { taxon_id: skip_taxon_ids })
    end

    def products_affected
      products
    end

    def variants
      Spree::Variant.where(product: products)
    end
  end
end
