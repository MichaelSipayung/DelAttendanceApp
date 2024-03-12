# frozen_string_literal: true
# fix the field_with_errors behavior
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end