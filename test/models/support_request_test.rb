require 'test_helper'

class SupportRequestTest < ActiveSupport::TestCase
  fixtures :support_requests

  test "if support request associates sent before the purchase(order) " do    
    order = Order.create(
      name: "john test",
      adress: "rua do john",
      email: "john@teste.com",
      pay_type: 0
    )

    support_request = SupportRequest.where(email: "john@teste.com").first
    
    assert_equal order, support_request.order
  end
end
