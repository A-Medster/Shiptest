/datum/species/pod
	// A mutation caused by a human being ressurected in a revival pod. These regain health in light, and begin to wither in darkness.
	name = "\improper Podperson"
	id = SPECIES_POD
	default_color = "59CE00"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,SCLERA)
	mutant_bodyparts = list("tail_lizard", "face_markings", "frills", "horns", "spines", "body_markings", "legs")
	default_features = list("mcolor" = "0F0", "tail_lizard" = "Smooth", "face_markings" = "None", "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None", "legs" = "Normal Legs", "body_size" = "Normal")
	inherent_traits = list(TRAIT_ALWAYS_CLEAN)
	inherent_factions = list("plants", "vines")
	fixed_mut_color = "59CE00"
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slice.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	burnmod = 1.25
	heatmod = 1.5
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/plant
	liked_food = VEGETABLES | FRUIT | GRAIN | CLOTH //cannibals apparentely
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/plant

	belly_color = MUTCOLORS

	species_chest = /obj/item/bodypart/chest/pod
	species_head = /obj/item/bodypart/head/pod
	species_l_arm = /obj/item/bodypart/l_arm/pod
	species_r_arm = /obj/item/bodypart/r_arm/pod
	species_l_leg = /obj/item/bodypart/leg/left/pod
	species_r_leg = /obj/item/bodypart/leg/right/pod

/datum/species/pod/spec_life(mob/living/carbon/human/H)
	if(H.stat == DEAD)
		return
	var/light_amount = 0 //how much light there is in the place, affects receiving nutrition and healing
	if(isturf(H.loc)) //else, there's considered to be no light
		var/turf/T = H.loc
		light_amount = min(1, T.get_lumcount()) - 0.5
		var/sugar_amount = H.reagents.get_reagent_amount(/datum/reagent/consumable/sugar)
		H.reagents.add_reagent(/datum/reagent/consumable/sugar, min(1, 10 - sugar_amount))
		if(light_amount > 0.2) //if there's enough light, heal
			H.heal_overall_damage(1,1, 0, BODYTYPE_ORGANIC)
			H.adjustToxLoss(-1)
			H.adjustOxyLoss(-1)

	if(H.nutrition < NUTRITION_LEVEL_STARVING + 50)
		H.take_overall_damage(2,0)

/datum/species/pod/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	if(chem.type == /datum/reagent/toxin/plantbgone)
		H.adjustToxLoss(3)
		H.reagents.remove_reagent(chem.type, REAGENTS_METABOLISM)
		return TRUE

	return ..()

/datum/species/pod/on_hit(obj/projectile/P, mob/living/carbon/human/H)
	switch(P.type)
		if(/obj/projectile/energy/floramut)
			if(prob(15))
				H.rad_act(rand(30,80))
				H.Paralyze(100)
				H.visible_message("<span class='warning'>[H] writhes in pain as [H.p_their()] vacuoles boil.</span>", "<span class='userdanger'>You writhe in pain as your vacuoles boil!</span>", "<span class='hear'>You hear the crunching of leaves.</span>")
				if(prob(80))
					H.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
				else
					H.easy_randmut(POSITIVE)
				H.randmuti()
				H.domutcheck()
			else
				H.adjustFireLoss(rand(5,15))
				H.show_message("<span class='userdanger'>The radiation beam singes you!</span>")
		if(/obj/projectile/energy/florayield)
			H.reagents.add_reagent(/datum/reagent/consumable/sugar, 5)
		if(/obj/projectile/energy/florarevolution)
			H.show_message("<span class='notice'>The radiation beam leaves you feeling disoriented!</span>")
			H.Dizzy(15)
			H.emote("flip")
			H.emote("spin")
