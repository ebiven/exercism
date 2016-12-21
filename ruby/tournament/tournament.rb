class Tournament
  def self.tally(input)
    @results = Hash.new
    input.split("\n").each { |l|
      team_1_name, team_2_name, result = l.split(";")
      team_1 = get_or_create_team(team_1_name)
      team_2 = get_or_create_team(team_2_name)
      case result
      when "win"
        team_1.add_win
        team_2.add_loss
      when "loss"
        team_1.add_loss
        team_2.add_win
      else
        team_1.add_draw
        team_2.add_draw
      end
    }
    format_results(sort_results)
  end

  private

  def self.get_or_create_team(team_name)
    unless @results.has_key?(team_name)
      t = TeamRecord.new(team_name)
      @results[team_name] = t
    end
    @results[team_name]
  end

  def self.sort_results
    @results.values.sort_by { |i|
      [ -i.points, i.name ]
    }
  end

  def self.format_results(sorted_results)
    output = "Team                           | MP |  W |  D |  L |  P\n"
    sorted_results.each { |r|
      output += "#{r.name.ljust(30)} | #{r.matches_played.to_s.rjust(2)} | #{r.wins.to_s.rjust(2)} | #{r.draws.to_s.rjust(2)} | #{r.losses.to_s.rjust(2)} | #{r.points.to_s.rjust(2)}\n"
    }
    output
  end

  class TeamRecord
    attr_accessor :name, :matches_played, :wins, :draws, :losses

    def initialize(name)
      @name           = name
      @matches_played = 0
      @wins           = 0
      @draws          = 0
      @losses         = 0
    end

    def add_win
      @matches_played += 1
      @wins += 1
    end

    def add_loss
      @matches_played += 1
      @losses += 1
    end

    def add_draw
      @matches_played += 1
      @draws += 1
    end

    def points
      @wins * 3 + @draws
    end
  end
end

module BookKeeping
  VERSION = 1
end
