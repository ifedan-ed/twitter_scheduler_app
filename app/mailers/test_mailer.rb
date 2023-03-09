class TestMailer < ApplicationMailer
  default from: "dan@danitex.com.ng"

  def hello
    mail(
      subject: "Hello from Postmak",
      to: "test@blackhole.postmarkapp.com",
      from: "dan@danitex.com.ng",
      html_body: "<strong>Hello</strong> dear Postmark user.",
      track_opens: "true",
      message_stream: "outbound",
    )
  end
end
