module ErrorMessagesHelper

  def get_errors(object, field)
    object.errors[field]
  end

  def has_errors?(object, field)
    get_errors(object, field).length > 0
  end

  def errors_for_field(object, field)
    errors = get_errors(object, field)
    content_tag(:span, class: "help-inline") do
      errors.join(', ')
    end
  end

  def bootstrap_field_for(object, field, type)
    classes = "clearfix"
    classes += " error" if has_errors?(object, field)
    content_tag(:div, class: classes) do
      html = label(object.class.to_s, field)
      html += content_tag(:div, class: "input") do
        self.send(type, object.class.to_s, field) + errors_for_field(object, field)
      end

      html
    end
  end

  module FormBuilderAdditions

    def has_errors?(field)
      @template.has_errors?(@object, field)
    end

    def errors_for(field)
      @template.errors_for_field(@object, field)
    end

    def bootstrap_field(field, type)
      @template.bootstrap_field_for(@object, field, type)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)