#!/usr/bin/env ruby
# vim:set fileencoding=utf-8:
# calculate begin and end date on separated day of week
# if separated Wednesday, begin is Wednesday, end is Tuesday
#
# command line arguments
#   1: diff of weeks
#     example, -1 is before week, +1 is next week
#
# NOTE : check day of week method (ex: Date#monday?) is supported after 1.9.3

raise "sorry, check day of week method supported after 1.9.3 " if RUBY_VERSION <= "1.9.3"

SeparatorDayOfWeek = :tuesday    # separator day of week (symbol)
DiffWeeks = ARGV[0].to_i || 0

class Time
  TimeOfADay = (24 * 60 * 60)

  class << self # class methods
    def end_of_week_separeted separator_day_of_week
      check_method_name = "#{separator_day_of_week}?"
      unless self.instance_methods(false).include?(check_method_name.to_sym)
        raise "a day of week name is incorrect! : #{separator_day_of_week}"
      end

      week_end = self.now + (DiffWeeks * 7 * TimeOfADay)
      week_end += TimeOfADay
      while !week_end.send(check_method_name)
        week_end += TimeOfADay
      end
      week_end - (TimeOfADay)
    end

    def begin_of_week_separeted separator_day_of_week
      self.end_of_week_separeted(separator_day_of_week) - (6*TimeOfADay)
    end

    def range_string_of_week_separeted separator_day_of_week
      range_string = ""
      range_string += "#{self.begin_of_week_separeted(separator_day_of_week).formatted_string}"
      range_string += "_"
      range_string += "#{self.end_of_week_separeted(separator_day_of_week).formatted_string}"
    end
  end

  # instance_methods
  def formatted_string
    self.strftime("%Y%m%d")
  end
end

puts Time.range_string_of_week_separeted(SeparatorDayOfWeek)
