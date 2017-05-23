module Spree
  class MarkDown < ActiveRecord::Base
    has_and_belongs_to_many :taxons
    has_and_belongs_to_many :skip_taxons, class_name: 'Spree::Taxon'
  end
end
