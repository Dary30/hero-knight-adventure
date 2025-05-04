extends HSlider

@export var bus_name: String

var bus_id: int


func _ready() -> void:
	bus_id = AudioServer.get_bus_index(bus_name)


func _on_value_changed(new_value: float) -> void:
	var db = linear_to_db(new_value)
	AudioServer.set_bus_volume_db(bus_id, db)
