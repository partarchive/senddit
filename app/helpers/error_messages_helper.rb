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

  module FormBuilderAdditions

    def has_errors?(field)
      @template.has_errors?(@object, field)
    end

    def errors_for(field)
      @template.errors_for_field(@object, field)
    end

  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
