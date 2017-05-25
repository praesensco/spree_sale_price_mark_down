module Spree
  module Admin
    class MarkDownsController < Spree::Admin::ResourceController
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
      before_action :split_taxon_parameters, only: [:create, :update]
      before_action :load_products_affected, only: [:edit]

      def apply
        @mark_down = Spree::MarkDown.find(params[:mark_down_id])
        begin
          @mark_down.apply
          flash[:success] = "Success"
        rescue => error
          flash[:error] = "Error: #{error.message}"
        end

        redirect_to edit_admin_mark_down_path(@mark_down)
      end

      private

      def load_products_affected
        mark_down = Spree::MarkDown.find(params[:id])
        @products_affected = mark_down.products_affected
      end

      def split_taxon_parameters
        if params[:mark_down][:taxon_ids].present?
          params[:mark_down][:taxon_ids] = params[:mark_down][:taxon_ids].split(',')
        end
        if params[:mark_down][:skip_taxon_ids].present?
          params[:mark_down][:skip_taxon_ids] = params[:mark_down][:skip_taxon_ids].split(',')
        end
      end
    end
  end
end
