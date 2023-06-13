# Created on June 4th, 2023 by Ícaro Freire (https://github.com/ivfreire)
# Radioactive Waste Management Service, SEGRR-IPEN/SP
# University of São Paulo - USP
# São Paulo, BRAZIL

extends Node

@export var title = 'Borehole'

# Borehole's characteristics
@export var depth: float = 10
@export var innerRadius: float = 8.0
@export var outerRadius: float = 10.0

@onready var animation_player = $BoreholePlayer

func _ready():
	self.generateGeology()
	self.generateStructure()
	self.generateContainers()
	pass

func _process(delta):
	if $Control.visible: self.uiController()
	pass

# Methods
func generateGeology():
	$Geology.generateGeology()
	pass

func generateStructure():
	$Structure/Casing.transform = $Structure/Casing.transform.scaled(Vector3(1, self.depth, 1))
	$Structure/Mortar.transform = $Structure/Mortar.transform.scaled(Vector3(1, self.depth, 1))
	$Structure/Bottom.translate(2 * depth * Vector3.DOWN)
	$Containers.translate(2 * depth * Vector3.DOWN)
	
	$AreaCollider.transform = $AreaCollider.transform.scaled(Vector3(1, self.depth, 1))
	
	pass

func generateContainers():
	$Containers.generateContainers()	
	pass

# Controls UI components
func uiController():
	$Control/PreviewPanel.set_position($Control.get_global_mouse_position() + Vector2.RIGHT * 24)
	pass

func _on_area_collider_mouse_entered():
	$Control.visible = true
	pass

func _on_area_collider_mouse_exited():
	$Control.visible = false
	# animation_player.play_backwards("CasingRotation")
	pass

func _on_area_collider_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		$AreaCollider.visible = false
		animation_player.play("CasingRotation")
	pass
