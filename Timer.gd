extends Timer

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	wait_time = rng.randi_range(3,5)
