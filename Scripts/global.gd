extends Node

#Defining Constants
#Stage
const WALL : String = 'Wall'
const FLOOR : String = 'Floor'
const PLATFORM : String = 'Platform'

#States
const STAND : String = 'stand'
const DASH : String = 'dash'
const RUN : String = 'run'
const CROUCH : String = 'crouch'
const LANDING : String = 'landing'
const JUMP_SQUAT : String = 'jump_squat'
const SHORT_HOP : String = 'short_hop'
const FULL_HOP : String = 'full_hop'
const SKID : String = 'skid'
const AIR : String = 'air'
const AIR_DODGE : String = 'air_dodge'
const FREE_FALL : String = 'free_fall'
const WALLJUMPLEFT : String = 'wall_jump_left'
const WALLJUMPRIGHT : String = 'wall_jump_right'
const LEDGE_CATCH : String = 'ledge_catch'
const LEDGE_HOLD : String = 'ledge_hold'
const LEDGE_ROLL_FAST : String = 'ledge_roll_fast'
const LEDGE_CLIMB_FAST : String = 'ledge_climb_fast'
const LEDGE_JUMP_FAST : String = 'ledge_jump_fast'
const LEDGE_ROLL_SLOW : String = 'ledge_climb_slow'
const LEDGE_CLIMB_SLOW : String = 'ledge_climb_slow'
const LEDGE_JUMP_SLOW : String = 'ledge_jump_slow'
const NAIR : String = 'nair'
const FAIR : String = 'fair'
const UAIR : String = 'uair'
const BAIR : String =  'bair'
const DAIR : String =  'dair'
const TUMBLE : String =  'tumble'
var current_scene = null
var p1_device = null
#Device,AxisX,AxisY,Keyboard


func _ready():
	var root = get_tree().get_root()
	p1_device = {'device':0,'axisx':0,'axisy':0,'keyboard':false,'joypad':true}
	current_scene = root.get_child( root.get_child_count() -1 )
		

func goto_scene(path):

	# This function will usually be called from a signal callback,
	# or some other function from the running scene.
	# Deleting the current scene at this point might be
	# a bad idea, because it may be inside of a callback or function of it.
	# The worst case will be a crash or unexpected behavior.

	# The way around this is deferring the load to a later time, when
	# it is ensured that no code from the current scene is running:

	call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):

	# Immediately free the current scene,
	# there is no risk here.
	current_scene.free()

	# Load new scene
	var s = ResourceLoader.load(path)

	# Instance the new scene
	current_scene = s.instance()

	# Add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)

	# optional, to make it compatible with the SceneTree.change_scene() API
	get_tree().set_current_scene( current_scene )
