extends Node2D

#VARIABLES
var pigskin1 = preload("res://Art/Character Skins/Sleepy.png")
var pigskin2 = preload("res://Art/Character Skins/Doctor.png")
var pigskin3 = preload("res://Art/Character Skins/Pirate.png")
var pigskin4 = preload("res://Art/Character Skins/Knight.png")
var pigskin5 = preload("res://Art/Character Skins/Shades.png")

var rng = RandomNumberGenerator.new()
var chance = 0
var itemtimer
var gametimer

#savestatevalues
var money = 0
var fit1 = false
var fit2 = false
var fit3 = false
var fit4 = false
var fit5 = false
var pigtype = 0

#FUNCTIONS

func _ready():
	itemtimer = get_node("Beach_Scene/Item Timer")
	gametimer = get_node("Beach_Scene/Timer")

func _process(delta):
	get_node("HUD/Money").text = str(money)

#play main menu button
func _on_PlayButton_pressed():
	get_node("Title Screen/Click SFX").play()
	get_node("Title Screen/Menu Music").stop()
	get_node("Beach_Scene/Beach Music").play()
	
	get_node("HUD/customize").show()
	get_node("HUD/beach").hide()
	get_node("HUD/Pause").show()
	
	get_node("Title Screen").hide()
	get_node("Beach_Scene").show()
	get_node("HUD").show()
	get_node("Pig").show()
	gametimer.start()
	
#exit button
func _on_ExitButton_pressed():
	get_node("Title Screen/Click SFX").play()
	get_tree().quit()

#customization button
func _on_customize_pressed():
	get_node("Title Screen/Click SFX").play()
	get_node("Beach_Scene/phone buzz").stop()
	get_node("Beach_Scene/drink sounds").stop()
	get_node("Beach_Scene/phone buzz").set_stream_paused(false)
	get_node("Beach_Scene/drink sounds").set_stream_paused(false)
	
	get_node("Beach_Scene/pillow rustle").stop()
	get_node("Beach_Scene/pillow rustle").set_stream_paused(false)
	get_node("Beach_Scene/medkit rattle").stop()
	get_node("Beach_Scene/medkit rattle").set_stream_paused(false)
	get_node("Beach_Scene/hook sheath").stop()
	get_node("Beach_Scene/hook sheath").set_stream_paused(false)
	get_node("Beach_Scene/helm rattle").stop()
	get_node("Beach_Scene/helm rattle").set_stream_paused(false)
	get_node("Beach_Scene/crab noise").stop()
	get_node("Beach_Scene/crab noise").set_stream_paused(false)
	
	get_node("Beach_Scene/Beach Music").stop()
	get_node("Customization/Customize Music").play()
	
	itemtimer.set_paused(false)
	itemtimer.stop()
	get_node("Beach_Scene/phone_active").hide()
	get_node("Beach_Scene/drink_active").hide()
	
	get_node("Beach_Scene/crab_active").hide()
	get_node("Beach_Scene/helmet_active").hide()
	get_node("Beach_Scene/hook_active").hide()
	get_node("Beach_Scene/medkit_active").hide()
	get_node("Beach_Scene/pillow_active").hide()
	
	get_node("HUD/beach").show()
	get_node("HUD/customize").hide()
	get_node("Beach_Scene").hide()
	get_node("Customization").show()
	get_node("Customization/purchase prices").show()
	gametimer.stop()

#beach button
func _on_beach_pressed():
	get_node("Title Screen/Click SFX").play()
	get_node("Customization/Customize Music").stop()
	get_node("Beach_Scene/Beach Music").play()
	
	
	get_node("HUD/customize").show()
	get_node("HUD/beach").hide()
	
	get_node("Beach_Scene").show()
	get_node("Customization").hide()
	get_node("Customization/purchase prices").hide()
	gametimer.start()

#pause button
func _on_Pause_pressed():
	get_node("Title Screen/Click SFX").play()
	get_node("Beach_Scene/phone buzz").set_stream_paused(true)
	get_node("Beach_Scene/drink sounds").set_stream_paused(true)
	
	get_node("Beach_Scene/crab noise").set_stream_paused(true)
	get_node("Beach_Scene/helm rattle").set_stream_paused(true)
	get_node("Beach_Scene/hook sheath").set_stream_paused(true)
	get_node("Beach_Scene/medkit rattle").set_stream_paused(true)
	get_node("Beach_Scene/pillow rustle").set_stream_paused(true)
	
	itemtimer.set_paused(true)
	get_node("Pause Menu").show()
	get_node("HUD/Pause").hide()
	
	gametimer.stop()

#resume
func _on_resume_pressed():
	get_node("Title Screen/Click SFX").play()
	
	get_node("Pause Menu").hide()
	get_node("HUD/Pause").show()
	get_node("Beach_Scene/phone buzz").set_stream_paused(false)
	get_node("Beach_Scene/drink sounds").set_stream_paused(false)
	
	get_node("Beach_Scene/crab noise").set_stream_paused(false)
	get_node("Beach_Scene/helm rattle").set_stream_paused(false)
	get_node("Beach_Scene/hook sheath").set_stream_paused(false)
	get_node("Beach_Scene/medkit rattle").set_stream_paused(false)
	get_node("Beach_Scene/pillow rustle").set_stream_paused(false)
	
	itemtimer.set_paused(false)
	gametimer.start()

