extends Node2D

var file 
var rawClue
var sum = 0

var red = 12
var green = 13
var blue = 14

func _ready():
	file = loadMe.new().loadFile("res://Day 2/Day 2 input.txt")
	rawClue = file.split("\n",false)
#	check()
	check2()

#------------------------------------------------------------------------------*/
#-----------------------------------Part One-----------------------------------*/
#------------------------------------------------------------------------------*/
func check():
	var gameIndex = 0
	var substring
	var gameArray = []
	var gameArray2 = []
	var subArray = []
	for game in rawClue:
		gameArray = []
		gameIndex = (game.substr(game.find("Game")+4, -1))
		gameIndex = gameIndex.left(gameIndex.find(":"))
		gameArray.append((game.substr(game.find(":")+1,-1)).split(";"))
		for i in gameArray:
			subArray = []
			for y in i:
				subArray.append_array(y.split(","))
			gameArray2.append(subArray)
	
	for i in gameArray2.size():
#		print(gameArray2[i])
		var isTrue = false
		for x in gameArray2[i]:
#			print(x)
			if x.contains("red"):
				if  int(x.trim_suffix("red")) > red:
					isTrue = false
					break
				else:
					isTrue = true
			elif x.contains("green"):
				if  int(x.trim_suffix("green")) > green:
					isTrue = false
					break
				else:
					isTrue = true
			elif x.contains("blue"):
				if  int(x.trim_suffix("blue")) > blue:
					isTrue = false
					break
				else:
					isTrue = true
#		print(isTrue)
		if isTrue:
			sum += i+1
			isTrue = false

	print(sum)
	

#------------------------------------------------------------------------------*/
#-----------------------------------Part Two-----------------------------------*/
#------------I just copied the function and changed it a little bit------------*/
#------------------------------------------------------------------------------*/
func check2():
	var gameIndex = 0
	var substring
	var gameArray = []
	var gameArray2 = []
	var subArray = []
	var _red = 0
	var _green = 0
	var _blue = 0
	for game in rawClue:
		gameArray = []
		gameIndex = (game.substr(game.find("Game")+4, -1))
		gameIndex = gameIndex.left(gameIndex.find(":"))
		gameArray.append((game.substr(game.find(":")+1,-1)).split(";"))
		for i in gameArray:
			subArray = []
			for y in i:
				subArray.append_array(y.split(","))
			gameArray2.append(subArray)
	for i in gameArray2.size():
		print(gameArray2[i])
		for x in gameArray2[i]:
			print(x)
			if x.contains("red"):
				if  int(x.trim_suffix("red")) > _red:
					_red = int(x.trim_suffix("red"))
					print(_red)
			elif x.contains("green"):
				if  int(x.trim_suffix("green")) > _green:
					_green = int(x.trim_suffix("green"))
					
			elif x.contains("blue"):
				if  int(x.trim_suffix("blue")) > _blue:
					_blue = int(x.trim_suffix("blue"))
		sum += (_red*_green*_blue)
		_blue = 0
		_red = 0
		_green = 0
	print(sum)
	
