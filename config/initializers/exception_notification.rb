if Rails.env.production?
  Rails.application.config.middleware.use ExceptionNotification::Rack,
  slack: {
    webhook_url: ENV['SLACK_NOTIFY_URL'],
    channel: '#clinic-wizard',
    additional_parameters: {
      mrkdwn: true
    }
  }
end