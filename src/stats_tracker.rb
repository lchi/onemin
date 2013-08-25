module OneMin
  class StatsTracker

    def initialize
      @asked, @correct = 0, 0
    end

    def incr_asked(n = 1)
      @asked += n
    end

    def incr_correct(n = 1)
      @correct += n
    end

    def questions_per_second(time_elapsed)
      (@asked/time_elapsed).to_f
    end

    def to_s
      "#{@correct}/#{@asked} correct, #{(@correct/@asked).to_f / 100}%"
    end

  end
end
