require_relative('db/sql_runner')
require_relative('models/team')
require_relative('models/match')

require('pry-byebug')

runner = SqlRunner.new({dbname: 'dodgeball', host: 'localhost'})

team_1 = Team.new({'name' => 'Wessex Wolves Women'}, runner).save
team_2 = Team.new({'name' => 'Meteors Ladies'}, runner).save
team_3 = Team.new({'name' => 'Winchester Bullettes 1'}, runner).save
team_4 = Team.new({'name' => 'Birmingham Lions Ladies 2nds'}, runner).save
team_5 = Team.new({'name' => 'Reepham Raidettes'}, runner).save


match_1 = Match.new({'home_team_id' => team_1.id, 'away_team_id' => team_2.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_2 = Match.new({'home_team_id' => team_1.id, 'away_team_id' => team_3.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_3 = Match.new({'home_team_id' => team_1.id, 'away_team_id' => team_4.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_4 = Match.new({'home_team_id' => team_1.id, 'away_team_id' => team_5.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

match_5 = Match.new({'home_team_id' => team_2.id, 'away_team_id' => team_3.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_6 = Match.new({'home_team_id' => team_2.id, 'away_team_id' => team_4.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_7 = Match.new({'home_team_id' => team_2.id, 'away_team_id' => team_5.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

match_8 = Match.new({'home_team_id' => team_3.id, 'away_team_id' => team_4.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_9 = Match.new({'home_team_id' => team_3.id, 'away_team_id' => team_5.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

match_10 = Match.new({'home_team_id' => team_4.id, 'away_team_id' => team_5.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

match_11 = Match.new({'home_team_id' => team_5.id, 'away_team_id' => team_4.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_12 = Match.new({'home_team_id' => team_5.id, 'away_team_id' => team_3.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_13 = Match.new({'home_team_id' => team_5.id, 'away_team_id' => team_2.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_14 = Match.new({'home_team_id' => team_5.id, 'away_team_id' => team_1.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

match_15 = Match.new({'home_team_id' => team_4.id, 'away_team_id' => team_3.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_16 = Match.new({'home_team_id' => team_4.id, 'away_team_id' => team_2.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_17 = Match.new({'home_team_id' => team_4.id, 'away_team_id' => team_1.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

match_18 = Match.new({'home_team_id' => team_3.id, 'away_team_id' => team_2.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save
match_19 = Match.new({'home_team_id' => team_3.id, 'away_team_id' => team_1.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

match_20 = Match.new({'home_team_id' => team_2.id, 'away_team_id' => team_1.id, 'home_team_score' => 1, 'away_team_score' => 1}, runner).save

binding.pry
nil
