module ApplicationHelper
  def flash_message
    alert_types = {
      notice: :success,
      alert: :danger,
      warning: :warning
    }
    x_attrs = {
      class: 'close',
      'data-dismiss' => 'alert',
      'aria-label' => 'Close'
    }
    x = content_tag :button, '×', x_attrs
    alerts = flash.map do |key, value|
      type = alert_types.fetch(key.to_sym) { key.to_s }
      content = x + value
      klass = "alert alert-#{type} alert-dismissible fade show"
      content_tag :div, content, class: klass, role: 'alert'
    end
    alerts.join('\n').html_safe
  end
end
