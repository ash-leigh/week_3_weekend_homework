require( 'pg' )
require_relative('../db/sql_runner')
require_relative('team')

class Match

  attr_reader :id, :home_team_id, :away_team_id, :home_team_score, :away_team_score

  def initialize(options, runner)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES ('#{home_team_id}', '#{away_team_id}', '#{home_team_score}', '#{away_team_score}') RETURNING *"
    return Match.map_item(sql, @runner)
  end

  def teams()
    sql = "SELECT teams.* FROM teams INNER JOIN matches ON matches.home_team_id = teams.id OR matches.away_team_id = teams.id WHERE teams.id = #{home_team_id} OR teams.id = #{away_team_id}"
    return Team.map_items(sql, @runner)
  end

  def home_team()
    sql = "SELECT teams.* FROM teams INNER JOIN matches ON matches.home_team_id = teams.id WHERE teams.id = #{home_team_id}"
    return Team.map_item(sql, @runner)
  end

  def away_team()
    sql = "SELECT teams.* FROM teams INNER JOIN matches ON matches.away_team_id = teams.id WHERE teams.id = #{away_team_id}"
    return Team.map_item(sql, @runner)
  end

  def update_score (options)
    if (options['home_team_score'])
      @home_team_score = options['home_team_score']
    end
    if (options['away_team_score'])
      @away_team_score = options['away_team_score'].to_i
    end
    id = options['id'].to_i
    sql = "UPDATE matches SET home_team_score = '#{@home_team_score}', away_team_score = #{@away_team_score}
      WHERE id = #{@id}"
    @runner.run(sql)
  end

  # def home_team_score()
  #   sql = "SELECT * FROM matches"
  #   score = Match.map_item(sql, @runner)
  #   return score.home_team_score
  # end

  def home_team_score()
    sql = "SELECT * FROM matches WHERE id = #{id}"
    score = Match.map_item(sql, @runner)
    return score.home_team_score
  end

  # def winning_team()
  # end 

  # SELECT name FROM teams INNER JOIN matches ON matches.home_team_id = teams.id WHERE matches.home_team_score > matches.away_team_score

  def self.all(runner)
    sql = "SELECT * FROM matches"
    return Match.map_items(sql, runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM matches"
    runner.run(sql)
  end

  def self.map_items(sql, runner)
    matches = runner.run(sql)
    result = matches.map {|match| Match.new(match, runner)}
    return result
  end

  def self.map_item(sql, runner)
    result = Match.map_items(sql, runner)
    return result.first
  end

end