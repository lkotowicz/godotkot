extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
var scrolling_speed =100

func _process(delta):
	scroll_offset.x-=scrolling_speed*delta
