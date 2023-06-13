# Created on June 4th, 2023 by Ícaro Freire (https://github.com/ivfreire)
# Radioactive Waste Management Service, SEGRR-IPEN/SP
# University of São Paulo - USP
# São Paulo, BRAZIL

extends Node

var containers = []

func _ready():
	self.containers = [
		[
			[ 'Fe-58', 10, 10 ],
			[ 'Cs-137', 10, 10 ]
		],
		[
			[ 'Fe-58', 10, 10 ],
			[ 'Cs-137', 10, 10 ]
		],
		[
			[ 'Fe-58', 10, 10 ],
			[ 'Cs-137', 10, 10 ]
		]
	]
	pass

func _process(delta):
	pass

# Methods
func generateContainers():
	var containerPrefab = $Container
	
	var k = 0
	for container in self.containers:
		var containerObj = containerPrefab.duplicate()
		self.add_child(containerObj)
		containerObj.translate(Vector3(0, 1 + k * 2, 0))
		containerObj.visible = true
		k += 1
	pass
