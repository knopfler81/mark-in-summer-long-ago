require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "message me" do
    msg = Message.new(
      name: 'cornholio',
      email: 'cornholio@example.com',
      subject: 'Hi',
      content: 'Hello from the internet'
    )

    email = MessageMailer.message_me(msg).deliver_now

    refute ActionMailer::Base.deliveries.empty?

    assert_equal ['knopfler42@gmail.com'], email.to
    assert_equal ['cornholio@example.com'], email.from
    assert_equal 'Hi', email.subject
    assert_equal 'Hello from the internet', email.body.to_s
  end
end