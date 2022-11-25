class TimeFormat

  attr_reader :correct_format, :incorrect_format

  FORMATS = { 'year' => '%Y', 'month' => '%m', 'day' => '%d',
              'hour' => '%H', 'minute' => '%M', 'second' => '%S'}

  def initialize(params)
    @correct_format = ''
    @incorrect_format = []
    check_format(params['format'].split(','))
  end


  private

  def check_format(params)
    separator = '-'
    params.each do |f|
      if FORMATS[f]
        @correct_format += FORMATS[f]
        @correct_format += separator if f != params.last
      else
        @incorrect_format << f
      end
    end
  end
end
