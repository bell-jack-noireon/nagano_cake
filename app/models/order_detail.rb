class OrderDetail < ApplicationRecord
  enum production_status: { unable_to_start: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }
end