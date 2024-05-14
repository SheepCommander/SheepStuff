# SheepStuff
SheepCommander's Godot project

## Tutorials used


## Hano's design docs
https://www.canva.com/design/DAGDKxkLcLw/2B1Ih7MeO2tE7Tr-LNKUQA/edit


## Style Guide
https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#code-order
```
Comments & doc comments should have a space
# wtf is this
## variable that kills people

Commas should be followed by spaces
hanodev(food, alcohol)

Static typing:
	var x := "Kill hano" ## Clearly a string
	var x : float = 0.0 ## float vs. int isn't clear, explicitly say the type
	func hanodev(food: Food, alcohol: Drink) ## Use this style
```
### This
@tool
class_name
extends
`## docstring`

signals
enums
constants
@export variables
public variables
private variables
@onready variables

_init()
_enter_tree()
_ready()
_remaining_built-in_virtual_methods()
public methods
private methods
sub classes

^ All of this section should be surrounded by Double Lines of space.
