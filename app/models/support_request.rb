class SupportRequest < ApplicationRecord
    belongs_to :order, optional: true    
    has_rich_text :response

    after_find { check_and_update_if_exists_orders unless self.order }

    private

    def check_and_update_if_exists_orders
        last_order = Order.where(email: self.email).order(create_at: :desc).first
        
        self.update(order: last_order) if last_order
    end
end
