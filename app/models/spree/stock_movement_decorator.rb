module Spree
  StockMovement.class_eval do

    self.whitelisted_ransackable_attributes = %w[created_at quantity total]

    def readonly?
      false
    end

    private

    def update_stock_item_quantity
      return unless self.stock_item.should_track_inventory?
      stock_item.adjust_count_on_hand quantity
      self.update_attributes total: self.stock_item.count_on_hand
    end

  end
end