#report
func _on_report_pressed():
	get_node("Title Screen/Click SFX").play()
	OS.shell_open("file:///D:/Users/Tempis/Desktop/College/Classes/2)%20IT%20Capstone/Module%204/Pig%20Vacation%20Website/Webby%20Sitey/public/report.html")

#main menu
func _on_main_menu_pressed():
	get_node("Title Screen/Click SFX").play()
	get_node("Title Screen/Menu Music").play()
	get_node("Beach_Scene/Beach Music").stop()
	get_node("Customization/Customize Music").stop()

	get_node("Beach_Scene/phone buzz").set_stream_paused(false)
	get_node("Beach_Scene/drink sounds").set_stream_paused(false)
	get_node("Beach_Scene/phone buzz").stop()
	get_node("Beach_Scene/drink sounds").stop()
	
	get_node("Beach_Scene/crab noise").set_stream_paused(false)
	get_node("Beach_Scene/crab noise").stop()
	get_node("Beach_Scene/helm rattle").set_stream_paused(false)
	get_node("Beach_Scene/helm rattle").stop()
	get_node("Beach_Scene/hook sheath").set_stream_paused(false)
	get_node("Beach_Scene/hook sheath").stop()
	get_node("Beach_Scene/medkit rattle").set_stream_paused(false)
	get_node("Beach_Scene/medkit rattle").stop()
	get_node("Beach_Scene/pillow rustle").set_stream_paused(false)
	get_node("Beach_Scene/pillow rustle").stop()
	
	
	itemtimer.set_paused(false)
	itemtimer.stop()
	get_node("Beach_Scene/phone_active").hide()
	get_node("Beach_Scene/drink_active").hide()
	get_node("Beach_Scene/pillow_active").hide()
	get_node("Beach_Scene/medkit_active").hide()
	get_node("Beach_Scene/hook_active").hide()
	get_node("Beach_Scene/helmet_active").hide()
	get_node("Beach_Scene/crab_active").hide()
	
	get_node("Pig").hide()
	get_node("HUD").hide()
	get_node("Pause Menu").hide()
	get_node("Title Screen").show()
	get_node("Beach_Scene").hide()
	get_node("Customization").hide()
	get_node("HUD/Pause").hide()
	gametimer.stop()

#activate phone
func _phonebuzz():
	get_node("Beach_Scene/phone buzz").play()
	
	get_node("Beach_Scene/phone_active").show()
	itemtimer.start()
#activate drink
func _drinkactive():
	get_node("Beach_Scene/drink sounds").play()
	
	get_node("Beach_Scene/drink_active").show()
	itemtimer.start() 
	# idk what this shit does --- >return floor(rand_range(0, 2))
#activate pillow
func _pillowactive():
	get_node("Beach_Scene/pillow rustle").play()
	
	get_node("Beach_Scene/pillow_active").show()
	itemtimer.start()
#activate medkit
func _medkitactive():
	get_node("Beach_Scene/medkit rattle").play()
	
	get_node("Beach_Scene/medkit_active").show()
	itemtimer.start()
#activate hook
func _hookactive():
	get_node("Beach_Scene/hook sheath").play()
	
	get_node("Beach_Scene/hook_active").show()
	itemtimer.start()
#activate helm
func _helmactive():
	get_node("Beach_Scene/helm rattle").play()
	
	get_node("Beach_Scene/helmet_active").show()
	itemtimer.start()
#activate crab
func _crabactive():
	get_node("Beach_Scene/crab noise").play()
	
	get_node("Beach_Scene/crab_active").show()
	itemtimer.start()

#call one of the 7 interactable items depending on pig type
func _on_Timer_timeout():
	
	#for shades pig
	if pigtype == 5:
		chance = rng.randi_range(1,7)
		if chance == 1:
			_phonebuzz()
		elif chance == 2:
			_drinkactive()
		elif chance == 3:
			_pillowactive()
		elif chance == 4:
			_medkitactive()
		elif chance == 5:
			_hookactive()
		elif chance == 6:
			_helmactive()
		elif chance == 7:
			_crabactive()
	#for knight
	elif pigtype == 4:
		chance = rng.randi_range(1,3)
		if chance == 1:
			_phonebuzz()
		elif chance == 2:
			_drinkactive()
		elif chance == 3:
			_helmactive()
			
	#for pirate
	elif pigtype == 3:
		chance = rng.randi_range(1,3)
		if chance == 1:
			_phonebuzz()
		elif chance == 2:
			_drinkactive()
		elif chance == 3:
			_hookactive()
	
	#for doctor
	elif pigtype == 2:
		chance = rng.randi_range(1,3)
		if chance == 1:
			_phonebuzz()
		elif chance == 2:
			_drinkactive()
		elif chance == 3:
			_medkitactive()
	
	#for sleepy pig
	elif pigtype == 1:
		chance = rng.randi_range(1,3)
		if chance == 1:
			_phonebuzz()
		elif chance == 2:
			_drinkactive()
		elif chance == 3:
			_pillowactive()
	
	#default pig
	else: 
		chance = randi()%2
		if chance ==1:
			_phonebuzz()
		else:
			_drinkactive()

