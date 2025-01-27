"DS" by Cameron

When play begins: 
	say "You have been left in some strange cell.";
	now the hallway door timer is 3.

The Undead Asylum is a room. "You find yourself in a dimly lit cell, damp and cold. The air is thick with the smell of moss and decay."

A rock is in the Undead Asylum. The rock is a thing. The description is "A small, heavy rock."

The cell door is a door. It is south of the Undead Asylum and north of the Asylum Corridor. It is locked. The matching key of the cell door is a rock. "The door to the cell, rusted and ancient, as if no soul has touched it in centuries."

The Asylum Grounds is a room. "The grounds stretch out before you, illuminated only by flickering torches. Shadows dance menacingly along the walls. There is a sense of foreboding that makes your skin crawl."

The Asylum Corridor is a room. "You step into a narrow, dimly lit hallway, the air thick with the scent of mildew and decay. The cold, damp stone walls seem to close in around you, their surfaces slick with moisture. Flickering torches cast long, dancing shadows that seem to twist and writhe like malevolent spirits."

The Corridor Door is a door. It is north of the Asylum Grounds and south of the Asylum Corridor. The description of the Corridor Door is "The heavy wooden door looms before you, its surface marred by deep claw marks and the stains of time. Rusted iron bands reinforce its frame, and the faint scent of mildew wafts from the cracks. Each creak of its hinges echoes through the air, as though the door itself protests against being opened. It feels as though it has been both a barrier of protection and a harbinger of doom.". The Corridor Door is open, lockable, and locked.

The Lower Asylum Hallway is a room. "A gloomy hallway stretches into the shadows, the flickering light barely revealing the cold stone walls." 

The Hallway Door is a door. It is east of the Asylum Grounds and west of the Lower Asylum Hallway. The description of the Hallway Door is "A small wooden door creaks ominously on its hinges, an exit that may ward off bigger creatures.". The Hallway Door is open, lockable, and locked.

Hallway door timer is a number that varies. Hallway door timer is 3.

The Upper Asylum Hallway is a room. "A chilling silence pervades the air in this narrow, dark hallway. The faint sound of dripping water echoes through the space." It is east of the Asylum Corridor.

Instead of going east from the Asylum Corridor:
	say "It seems like the path is too high to get to, but a strange glow is faintly visible.";
	stop the action.
	
Instead of going west from the Upper Hallway:
	if Armament is false:
		say "You should probably find a better weapon before you go back down.";
		stop the action;
	otherwise:
		continue the action.

The Upper Hallway Door is a door. It is north of the Lower Asylum Hallway and south of the Upper Asylum Hallway. It is unlocked. "An old iron door, its surface mottled with rust."

The bonfire is in the Asylum Corridor. It is an enterable supporter. It is fixed in place. "A small, flickering bonfire sits here, offering a brief respite from the darkness. The flames seem to whisper secrets long forgotten."

Instead of closing the Corridor Door:
	If the Corridor Door is open:
		say "...but it looks so inviting! Why not just step through it and see what's on the other side?";
	otherwise:
		say "It seems already to have closed itself without your lifting a finger."

After going south from the Asylum Corridor:
		now the Corridor Door is closed;
		say "The Corridor Door slams shut behind you with a heavy thud. It clicks audibly, locking itself.";
		continue the action.
		
Instead of closing the Hallway Door:
	If the Hallway Door is open:
		say "...but it looks so inviting! Why not just step through it and see what's on the other side?";
	otherwise:
		say "It seems already to have closed itself without your lifting a finger."

After going east from the Asylum Grounds:
		now the Hallway Door is closed;
		now the Corridor Door is open;
		now the Corridor Door is locked;
		say "As you step through, the Hallway Door creaks ominously before slamming shut, the lock clicking into place.";
		continue the action.

Instead of entering the bonfire:
	say "You sit by the bonfire. The warmth of the flames washes over you, and a faint sense of relief settles in.";
	if the player carries the health vial:
		say "The health vial in your possession seems to glow brighter, its contents replenished.";
		now the health vial is full;
	otherwise:
		say "However, without a health vial in your possession, the bonfire's restorative power is of no use.";

The player holds a tattered map. The description of a tattered map is "A map, barely legible, marked with cryptic symbols. It is of little help in this labyrinthine place. Where did this come from?"

The player holds a broken sword. The description of a broken sword is "An ancient sword, its blade chipped and rusted. It feels heavy in your hand. Where did this come from?"

The Asylum Demon is a person in the Asylum Grounds. The description of The Asylum Demon is "A massive, grotesque demon, its body twisted and malformed. It wields a giant hammer, ready to crush any who dare challenge it." 

Asylum Demon Health is a number that varies. Asylum Demon Health is 100.

Injured is a truth state that varies. Injured is false.

