require 'test_helper'

class SupportRequestTest < ActiveSupport::TestCase
  fixtures :support_requests, :orders

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

  test "if doesn't update if there's a order associated" do    
    order_new = Order.create(
      name: "teste novo",
      adress: "rua do john 2",
      email: "charles@teste.com",
      pay_type: 0
    )

    support_request = SupportRequest.where(email: "charles@teste.com").first
    
    assert_equal "Chris Jones", support_request.order.name
  end
end
