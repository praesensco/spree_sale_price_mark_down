class InitSpreeSalePriceMarkDown < ActiveRecord::Migration
  def change
    create_table :spree_mark_downs, force: :cascade do |t|
      t.string   :title
      t.string   :promotion_type, default: 'percent'
      t.decimal  :amount, precision: 10, scale: 2, default: 0
      t.datetime :start_at
      t.datetime :stop_at
      t.boolean  :active, default: false
      t.timestamps
    end

    create_table :spree_mark_downs_taxons, id: false do |t|
      t.belongs_to :mark_down, index: { name: "index_taxons_on_spree_mark_down_id"}
      t.belongs_to :taxon, index: true
    end

    create_table :spree_mark_downs_skip_taxons, id: false do |t|
      t.belongs_to :mark_down, index: { name: "index_skip_taxons_on_spree_mark_down_id"}
      t.belongs_to :taxon, index: true
    end
  end
end
