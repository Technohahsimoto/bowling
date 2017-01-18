class Bowling
    def initialize
        @total_score = 0
        
        @scores = [] #
        
        @frame_pins = [] #add_scoreされる度に１フレーム分のデータができる
    end
    
    def add_score(pins)
        #@score = pins
        @frame_pins << pins
        
        if @frame_pins.size == 2 || @frame_pins.first == 10
            @scores << @frame_pins
            @frame_pins = []
        end
    end
    
    def total_score
      @total_score
    end
    
    def calc_score
        @scores.each.with_index do |score, i|
            #if strike?(score) && not_last_frame?(i)
             #@total_score += 10 + calc_strike_bounus(i)
            #elsif spare?(score) && not_last_frame?(i)
             #@total_score += 10 + calc_spare_bounus(i)
            #else
                #@total_score += score.inject(:+)
            #end
            @total_score += score.inject(:+) + bonus_point(i)
        end
        
        
    end
    
    private
    def spare?(score)
        score.inject(:+) == 10 && !strike?(score)
    end
    
    def strike?(score)
        score.first == 10
    end
    def not_last_frame?(index)
        index < 9
    end
    
    def calc_spare_bonus(index)
        @scores[index + 1].first
    end
    
    def calc_strike_bonus(index)
    if strike?(@scores[index + 1]) && not_last_frame?(index) 
       @scores[index + 1].first + @scores[index + 2]&.first.to_i
     else 
       @scores[index + 1].first + @scores[index + 1].last 
    end 

    end
    
    def bonus_point(index) 
        if strike?(@scores[index]) && not_last_frame?(index) 
           calc_strike_bonus(index) 
        elsif spare?(@scores[index]) && not_last_frame?(index) 
           calc_spare_bonus(index) 
        else 
           0 
        end 
    end 

    
end
