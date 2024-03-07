extends Label

@export var Target:Node 

func _process(_delta):

	text = Target.State
