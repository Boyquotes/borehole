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

func _ready():
	self.generateGeology()
	self.generateStructure()
	self.generateContainers()
	pass

func _process(delta):
	pass


# Methods
func generateGeology():
	$Geology.generateGeology()
	pass

func generateStructure():
	$Structure/Casing.transform = $Structure/Casing.transform.scaled(Vector3(1, depth, 1))
	$Structure/Mortar.transform = $Structure/Mortar.transform.scaled(Vector3(1, depth, 1))
	$Structure/Bottom.translate(2 * depth * Vector3.DOWN)
	pass

func generateContainers():
	pass
