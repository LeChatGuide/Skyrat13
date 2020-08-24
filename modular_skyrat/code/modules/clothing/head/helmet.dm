//CP helmet very nice
/obj/item/clothing/head/helmet/cphood
	name = "Civil Protection hood"
	desc = "Fits perfectly with a CP gas mask."
	icon = 'modular_skyrat/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_skyrat/icons/mob/clothing/head.dmi'
	icon_state = "cphood"
	item_state = "cphood"

//Infiltrator helmet buff
/obj/item/clothing/head/helmet/infiltrator
	armor = list("melee" = 40, "bullet" = 40, "laser" = 30, "energy" = 40, "bomb" = 70, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)

//cloaker armor vest
/obj/item/clothing/head/helmet/advanced
	name = "night vision helmet"
	desc = "I fought the law, and the law won."
	icon = 'modular_skyrat/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_skyrat/icons/mob/clothing/head.dmi'
	icon_state = "cloaker"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 35, "energy" = 50, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 100)
	mutantrace_variation = STYLE_NO_ANTHRO_ICON
	actions_types = list(/datum/action/item_action/toggle_nv)

/datum/action/item_action/toggle_nv
	name = "Toggle Night-Vision"
	desc = "Toggle your helmet's night vision."

/obj/item/clothing/head/helmet/advanced/item_action_slot_check(slot, mob/user, datum/action/A)
	. = ..()
	if(. && (slot == SLOT_HEAD))
		return TRUE

/obj/item/clothing/head/helmet/advanced/ui_action_click(mob/user, action)
	. = ..()
	if(istype(action, /datum/action/item_action/toggle_nv))
		if(darkness_view != 8)
			darkness_view = 8
			to_chat(user, "<span class='notice'>You activate [src]'s night vision.</span>")
		else
			darkness_view = 0
			to_chat(user, "<span class='notice'>You deactivate [src]'s night vision.</span>")
