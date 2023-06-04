# Created on June 4th, 2023 by Ícaro Freire (https://github.com/ivfreire)
# Radioactive Waste Management Service, SEGRR-IPEN/SP
# University of São Paulo - USP
# São Paulo, BRAZIL

extends Node3D

@export var speed : float = 30.0
@export var sensitivity: float = 0.3

var velocity: Vector3 = Vector3(0.0, 0.0, 0.0)
var flyVelocity: float = 0.0

var flying = true
var rotating = false

func _unhandled_input(event):
	if self.rotating:
		if event.is_class('InputEventMouseMotion'):
			self.rotate_y(deg_to_rad(-event.relative.x * sensitivity))
			self.rotation.z = 0.0
	if event.is_action('rotate_view'):
		self.rotating = not self.rotating
	pass
	
func _physics_process(delta):
	if self.flying:
		self.velocity.y = Input.get_action_strength("move_up") - Input.get_action_strength("move_down")
		
		self.flyVelocity = Input.get_action_strength("fly_up") - Input.get_action_strength("fly_down")
		
		self.translate_object_local(velocity * speed * delta)
		self.global_translate(Vector3.UP * flyVelocity * speed * delta)
	pass
