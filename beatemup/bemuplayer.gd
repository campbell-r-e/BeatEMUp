extends CharacterBody2D

@export var speed =100;
func _ready() -> void:
	pass;
func _process(delta):
	var dir = Input.get_vector("Left","Right","Forward","Back");
	self.velocity=dir*speed;
	move_and_slide();
	
	pass;
