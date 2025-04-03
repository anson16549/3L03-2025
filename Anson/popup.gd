extends Control

var dialogue_lines = []
var dialogue_index := 0

func _ready():
	var current_scene_name = get_tree().current_scene.name
	print("Current scene name: ", current_scene_name)
	
	match current_scene_name:
		"Dialogue_past":
			dialogue_lines = [
				  "Ah, now there’s a face I ain’t seen before. You lookin’ for trouble, or tryin’ to fix it? ‘Cause we could use a hand ‘round here. The ice up north? It ain't holdin' like it used to. Somethin’ unnatural’s tearin’ through the glaciers—beasts made of ice, crackin’ the ground right out from under us.",

	"Then there’s the forest. Dry as tinder, and wouldn’t you know it—fire’s started up. If it spreads, we’ll lose the whole damn valley. Some folks are tryin’ to stop it, but they ain't enough. And the village? Used to be clean water, good fishin’. Now the shore’s fillin’ up with filth, and no one’s takin’ the blame.",

	"If somethin’ ain’t done soon, there won’t be a village left to save. Things ain't too far gone yet, but they’re slippin’. You got that look about ya—like you might be able to turn the tide. If you can, do it quickly. We ain't got forever."

			]

		"Dialogue_present1":
			dialogue_lines = [
				"Eh? You alright there, stranger? You lookin’ like you seen a ghost. That neat amulet you turned up with got destroyed. I seen the shards fly off all over the place. One flew into the fire — wouldn’t wanna be the one to go there.",
	"Another got snatched by some ice critters settin’ traps up north east. Been watching those, troublemakers destroy everything around them. I tell you, there is no reasoning with those fellas what with their violent nature.",
	"Last piece? Done sunk to the bottom of what was once my home. The village under the sea - just north west of here. Was thinking of heading there to snag it, but that water ain't what it used to be - too much filth in the water as is.",
	"Things ain’t like they used to be, The ice, the rivers, even the fish—they’re all disappearin’. Used to be a paradise here. Now? Just smoke, poison, and bad luck. Hope you find what you’re lookin’ for. Just watch where you step—world ain’t too kind these days. These may help ya later on, I got no use for these anymore.",
	"so have your pick. Only 1 thing, though, I’m not foolish enough to be here defenseless."
	
			]

		_:
			print("❌ Scene name not matched. Using fallback.")
			dialogue_lines = ["[Default line if nothing matches]"]

	print("Loaded dialogue lines: ", dialogue_lines.size())
	if dialogue_lines.size() > 0:
		$Panel1/RichTextLabel1.text = dialogue_lines[dialogue_index]

	if has_node("Panel1/Button1"):
		$Panel1/Button1.grab_focus()


func _on_Button1_pressed():
	dialogue_index += 1
	print("Clicked OK — dialogue_index: ", dialogue_index, "/", dialogue_lines.size())

	if dialogue_index < dialogue_lines.size():
		$Panel1/RichTextLabel1.text = dialogue_lines[dialogue_index]
	else:
		print("Closing popup")
		queue_free()
		
		#Trigger by Player Entering Area
		#@onready var popup_scene = preload("res://Anson/popup.tscn")

		#func _on_area_entered(body):
		#if body.name == "Player":
		#var popup = popup_scene.instantiate()
		#add_child(popup)
