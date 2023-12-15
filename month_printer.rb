class MonthPrinter
  DAYS_NAMES = %w[
    Mo
    Tu
    We
    Th
    Fr
    Sa
    Su
  ].freeze

  def initialize(month)
    @month = month
  end

  def call
    puts "#{month.name} #{month.year}".center(20)
    puts DAYS_NAMES.join(' ')
    month.days_in_week.each do |days|
      puts days.map { |day| day.to_s.rjust(2) }.join(' ')
    end
  end

  private

  attr_reader :month

  def cal_row_size
    DAYS_NAMES.join(' ').chars.count
  end
end
