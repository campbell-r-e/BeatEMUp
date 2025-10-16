extends CharacterBody2D

@export var speed = 200
@onready var anim_tree = $AnimationTree
var facing = 1

func _ready() -> void:
	pass

func _process(delta):
	var dir = Input.get_vector("Left", "Right", "Forward", "Back")
	self.velocity = dir * speed

	if dir.x < 0 and facing == 1:
		self.scale.x *= -1
		facing = -1

	if dir.x > 0 and facing == -1:
		self.scale.x *= -1
		facing = 1

	if velocity.length() > 0.01:
		anim_tree["parameters/conditions/walk"] = true
		anim_tree["parameters/conditions/idle"] = false
	else:
		anim_tree["parameters/conditions/walk"] = false
		anim_tree["parameters/conditions/idle"] = true

	if Input.is_action_just_pressed("attack"):
		anim_tree["parameters/conditions/attack"] = true
	else:
		anim_tree['parameters/conditions/attack']=false;

	move_and_slide()
	pass


func _on_attack_region_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		print("hit target")
		var dir = self.global_position -body.global_position;
		body.hit
		
	pass # Replace with function body.
