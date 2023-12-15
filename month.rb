require 'date'

require_relative 'month_printer'

class Month
  # name - Month name

  MONTH_NAMES = %w[
    January
    February
    March
    April
    May
    June
    July
    August
    September
    October
    November
    December
  ].freeze

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def print
    MonthPrinter.new(self).call
  end

  # month number in year
  def month_idx
    MONTH_NAMES.index(name) + 1
  end

  def days
    Date.new(current_year, month_idx, -1).day
  end

  def days_in_week
    day_num = 0

    (0...weeks_count).map.with_index do |week_row, week_idx|
      Array.new(7).map.with_index do |day, day_idx|
        next if day_idx < starts_at_day && week_idx == 0
        next if day_num >= days

        day_num += 1
      end
    end
  end

  def weeks_count
    @weeks_count ||= (days / 7.to_f).ceil
  end

  def starts_at_day
    Date.new(current_year, month_idx).wday
  end

  def current_year
    Date.today.year
  end
  alias year current_year
end
