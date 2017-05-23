module Spree
  module Admin
    class MarkDownsController < Spree::Admin::ResourceController
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
      before_action :split_taxon_parameters, only: [:create, :update]

      private

      def split_taxon_parameters
        if params[:mark_down][:taxon_ids].present?
          params[:mark_down][:taxon_ids] = params[:mark_down][:taxon_ids].split(',')
        end
      end
    end
  end
end
