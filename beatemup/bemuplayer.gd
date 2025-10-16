extends CharacterBody2D

@export var speed =200;
@onready var anim_tree = $AnimationTree;
func _ready() -> void:
	pass;
func _process(delta):
	var dir = Input.get_vector("Left","Right","Forward","Back");
	self.velocity=dir*speed;
	
	if velocity.length() >0.01:
		anim_tree['parameters/conditions/walk']=true;
		anim_tree['parameters/conditions/idle']=false;
	else:
		anim_tree['parameters/conditions/walk']=false;
		anim_tree['parameters/conditions/idle']=true;
		
		
	move_and_slide();
	
	pass;
