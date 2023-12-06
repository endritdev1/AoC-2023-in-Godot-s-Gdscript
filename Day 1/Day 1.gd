extends Node2D

var file 
var rawClue
var sum = 0

func _ready():
	file = loadMe.new().loadFile("res://Day1.txt")
	rawClue = file.split("\n",false)
#	check()
	check2()

#------------------------------------------------------------------------------*/
#----------------------------------Part One-----------------------------------*/
#------------------------------------------------------------------------------*/

func check():
	var n
	for i in rawClue.size():
		n = ""
		for chr in rawClue[i].length():
			if rawClue[i][chr].is_valid_int():
				n += str(rawClue[i][chr])
				break
		for chr in range(rawClue[i].length()-1,-1,-1):
			if rawClue[i][chr].is_valid_int():
				n += str(rawClue[i][chr])
				break
		print (n)
		sum += int(n)
	print(sum)

#*******************************************************************************/
#----------------------------------Part Two-----------------------------------*/
#*******************************************************************************/

var numbers = ["one","two","three","four","five","six","seven","eight","nine"]

func check2():
	var firstIndex = 999
	var firstMember 
	var secondIndex = 0
	var secondMember
	var finalNumber
	for i in rawClue.size():
		firstIndex = 999
		firstMember = ""
		secondIndex = -1
		secondMember = ""
		for n in numbers:
			if rawClue[i].find(n) < firstIndex and rawClue[i].find(n) != -1:
				firstIndex = rawClue[i].find(n)
				firstMember = n
			if rawClue[i].rfind(n) > secondIndex and rawClue[i].find(n) != -1:
				secondMember = n
				secondIndex = rawClue[i].rfind(n)
		for chr in rawClue[i].length():
			if rawClue[i][chr].is_valid_int():
				if chr < firstIndex:
					firstIndex = chr
					firstMember = rawClue[i][chr]
#					print("print situa particolare")
		for chr2 in range(rawClue[i].length()-1,-1,-1):
			if rawClue[i][chr2].is_valid_int():
				if chr2 > secondIndex:
#					print("before change",str(secondIndex))
					secondIndex = chr2
					secondMember = rawClue[i][chr2]
#		print(firstMember)
#		print(secondMember)
		if firstMember.is_valid_int():
			finalNumber = firstMember
		else:
#			print(str("stringa", str(numbers.find(firstMember)+1)))
			finalNumber = str(numbers.find(firstMember)+1)
		if secondMember.is_valid_int():
			finalNumber = finalNumber+secondMember
#			print ("final number",str(finalNumber))
		else:
			finalNumber = str(finalNumber,numbers.find(secondMember)+1)
		print(finalNumber)
		sum += int(finalNumber)
		
	print(sum)
#		print("index: ",str(firstIndex))
#		print(firstMember)
#		print(secondMember)
