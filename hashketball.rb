require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  points_scored = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            points_scored = data_item[:points]
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(player_name)
  shoe_size = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            shoe_size = data_item[:shoe]
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  team_colors = nil
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_colors = team_data[:colors]
    end
  end
  team_colors
end

def team_names
  game_hash.each_with_object([]) do |(location, team_data), team_names_array|
    team_names_array << team_data[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.each_with_object([]) do |(location, team_data), player_numbers_array|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            player_numbers_array << data_item[:number]
          end
        end
      end
    end
  end
end

def player_stats(player_name)
  player_stat_hash = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            data_item.each_with_object({}) do |(stat_name, value), hash|
              hash[stat_name] = value
              player_stat_hash = hash
            end
          end
        end
      end
    end
  end
  player_stat_hash
end

# Return the rebounds for the player who has the biggest shoe size
def big_shoe_rebounds
  biggest_shoe_size = 0
  rebounds_bs_player = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          data_item.each do |stat, shoe_size|
            if stat == :shoe && shoe_size > biggest_shoe_size
              biggest_shoe_size = shoe_size
              rebounds_bs_player = data_item[:rebounds]
            end
          end
        end
      end
    end
  end
  rebounds_bs_player
end
