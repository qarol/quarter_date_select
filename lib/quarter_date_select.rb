module ActionView
  module Helpers
    module Tags
      class QuarterDateSelect < DateSelect; end
    end

    module DateHelper
      def quarter_date_select(object_name, method, options = {}, html_options = {})
        Tags::QuarterDateSelect.new(object_name, method, self, options, html_options).render
      end

      def select_quarter(date, options = {}, html_options = {})
        DateTimeSelector.new(date, options, html_options).select_quarter
      end
    end

    class DateTimeSelector
      def select_quarterdate
        @options[:discard_hour]     = true
        @options[:discard_minute]   = true
        @options[:discard_second]   = true

        @options[:discard_year]     = false
        @options[:discard_month]    = false
        @options[:discard_day]      = true

        set_day_if_discarded

        build_selects_from_types([:day, :quarter, :year])
      end

      def select_quarter
        puts @datetime.inspect
        quarter_options = []
        (1..12).step(3) do |month_number|
          options = {value: month_number}
          options[:selected] = 'selected' if month == month_number
          quarter_options << content_tag(:option, quarter_name(month_number), options) + "\n"
        end
        build_select(:month, quarter_options.join)
      end

      private

      def quarter_name(month_number)
        quarter_names = I18n.translate(:'date.quarter_names', locale: @options[:locale], default: [[nil, 'Q1', 'Q2', 'Q3', 'Q4']])
        quarter_names[month_number / 3 + 1]
      end
    end

    class FormBuilder
      def quarter_date_select(method, options = {}, html_options = {})
        @template.quarter_date_select(@object_name, method, objectify_options(options), html_options)
      end
    end
  end
end
