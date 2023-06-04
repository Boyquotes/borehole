# Created on June 4th, 2023 by Ícaro Freire (https://github.com/ivfreire)
# Radioactive Waste Management Service, SEGRR-IPEN/SP
# University of São Paulo - USP
# São Paulo, BRAZIL

extends Node

var textures = {
	'dirt': preload('res://Textures/Dirt.jpg'),
	'sand': preload('res://Textures/Sand.jpg'),
	'gneiss': preload('res://Textures/Bedrock.jpg')
}

var layers = []

func _ready():
	# PLACEHOLDER CODE!!!
	self.layers = [
		[ 'Dirt', 'dirt', 5 ],
		[ 'Sand', 'sand', 2 ],
		[ 'Geniss', 'gneiss', 3 ],
	]
	pass

# Methods
func generateGeology():
	var depth = 0
	for layer in self.layers:
		self.createLayer(layer[0], layer[1], depth, layer[2])
		depth += layer[2]
	pass

func createLayer(title, material, depth, thickness):
	var layerPrefab = $Layer
	
	# Create 3D mesh
	var newLayer = layerPrefab.duplicate()
	self.add_child(newLayer)
	newLayer.transform = newLayer.transform.scaled(Vector3(1.0, thickness, 1.0))
	newLayer.transform.origin = Vector3(0, -2 * depth, 0)
	newLayer.visible = true
	
	# Duplicate and scale textures
	var newMat = newLayer.material_override.duplicate()
	newMat.set('shader_param/mask', textures[material])
	newMat.set('shader_param/scale', thickness)
	newLayer.material_override = newMat
	
	pass
