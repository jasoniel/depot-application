require 'test_helper'

class SupportRequestMailerTest < ActionMailer::TestCase
  test "respond" do
    mail = SupportRequestMailer.respond(support_requests(:two))
    assert_equal "Re: teste", mail.subject
    assert_equal ["charles@teste.com"], mail.to
    assert_equal ["support@example.com"], mail.from
  end

end
