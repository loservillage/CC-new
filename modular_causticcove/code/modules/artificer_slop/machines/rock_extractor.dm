/obj/machinery/rock_extractor
	name = "rudimentary kievitchextractorinator"
	desc = "A medium sized, bulky machinery, that extracts resources and elemental essences from stones. Insert stone, power it, and enjoy the bounty of Malum! This one is a very basic design, lacking any automation and being little more than bronze box with some gears and grinders in it, powered by a handcrank."

/obj/machinery/rock_extractor/proc/letsgogambling(obj/item/natural/stone/s, mob/user)
	var/chance = 0
	if(isliving(user))
		var/mob/living/loser = user
		chance = loser.STALUC
	//Resource extraction, this inherits the medium loot table
	if(prob(chance)) //Loser is a winner!
		var/mineralSpawnChanceList = list(
			/obj/item/reagent_containers/powder/salt = 5,
			/obj/item/rogueore/gold = 3,
			/obj/item/rogueore/silver = 2,
			/obj/item/rogueore/iron = 33,
			/obj/item/rogueore/cinnabar = 15,
			/obj/item/rogueore/copper = 15,
			/obj/item/rogueore/tin = 10,
			/obj/item/rogueore/coal = 14,
			/obj/item/roguegem/random = 1)
		var/mineral = pickweight(mineralSpawnChanceList)
		new mineral(src)
	if(s.magic_power)
		var/essence = pick(GLOB.elementalessences)
		new essence(src)


