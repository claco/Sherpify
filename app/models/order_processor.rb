class OrderProcessor
  attr_accessor :rules

  def initialize
    @rules = []
  end

  def process(order)
    result.success = false

    if @rules.length > 0
      @rules.each do |rule|
        if !rule.process(order, result)
          return result
        end
      end

      result.success = true
    end

    return result
  end

  private
    def result
      @result ||= ProcessorResult.new
    end
end
