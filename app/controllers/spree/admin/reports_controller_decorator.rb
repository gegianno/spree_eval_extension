module Spree
  module Admin
    ReportsController.class_eval do

      def initialize
        super 
        ReportsController.add_available_report!(:sales_total)
        ReportsController.add_available_report!(:out_of_stock)
      end

      def out_of_stock
        #@products = Product.joins(:variants_including_master).where('spree_variants.sale_price is not null').uniq
        params[:q] = {} unless params[:q]

        if params[:q][:created_at_gt].blank?
          params[:q][:created_at_gt] = Time.zone.now.beginning_of_month
        else
          params[:q][:created_at_gt] = Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
        end

        if params[:q] && !params[:q][:created_at_lt].blank?
          params[:q][:created_at_lt] = Time.zone.parse(params[:q][:created_at_lt]).end_of_day rescue ""
        end

        params[:q][:quantity_lt] = 0

        params[:q][:total_lteq] = 0

        params[:q][:s] ||= "created_at desc"

        @search = StockMovement.ransack(params[:q])
        @movements = @search.result
      end
    end
  end
end