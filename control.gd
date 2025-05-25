extends Control

@export var max_health := 100
@export var current_health := 100

func _ready():
	update_bar()

func set_health(value: int):
	current_health = clamp(value, 0, max_health)
	update_bar()

func damage(amount: int):
	set_health(current_health - amount)

func heal(amount: int):
	set_health(current_health + amount)

func update_bar():
	$ProgressBar.value = current_health

func _process(_delta):
	if Input.is_action_just_pressed("a"):
		print("Presionaste A")
		damage(4)
	elif Input.is_action_just_pressed("d"):
		print("Presionaste D")
		heal(4)
