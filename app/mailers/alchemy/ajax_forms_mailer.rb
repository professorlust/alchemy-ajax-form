module Alchemy
  class AjaxFormsMailer < ApplicationMailer

    layout "alchemy/base_mailer"


    def notify_message(r)
      @rec = r
      mail(from: Alchemy::EMAIL_NOTIFY_FROM ,to: r.emails_recipient, subject: r.notify_subject)do |format|
        format.mjml { render "notify_message", locals: { recipient: @rec} }
      end
    end

    def notify_message_user(r)
      @rec = r
      mail(to: @rec.email, from: Alchemy::EMAIL_NOTIFY_FROM ,subject: @rec.notify_user_subject)do |format|
        format.mjml { render "notify_user_message", locals: { recipient: @rec} }
      end
    end

  end
end

