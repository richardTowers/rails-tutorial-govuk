Rails.application.configure do
  config.action_view.field_error_proc = Proc.new { |html_tag, _instance| html_tag }
end
