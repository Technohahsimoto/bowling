class Bowling
    def initialize
        @total_score = 0
        
        @scores = [] #
        
        @frame_pins = [] #add_scoreされる度に１フレーム分のデータができる
    end
    
    def add_score(pins)
        #@score = pins
        @frame_pins << pins
        
        if @frame_pins.size == 2
            @scores << @frame_pins
            @frame_pins = []
        end
    end
    
    def total_score
      @total_score
    end
    
    def calc_score
        @scores.each.with_index do |score, i|
             if spare?(score)  && not_last_frame?(i)
                 @total_score += 10 + calc_spare_bounus(i)
             else
                 @total_score += score.inject(:+)
             end
        end
    end
    
    private
    def spare?(score)
        score.inject(:+) == 10
    end
    
    def not_last_frame?(index)
        index < 9
    end
    
    def calc_spare_bounus(index)
    @scores[index + 1].first
    end
    
end