#getmoney
func getmoney(amt):
	money+=amt

#click phone
func _on_phone_pressed():
	get_node("Beach_Scene/phone_active/phone off").play()
	get_node("Beach_Scene/phone buzz").stop()
	
	get_node("Beach_Scene/phone_active").hide()
	getmoney(1)
#click drink
func _on_drink_pressed():
	get_node("Beach_Scene/drink sounds").stop()
	get_node("Beach_Scene/drink_active/slurp").play()
	
	get_node("Beach_Scene/drink_active").hide()
	getmoney(1)
#click pillow
func _on_pillow_pressed():
	get_node("Beach_Scene/pillow rustle").stop()
	get_node("Beach_Scene/pillow_active/patpat").play()
	
	get_node("Beach_Scene/pillow_active").hide()
	getmoney(2)
#click medkit
func _on_medkit_pressed():
	get_node("Beach_Scene/medkit rattle").stop()
	get_node("Beach_Scene/medkit_active/medkit jossle").play()
	
	get_node("Beach_Scene/medkit_active").hide()
	getmoney(3)
#click hook
func _on_hook_pressed():
	get_node("Beach_Scene/hook sheath").stop()
	get_node("Beach_Scene/hook_active/hook rustle").play()
	
	get_node("Beach_Scene/hook_active").hide()
	getmoney(4)
#click helm
func _on_helm_pressed():
	get_node("Beach_Scene/helm rattle").stop()
	get_node("Beach_Scene/helmet_active/helm clank").play()
	
	get_node("Beach_Scene/helmet_active").hide()
	getmoney(5)
#click crab
func _on_crab_pressed():
	get_node("Beach_Scene/crab noise").stop()
	get_node("Beach_Scene/crab_active/crab shuffle").play()
	
	get_node("Beach_Scene/crab_active").hide()
	getmoney(6)

#timer
func _on_Item_Timer_timeout():
	get_node("Beach_Scene/phone_active").hide()
	get_node("Beach_Scene/drink_active").hide()
	
	get_node("Beach_Scene/pillow_active").hide()
	get_node("Beach_Scene/medkit_active").hide()
	get_node("Beach_Scene/hook_active").hide()
	get_node("Beach_Scene/helmet_active").hide()
	get_node("Beach_Scene/crab_active").hide()

#update labels
func updatelabels():
	
	get_node("Customization/purchase prices/purchase1").visible = !fit1
	get_node("Customization/purchase prices/sold1").visible = fit1
	
	get_node("Customization/purchase prices/purchase2").visible = !fit2
	get_node("Customization/purchase prices/sold2").visible = fit2
	
	get_node("Customization/purchase prices/purchase3").visible = !fit3
	get_node("Customization/purchase prices/sold3").visible = fit3
	
	get_node("Customization/purchase prices/purchase4").visible = !fit4
	get_node("Customization/purchase prices/sold4").visible = fit4
	
	get_node("Customization/purchase prices/purchase5").visible = !fit5
	get_node("Customization/purchase prices/sold5").visible = fit5

func setpig(skin):
	get_node("Pig").texture = skin
	
func updateskin():
	if pigtype == 1:
		setpig(pigskin1)
		return
	if pigtype == 2:
		setpig(pigskin2)
		return
	if pigtype == 3:
		setpig(pigskin3)
		return
	if pigtype == 4:
		setpig(pigskin4)
		return
	if pigtype == 5:
		setpig(pigskin5)
		return
	
#buy function
func spend(amt):
	if money >= amt:
		money -= amt
		return true
	get_node("Customization/error sound").play()

#clothing functions
func _on_buy1_pressed():
	if fit1 == true:
		setpig(pigskin1)
		pigtype = 1
		return
	if spend(5):
		fit1 = true
		setpig(pigskin1)
		pigtype = 1
		updatelabels()
		
func _on_buy2_pressed():
	if fit2 == true:
		setpig(pigskin2)
		pigtype = 2
		return
	if spend(10):
		fit2 = true
		setpig(pigskin2)
		pigtype = 2
		updatelabels()
		
func _on_buy3_pressed():
	if fit3 == true:
		setpig(pigskin3)
		pigtype = 3
		return
	if spend(15):
		fit3 = true
		setpig(pigskin3)
		pigtype = 3
		updatelabels()
		
func _on_buy4_pressed():
	if fit4 == true:
		setpig(pigskin4)
		pigtype = 4
		return
	if spend(20):
		fit4 = true
		setpig(pigskin4)
		pigtype = 4
		updatelabels()

func _on_buy5_pressed():
	if fit5 == true:
		setpig(pigskin5)
		pigtype = 5
		return
	if spend(30):
		fit5 = true
		setpig(pigskin5)
		pigtype = 5
		updatelabels()



