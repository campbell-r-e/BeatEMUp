extends CharacterBody2D
@onready var healthbar=$ProgressBar;
var health =5;
func hit(hit_dir):
	self.velocity =hit_dir*100;
	health -=1;
	healthbar.value =health;
	if health<=0:
		self.queue_free();
	print(health);
func _process(delta):
	velocity *=.9
	move_and_slide();
	
