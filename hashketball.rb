require "pry"

def game_hash
	game = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson" => {
					number: 0,
					shoe: 16,
					points: 22,
					rebounds: 12,
					assists: 12,
					steals: 3,
					blocks: 1,
					slam_dunks: 1
				},
				"Reggie Evans" => {
					number: 30,
					shoe: 14,
					points: 12,
					rebounds: 12,
					assists: 12,
					steals: 12,
					blocks: 12,
					slam_dunks: 7
				},
				"Brook Lopez" => {
					number: 11,
					shoe: 17,
					points: 17,
					rebounds: 19,
					assists: 10,
					steals: 3,
					blocks: 1,
					slam_dunks: 15
				},
				"Mason Plumlee" => {
					number: 1,
					shoe: 19,
					points: 26,
					rebounds: 12,
					assists: 6,
					steals: 3,
					blocks: 8,
					slam_dunks: 5
				},
				"Jason Terry" => {
					number: 31,
					shoe: 15,
					points: 19,
					rebounds: 2,
					assists: 2,
					steals: 4,
					blocks: 11,
					slam_dunks: 1
				}
			}
		},
		away: {
			team_name: "Charlotte Hornets",
			colors: ["Turquoise", "Purple"],
			players: {
				"Jeff Adrien" => {
					number: 4,
					shoe: 18,
					points: 10,
					rebounds: 1,
					assists: 1,
					steals: 2,
					blocks: 7,
					slam_dunks: 2
				},
				"Bismak Biyombo" => {
					number: 0,
					shoe: 16,
					points: 12,
					rebounds: 4,
					assists: 7,
					steals: 7,
					blocks: 15,
					slam_dunks: 10
				},
				"DeSagna Diop" => {
					number: 2,
					shoe: 14,
					points: 24,
					rebounds: 12,
					assists: 12,
					steals: 4,
					blocks: 5,
					slam_dunks: 5
				},
				"Ben Gordon" => {
					number: 8,
					shoe: 15,
					points: 33,
					rebounds: 3,
					assists: 2,
					steals: 1,
					blocks: 1,
					slam_dunks: 0
				},
				"Brendan Haywood" => {
					number: 33,
					shoe: 15,
					points: 6,
					rebounds: 12,
					assists: 12,
					steals: 22,
					blocks: 5,
					slam_dunks: 12
				}
			}
		}
	}
end

def num_points_scored(player_name)
	game_hash.each do |location, attributes|
		attributes[:players].each do |player, stats|
			if player == player_name
				return stats[:points]
			end
		end
	end
end

def shoe_size(player_name)
	game_hash.each do |location, attributes|
		attributes[:players].each do |player, stats|
			if player == player_name
				return stats[:shoe]
			end
		end
	end
end

def team_colors(team_name)
	game_hash.each do |location, attributes|
		if attributes[:team_name] == team_name
			return attributes[:colors]
		end
	end
end

def team_names
	game_hash.collect do |location, attributes|
		attributes[:team_name]
	end
end

def player_numbers(team_name)
	numbers_array = []

	game_hash.each do |location, attributes|
		if attributes[:team_name] == team_name
			attributes[:players].each do |player, stats|
				numbers_array << stats[:number]
			end
		end
	end
	
	numbers_array
end

def player_stats(player_name)
	game_hash.each do |location, attributes|
		attributes[:players].each do |player, stats|
			if player == player_name
				return stats
			end
		end
	end
end

def big_shoe_rebounds
	largest_shoe = nil
	rebounds = nil

	game_hash.each do |location, attributes|
		attributes[:players].each do |player, stats|
			if largest_shoe == nil || stats[:shoe] > largest_shoe
				largest_shoe = stats[:shoe]
				rebounds = stats[:rebounds]
			end
		end
	end

	rebounds
end

def long_name_steals_a_ton?
	longest_name_length = nil
	longest_name_player = nil
	most_steals_num = nil
	most_steals_player = nil

	game_hash.each do |location, attributes|
		attributes[:players].each do |player, stats|
			if longest_name_length == nil || player.length > longest_name_length
				longest_name_length = player.length
				longest_name_player = player
			end

			if most_steals_num == nil || stats[:steals] > most_steals_num
				most_steals_num = stats[:steals]
				most_steals_player = player
			end
		end
	end

	if longest_name_player == most_steals_player
		true
	else
		false
	end
end