Instead of attacking the Asylum Demon: 
	if Armament is true:
		say "You landed a blow on the demon!";
		Decrease Asylum Demon Health by 50;
		if Asylum Demon Health is 0:
			end the story saying "You have slain the demon guarding the exit and escaped the Asylum!";
	otherwise:
		if the player carries the rock: 
			say "You throw the miniscule rock at the demon. The rock crumbles into dust after colliding with its hide. Now what?"; 
			remove the rock from play; 
			stop the action; 
		otherwise: 
			say "You swing your broken sword at the demon, but it barely scratches its hide. The demon roars in anger. Maybe you should find another way to survive.";
			stop the action; 
	
Every turn when the player is in the Asylum Grounds:
	decrement the hallway door timer;
	if the hallway door timer is 0:
		if Injured is true:
			say "The ground shakes violently as the Asylum Demon slams its massive hammer down, crushing you instantly. Darkness consumes you.";
			end the story saying "You were slain by the Asylum Demon.";
		otherwise:
			now Injured is true;
			say "You got injured by the demon! You better not take another hit...";
			now the hallway door timer is 3;
	otherwise if the hallway door timer is 1:
		say "You hear the thunderous steps of the Asylum Demon drawing closer. You feel its presence looming over you. Time is running out.";
	otherwise if the hallway door timer is 2:
		say "The air grows heavier, and you hear the deep, guttural growl of the Asylum Demon echoing through the walls. You must hurry."
		
Instead of going south from the Undead Asylum:
	if the cell door is locked:
		say "The cell door is shut tight. You need to find a way to open it.";
		stop the action;
	otherwise:
		say "As you step into the corridor, you feel a chill run down your spine. The bonfire's light flickers, casting eerie shadows. In the distance, you hear the sound of heavy footsteps.";
		continue the action;
		
After unlocking the cell door with a rock:
	now the cell door is unlocked;
	say "You use the rock on the cell door. It breaks the rusty lock open with a loud clank. The door slowly creaks open."
	
Instead of unlocking the cell door with the broken sword: 
	say "You use the broken sword to pry at the lock. After some effort, the rusty lock gives way, and the door slowly creaks open."; now the cell door is unlocked.
	
The Dying Soldier is a person in the Upper Asylum Hallway. "A frail figure slumps against the wall, their armor battered and bloodstained. They clutch a deep wound in their side, struggling to breathe. The seem to be holding a strange vial very tightly." The description of the Dying Soldier is "Their face is pale, and their breath comes in shallow, ragged gasps. It's clear they don't have long to live." The Dying Soldier carries a health vial.

Table of Dying Soldier’s Answers
topic									question type	reply
"asylum/grounds/place/location"			what			"'This place... was once a haven for the lost,' the soldier murmurs, 'but now it's a tomb for the forsaken. Beware what lies in the shadows.'"
"asylum/grounds/place/location"			where			"'The grounds stretch beyond the hallways, twisting into darkness. The demon guards the way... you must be prepared.'"
"demon/guardian/creature"				who				"'The demon... it was not always like this,' the soldier whispers, voice frail. 'It was created... a protector turned monster by dark magic.'"
"demon/guardian/creature"				why				"'Why?' the soldier repeats, coughing weakly. 'Because power corrupts all... even those meant to defend. It guards the path to freedom, its duty warped into madness.'"
"key/door/escape"						where			"'The key... it lies hidden,' the soldier says. 'Beneath the shadows in the hallway below. Look carefully... not all is as it seems.'"
"key/door/escape"						how				"'The locks are ancient, rusted. A firm strike or the right tool may break them,' the soldier mutters. 'But tread carefully... each sound carries.'"
"vial/potion/health"					what			"'This vial,' the soldier whispers, holding it weakly. 'It will sustain you for a time... but use it wisely. Such gifts are rare.'"
"vial/potion/health"					why				"'Why give this to you?' The soldier exhales weakly. 'Because your survival is our only hope. Take it... and live.'"
"battle/fight/survive"					how				"'Fight not with brute force,' the soldier says, eyes flickering shut. 'But with cunning. Observe... and strike when the moment is right.'"
"hallways/paths/route"					where			"'The hallways twist and deceive,' the soldier murmurs. 'Some paths lead to safety. Others... to death. Watch for signs of hope.'"
"bonfire/flames/safety"					what			"'The bonfire,' the soldier whispers. 'It connects this place to... something ancient. A refuge... but also a beacon. Use it well.'"
"bonfire/flames/safety"					why				"'The flames sustain life,' the soldier says faintly. 'But beware... they also attract death.'"

[fix conversational code]
Interrogative is a kind of value. 
The interrogatives are who, what, when, where, how, and why.

Current question is an interrogative that varies.

After asking the Dying Soldier about something: 
	respond to the question.
After answering the Dying Soldier that something: 
	respond to the question.

The Dying Soldier can be attentive or inattentive. The Dying Soldier is inattentive.

To greet the soldier:
	now the Dying Soldier is attentive;
	say "The soldier's head tilts slightly, their eyes fluttering open. They look at you weakly, a faint glimmer of recognition in their gaze."

Greeting is an action applying to one visible thing. Understand "greet [someone]" as greeting.

