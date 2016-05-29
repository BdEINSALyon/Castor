require 'test_helper'

class VoterMailerTest < ActionMailer::TestCase
  test "vote_email" do
    mail = VoterMailer.vote_email
    assert_equal "Vote email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
