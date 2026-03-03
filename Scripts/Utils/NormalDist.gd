class_name NormalDist
extends Node

# Generates RNG seed
static func seed_gen():
	var rng = RandomNumberGenerator.new()
	
	# Create random seed
	rng.randomize()
	
	# Set custom seed
	#rng.seed = 420

static func stat_normal_gen(base_stat: int) -> int:

	var mean = 0
	var variance = 1
	
	# Create normal distribution value, cannot be negative
	var normal_dist = abs(randfn(mean, variance))
	# Create the stat value (rounding up), clamp values to 10 and 100
	var new_stat = clamp(ceili(base_stat * normal_dist), 10, 100)

	return new_stat
	