Check greeting the Dying Soldier:
	if the Dying Soldier is not in the location:
		say "There is no one here to greet.";
		stop the action.

Carry out greeting the Dying Soldier:
	greet the soldier.
	
After reading a command:
	if the player's command includes "[interrogative]":
		now the current question is the interrogative understood.

To respond to the question:
	if the Dying Soldier is inattentive:
		say "The soldier doesn't seem to hear you. Perhaps you should try to get their attention first.";
		stop the action;
	repeat through the Table of Dying Soldier’s Answers:
		if the topic understood includes topic entry:
			if the current question is the question type entry:
				say "[reply entry][paragraph break]";
				if the topic understood includes "vial/health/potion":
					move the health vial to the player;
					say "He lessens his grip on the health vial and hands you it shakily.";
				rule succeeds;
	say "The soldier coughs weakly, struggling to comprehend your question. 'I... I don't know...' they whisper before slumping further."
	
The Armored Knight is a person in the Lower Asylum Hallway. "A towering figure in battered armor stands here, leaning heavily on a massive sword. The helmet obscures their face, but their posture suggests exhaustion rather than hostility." The description of the Armored Knight is "The knight's armor is dented and scratched, evidence of countless battles. Despite their worn appearance, they radiate a sense of quiet strength.". Understand "figure" or "armor" as the Armored Knight.

Table of Knight’s Weapons
topic	weapon	reply
"greatsword/sword/weapon"	greatsword	"'A weapon of great strength,' the knight says, handing you a massive greatsword. 'Wield it with care.'"
"dagger/knife"	dagger	"'A swift and silent tool,' the knight says, handing you a sharp dagger. 'Strike true.'"
"bow/arrow/range"	bow	"'A ranged weapon for the precise,' the knight says, handing you a sturdy bow. 'Keep your distance.'"
"axe/hammer"	battle axe	"'A weapon of raw power,' the knight says, handing you a heavy battle axe. 'Use it wisely.'"

Armament is a truth state that varies. Armament is false.

A greatsword is a thing. The description of the greatsword is "A massive blade, dull but deadly. It requires both hands to wield effectively."

A dagger is a thing. The description of the dagger is "A short, sharp blade, ideal for quick strikes and silent kills."

A bow is a thing. The description of the bow is "A finely crafted bow, made of aged wood and strung with strong sinew. Ideal for attacking from a distance."

A battle axe is a thing. The description of the battle axe is "A heavy axe with a sharp edge, capable of cleaving through enemies with brute force."

After asking the Armored Knight about something:
	repeat through the Table of Knight's Weapons:
		if the topic understood includes topic entry:
			let the chosen weapon be the weapon entry;
			if the player does not carry the chosen weapon:
				now the player carries the chosen weapon;
				now Armament is true;
				say "[reply entry]";
			otherwise:
				say "'You already have the [chosen weapon],' the knight says, gesturing to your inventory.";
			rule succeeds;
	say "The knight tilts their head slightly, as if trying to comprehend your words. 'I do not understand your request, I can only give you the spare weapons I have on me,' they say finally.";

Understand "ask [someone] [text]" as asking it about.

Instead of examining the Dying Soldier:
	say "The soldier's eyes flutter open briefly, filled with pain. They manage to whisper, 'Beware... the demon... it guards the way...' before slumping back against the wall, too weak to continue."

The health vial is a thing.

A health vial can be full or empty. The health vial is empty.

The description of the health vial is "[if the health vial is full]A small, glass vial filled with a glowing red liquid. It radiates warmth and vitality.[otherwise]An empty glass vial. The faint residue of glowing liquid clings to the sides. It can only be refilled with the help of a bonfire."

Using is an action applying to one thing. Understand "use [something]" as using.

Check using the health vial:
	if the player does not carry the health vial:
		say "You don't have the health vial to use.";
		stop the action;
	if the health vial is empty:
		say "The health vial is empty. It can only be refilled at a bonfire.";
		stop the action;

Carry out using the health vial:
	if the health vial is full:
		if Injured is true:
			now Injured is false;
			now the health vial is empty;
			say "You drink the glowing red liquid from the health vial. A soothing warmth spreads through your body, and your injuries begin to heal. You feel rejuvenated.";
		otherwise:
			say "You drink from the health vial, but since you are unharmed, it has no effect. The liquid is wasted.";
			now the health vial is empty;
	otherwise:
		say "The health vial is empty. You'll need to refill it at a bonfire.";


Instead of attacking the Dying Soldier:
	if the player carries the health vial:
		say "The soldier is already fading. There's no need to attack them further.";
		stop the action;
	otherwise:
		say "You strike the dying soldier, and their body falls limp to the ground. As they collapse, a small vial rolls from their hand.";
		move the health vial to the player;
		remove the Dying Soldier from play.

Instead of taking the Dying Soldier:
	say "The soldier is far too weak to move, and their battered body would not survive the attempt. Perhaps you should get some information off of him while he's alive."
	
	







