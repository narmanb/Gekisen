 /*
- You can no longer subtract from your multis to add all of your points into one stat, you can still go over the 10 limit, but only with your available points<br>
* This is a pretty big change, so counting on people who are actively playing to rebirth, especially you made a glass cannon with 20 points in one multi, I'd like to avoid manually editting anybody<br>
* If this is hugely unpopular I may change it back, but I think this is a good change for PVP. And if next wipe there isn't unlimited stat points with rebirthing, I will definitely add subtraction back for the multis. I don't want to have it be exactly like this forever, but up to you guys<br>
*/
mob/var
	textcolor
	textcolorname
	list/Ignored[0]
	textsize = 1
mob/var/opendialog=0
var/const/Updates = {"
<body bgcolor="#000000" text="#FFFFFF">
<font face="Tahoma">
<html>
<head><title>Update 5.5</title></head>
<body>
<font size = 6/22/2022<br><font size = 1>
- Scoreboard now shows commas<br>
- PVP Flag timer counts down 4x as fast<br>
- Various bug fixes<br>
<font size = 4/16/2022<br><font size = 1>
- New HUD added, incomplete, can disable or enable in options. Can be dragged around anywhere on the screen<br>
- Rebirth limit set to 30<br>
- Stat multis adjusted<br>
<font size = 4/16/2022<br><font size = 1>
- New HUD added, incomplete, can disable or enable in options. Can be dragged around anywhere on the screen<br>
- Rebirth limit set to 30<br>
- Stat multis adjusted<br>
<font size = 4>2/2/2021<br><font size = 1>
- Goku Boost reduced to 20% (from 100%)<br>
- Elder Kai boost added, 80% boost level 200k requirement<br>
- Hercule boost changed to give to stat bonuses, with a bit of randomness, you will get at least 1,000 to all stat bonuses<br>
How much you get is also influenced by number of rebirths and mode number<br>
<font size = 4>2/2/2021<br><font size = 1>
- Omega Weights added. They only drop from Beerus mobs<br>
- Dual Train now benefits from the gravity room<br>
- Small island of Omega Nameks added to yardrat<br>
- Exploding mobs level increased so high level players can keep mobbing them<br>
- Level 500k soft cap removed from beerus mobs<br>
- Various bug fixes<br>
<font size = 4>2/2/2021<br><font size = 1>
- HBTC gains are now in safe zone. Meditation is still better in HBTC (have some plans for HBTC)<br>
- Spar ticks changed, they go off of what you concentrate are, and are 2x that of FT<br>
- Finisher moves (corrupt, absorb, etc) now give between 5-20 stat bonus instead of adding to stats directly<br>
- Punch damage slight buff in PVP, is still nerfed below default 100%<br>
- While pvp flagged, you cannot IT to any NPCs. Just a preset spot and other flagged players(probably going to expand on this, unless I go through the NPCs and make a list of which ones to disallow while flagged)<br>
- Mystic Half Saiyan final form is now Mystic, not SSJ3<br>
- Androids have to walk snake way now<br>
- Shards give more stat bonus<br>
- New Shield Smash sprite<br>
- Various bug fixes<br>
<font size = 4>1/22/2021<br><font size = 1>
- Minimum punch and projectile damage is now 1, HBTC damage reduction removed<br>
- Ki attacks no longer cost ki, just stamina. Might go through these later and make some of them cost ki, such as the 3 tile bomb and homing attacks<br>
- Mob stats guide and new trans requirement/multi guide in game (thanks Human) they are both under Mob Stats guide, will see if I can directly bring up the trans guide tab via a link later on if not will either combine all into 1 or separate these 2<br>
- Party level restrictions removed, will probably switch it back on at the start of each wipe and turn it off half way thru in future wipes (exp allocation still needs changed)<br>
- Disabled punching other players while in the air<br>
<font size = 4>12/22/2020<br><font size = 1>
- Shards now add to your stat bonus instead of stats. (2,5,10,20)<br>
- Stat bonus is now calculated further down the line in stat ticks, this will make them more pravelent, especially on rb<br>
- Using buffs on others will no longer wipe your xp, now gives xp, and is a bit more useful<br>
- Shield Smash range increased by 1 and cooldown slighlty reduced<br>
- <br>
- <br>
<font size = 4>12/22/2020<br><font size = 1>
- Shield Smash, defense based projectile (25% Defense * Durability/100) learned at level 30k, has a slightly longer CD than Iron Fist<br>
* Temporary icon, new one incoming<br>
- Beerus mobs will now correctly respawn individually<br>
- Defense multi now effects how much damage you recieve in Beerus zone. With a multi of 1-4 the damage is the same as it was before with everybody, and with a multi of 19 or above, the damage can be as low as 4$ or high as 10% per hit<br>
- Invert 1 requirement lowered to level 20k<br>
- Explosive Wave ki cost lowered<br>
- Explosive Wave will now cast twice as fast as  before<br>
- Ki Power is no longer part of Explosive Waves formula<br>
- While in spar stance, all techniques, including 3 tile and rapid fire, should work correctly<br>
* I haven't tested this myself, any issues let me know<br>
* Once I'm sure this is good, a new tournament will be introduced, which forces spar stance on all participants<br>
- Power wish for BSDB increased<br>


<font size = 4>12/18/2020<br><font size = 1>
- You while now gain TP equal to FT gains while dual training<br>
- Several bug fixes<br>
<font size = 4>12/16/2020<br><font size = 1>
- Explosive Wave is now around the strength of a single SEW wave, but still powerlevel based<br>
- Dual train is back, it no longer drains stamina, however the tp gain is gone and each person gets xp and stats based on their own level, should be better than ST for leveling up<br>
- Kamenian evil forms fixed, evil form 1 was missing, added it and shifted the other forms by 1<br>
- Tournament rewards increased, now they give exp based on your xp to next level, so people can join them while banking xp<br>
- ZP vendor extra inventory option cost reduced to 10 zp<br>
- Various bug fixes<br>
<font size = 4>12/9/2020<br><font size = 1>
- Kamenian forms added. Each form has a different icon for good/evil alignment<br>
* Form 1 at 20k, 2 at 60k, 3 at 135k, 4 at 200k<br>
- ZP Vendor added. Buy +1 kill per kill, extra modes that carry over to future rebirths, and extra inventory space<br>
* If anybody has any suggestions of more things to add, either let me know or post on the discord in suggestions. I would definitely like a couple more options<br>
- Beerus mobs stop giving levels after 500k, you still gain stat bonuses<br>
- Beerus mobs now drop zp shards<br>
- Brolly Suit from bank quest stats changed. Exact stats in suit guide but it's now the best suit for durability. It's a very hard quest, but have verified it's possible to beat with a low defense multi before level 200k. Don't just go running in, think about things you could use.<br>
- Gravity damage has been drastically toned down<br>
- Meditating in HBTC or gravity has increased skill gains. HBTC is 1.5x gains while gravity is 2x<br>
- Peaceful mobs have been toned down to avoid future Yamchas. This does not include the pushy bank security<br>
- Kaioken changed: <br>
* Any stamina under 100 max kaioken is 5. 1,000 stamina is 10x kaio, with +1 kaioken level each 200 stamina until you max at 20x at 3,000 stamina.<br>
* You can also use kaioken at 40% powerlevel, instead of 50%<br>
* Kaioken power increased by 25% to compensate. It's potentially a buff depending on how you build<br>
* I felt that stamina should matter more with kaioken. If a lot of people are unhappy with this it might change back<br>
- Several bug fixes<br>
<font size = 4>11/30/2020<br><font size = 1>
- Stat bonuses can be earned again. Earn them slowly via ST or FT (FT is a bit more frequent) and also can increase them by mobbing at Beerus. They don't reset when you rebirth. They are supposed to be gained extremely slowly and may need adjusted<br>
- New race, Rebrianne, is an Alien type and cannot select until you are on your third rebirth<br>
- Moro now has a second transformation, first form is at 50k, second is at 150k<br>
- Kamenian now has 5 total forms, but the appearance of the form depends on your alignment<br>
- XP gains for self training have been drastically increased outside of HBTC. They're still a little bit better in HBTC but not a lot<br>
<font size = 4> 5/24/2020<br><font size = 1>
- New Demon gene, Fomhoire, non perm with transformations at 25k, 85k, 150k (graphics by Ryu)<br>
- Beerus Planet and zone are in, at the moment there is only 1 zone in the cave, although it is quite large<br>
* Talk to Whis to travel between Planets<br>
* More floors will be added at a later date<br>
* Feedback of any kind is welcome, I expect there will be changes that are needed<br>
* Depending on how this goes, might change the damage they do to players to be percent based<br>
* You gain 50-150 levels worth of XP per kill in here, but better/more rewards will be added later<br>
* Credit to Ryu for making first zone map and mobs<br>
Misc Updates<br>
- SEW is now learned at level 17500 and ES 18000<br>
- You will gain 1 zp every 5k levels<br>
- Master Roshi is now a pervert<br>
- Shadow Spar TP nerfed<br>
- A few bug fixes<br>
<font size = 4> 5/19/2020<br><font size = 1>
- ZP is no longer used on your stats. Instead your stat ticks are based only on your current level, and your stat multis. Ticks have been buffed a bit to compensate for lack of ZP
<br>
- ZP does still exist but the only way to get it is as drops from mobs. It can be spent at Sensei to increase the exp bonus, but now it can be increased up to 500% ZP Shard drop rate may need adjusted just let me know
<br>
- Rebirth requirements are changed, you can now rebirth at 50k, 100k, 150k, 200k, 250k  etc +50k levels after a rebirth with a max of 500k
<br>
- New Roshi gene with 2 unique forms and a 2nd transformation for Android 21
<br>
- New technique, Detonate - You use this to make any of your straight forward projectiles blow up on the spot. For example use it after you shot a 10x and it'll blow up, with splash damage, hitting anything in its wake. If you want a bit more control you can macro it to a key with Released checked. Fire a kamehameha with D  and D+Released will blow it up when you release the key
<br>
- New planet and zone, specifically for players above 200k to gain better levels from mobbing compared to the current in game mobs. This is still a WIP, it's not going to be complete tonight, but it definitely will be for this weekend, it'll be an important place for people to mob after 200k and is my main focus for updates this wipe, as it'll get more floors and mobs, with rare suit drops not obtainable elsewhere. Possibly a new tier above ultra.
And mobbing in the zone is different than mobbing outside. Like exploding mob zones, you can't fly while inside. Mobs pack a punch but are low on health so only a few blasts would be needed. EXP from a single mob is worth a lot more than a single mob
<br>
- Non perm and Invert requirements are now level based. Kaioken buffed as it'll be harder to get your transformations<br>
- Party system added back. If you are below 200k you can invite anybody within 25k levels of your level. If you are above 200k you can invite anybody else above 200k<br>
<font size = 4> 1/27/2019<br>
- Turning off auto leveling is back, this is to accomodate high level characters. Can be toggled off/on in the options<br>
- New Arena (safezone areas removed)<br>
- Hercule Gym buffed (no benefits after level 150k) however HBTC is better at any level<br>
- For the remainder of this wipe, every race can learn Sauzer Blade<br>
- Majin Wizards can now learn Advanced Training<br>
- Game Guide deleted since it is out of date. A new one will be viewable in the same location a basic guide will be in there soon, a detailed one might be made at a later date<br>
- Several bug fixes, specifically a couple with Revert<br>
- SEW cooldown drastically reduced, damage is now based on max ki instead of current<br>
- SSJ5 exp increased, Kid Buu exp decreased<br>
- ZP shard changed to a solid color due to it causing lag if held in inventory<br>
<font size = 1>
<font size = 4> 12/3/2019<br>
<font size = 1>
<b>New Stat System</b><br>
- Powerlevel is no longer directly trainable. Instead powerlevel is based on a combo of your strength, ki, and defense<br>
- 20% strength + 20% ki + 60% defense is your new max powerlevel<br>
<b>Rebirth changes and Zp Cap</b><br>
- You only gain an extra stat point for the first 10 rebirths<br>
- A new character has a ZP cap of 500. They cannot spend Zp beyond that cap<br>
- Cap resets and raises by 100 each time you rebirth<br>
- Upon rebirth you gain zp equal to 10% of all zp ever earned<br>
<b>Kaioken changes</b><br>
- Kaioken now maxes at 20x and automatically uses the highest level available<br>
* Kaioken formula still needs some work it's probably a bit too weak now<br>
<b>Other changes</b><br>
- AFK Training for exp is less effective, specifically in HBTC and hercule gym<br>
- Focus Train stat ticks have been slightly buffed while in HBTC<br>
- Hercule gym only has better gains before you reach level 100k, and they are always lower than HBTC<br>
- Kamenian buff cooldown fixed, event item should now properly delete from inventory at logout<br>
- Party system temporarily disabled<br>
<font size = 4> 10/14/2019<br>
<font size = 1>
- Moro learns a new technique, Mouth Energy Wave, at level 50k. It is similar in power to 10x but wider splash range and longer cooldown<br>
- Kamenian can now learn:<br>
* Regeneration<br>
* Buff Powerlevel, Buff Defense, Advanced Training<br>
* Damage Field<br>
- Yardrats can now instant transmission faster than other races, both to npcs and players, and even while flagged for pvp<br>
- Can now use buffs before and after kaioken, but buffs now calculate based on your max stats, not current. This pretty much has the same effect as before, except kaioken will not strengthen the buffs<br>
- Bug with energy barrier fixed<br>
- Can no longer enter exploding mob zones while stats are buffed<br>
- Event Item added<br>
* Item Search item, number and icons set by admin, announces to server when one is picked up. Also announced when they drop one, and dropped/announced at logout<br>
- Android 21 male type fixed<br>
<font size = 4> 10/8/2019<br>
<font size = 1>
New races (under Alien gene)<br>
- Moro<br>
- Lycanthrope (can choose between all 3 of them)<br>
- Yardrat<br>
- Kamenian (non canon, a mix of a kai and a namek)<br>
None of these races have  any unique techniques yet, and they all have a non perm transformation (a couple of them need their own unique aura in the future) their transes are slightly better than other non perms, but not enough that you'd want to RB if you have stopped RB'ing<br>
- Afterlife Goku and Whis npc boosts changed to percent based,  Goku is 15% and Whis is 30% right now it is best to use them while transformed but this may change next wipe<br>
- New command for party leaders to move a party member to bottom of the party without anyone needing to relog<br>
- Stat ticks for killing mobs, and for sparring another player have been increased by 2.5x<br>
- Can no longer stack buffs with kaioken<br>
- Potential quest points from killing cell jrs has been increased<br>
- Being flagged for PVP is now 3 times as long<br>
<font size = 4> 8/19/2019<br>
<font size = 1>
<b>Sparring Stance</B><br>
Sparring stance allows you to match your power to your opponents. When it is turned on, your damage isn't dependent on your stats, rather it is percent based, how much depends on which ability. For example, punch may do 2% damage to your opponent, sword attack 5%, projectiles 5-10%<br>
Turn this on and have a sparring partner (or multiple partners) turn it on as well, then no matter what your stats are, you can fight each other on almost equal ground, gaining stat ticks in the process<br>
* This is still incomplete, just decided to put it in to get some feedback. It doesn't work with 3 tile wide attacks and rapid blast like attacks (yet)<br>
* Stat ticks from sparring also likely need increased, will increase them to a point where it's definitely better than FT, just want people to spar some and get some feedback<br>
* Spar Stance will be used in other things when it's completed, in particular a new tournament to the rotation, a skill tournament, where sparring stance is entered automatically<br>
* This is still a work in progress, mainly need some QoL things but any suggestions just let me know<br>
<b>Hercule Gym</b><br>
- You can enter the Hercule Gym at level 20k<br>
- Inside the gym, self/focus train exp gains will be equal to HBTC, and stat ticks will be 10% weaker than HBTC, until level 200k, after that, ST/FT in there is the same as any other place other than HBTC<br>
* There are a few punching bags in there, they give you exp/powerlevel when you attack them, but at the moment they'll be pretty useless. Will get around to making them a worthwhile training method, just added the basics today<br>
* The Gym is pretty bare and ugly, I'll improve the look and add other equipment in the future, just wanted to get it added quickly for training verbs<br>
* Gym is located in the small building below safe zone, and is a safe zone itself<br>
<b>Other updates</b><br>
- Ticks from sparring have been increased, they might need to go higher still, but this is a start<br>
- You can now buy inventory space with quest points, +25 at a time for 5k QP, can purchase twice<br>
- Work on a new HUD has begun, will implement the whole thing just don't have all the icon states divided yet. Instead of the HUD updating every 10%, it will update every 1%<br>
* HUD is temporarily disabled until new HUD is finished<br>
- Some NPC icons replaced (credit to Ryuu)<br>
- You should no longer be able to enter a guild house when flagged for PVP<br>
- Damage Field should no longer get progressively weaker with his successful hit<br>
<font size = 4> 8/12/2019<br>
<font size = 1>
- Gluttenous Androids can learn candy ray now<br>
- Konat Brave Trans now adds weapon skills to current and bonus, not maximum, to prevent keeping those bonuses after a RB<br?
- Several other bug fixes (with HBTC entrance, IT out of HBTC now not possible, Exploding Cells weren't respawning properly if they self destructed)<br>
<br>
<font size = 4> 8/7/2019<br>
<font size = 1>
- HBTC/IT bug fixed<br>
- Gluttonous Androids can use mega chips now<br>
- Splash damage now has a minimum of 1 damage<br>
- Splash damage before defenses is around 50% damage of most techs<br>
<font size = 4> 8/6/2019<br>
<font size = 1>
<b>HBTC changes</b><br>
- Afk training is only +20% as effect for stat ticks (exp/tp gains are still the same)<br>
- Sparring in the HBTC is another way to gain stat ticks<br>
* When you hit a sparring partner, you have a chance to gain offensive stats, when you get hit, chance to gain defensive stats<br>
* You might want to turn lethal off when having a friendly training match with someone<br>
* You can spar anywhere in the world and gain stat ticks, but it is more effective in the HBTC, and when in HBTC damage is reduced to <b>10%</b><br>
<b>Other updates</b><br>
- Stat ticks from mobs have been increased<br>
- Splash damage now correctly calculates for defense (might need to buff it a bit now)<br>
- 3 new suits added to Quester<br>
* Videl Saiyaman Suit, Green Lantern Suit, and Saitama Suit(icon by Banto)<br>
- New aura for SSJB<br>
- When you rebirth you will now keep Cell Zone key<br>
<font size = 4> 8/4/2019<br>
<font size = 1>
<b>Assigning points into multis has been changed</b><br>
- There is now a limit to how many points you can have in a single stat<br>
- The limit by default is 10, however each time you rebirth, the limit raises by 1, so first rebirth, it's 11 points, then second rebirth it's 12 etc<br>
* Did this due to some players reducing all of their multis to 1, except one, and then they'd pour all of their points into their strength/ki, creating extremely powerful glass cannons<br>
* To anybody who has done this, please rebirth when you can. I really don't want to go and edit peoples stats and/or multis to fit with this<br>
- SSJ Rose aura added (credit to Banto, more will be added in next update)<br>
- TP effectiveness has been reduced, if this is too low I'll increase it, but I think it'll be fine, it was too OP<br>
- Rebirth bugs fixed, including being able to learn kaioken after a RB, and your mode not setting itself to 1 when you get your first level rank<br>
<font size = 4><b>Version 4.0</b><br>
<font size = 1>
5/26/2019<br>
<b>Rebirth System</b><br>
- Rebirth into a new, more powerful character. Each time you rebirth you gain +1 stat points, starting at 5 points, 6 at rebirth #1, 7 at rebirth #2 etc<br>
- When you rebirth you choose a new race/gene and set up your stat multis again<br>
- Your level and stats return to what they are on a new character<br>
You keep<br>
- Modes gained from resets<br>
- Your inventory<br>
- Overall skills<br>
- Guild, guild title/rank<br>
You lose<br>
- Stats/level<br>
- All techniques/transformations<br>
- Zp bonus in stats, all spent and unspent ZP<br>
- Rank and boosts reset<br>
- DB wishes set to 0<br>
Rebirth requirements:<br>
- First rebirth: level 100,000<br>
- Second rebirth: level 150,000<br>
- Third rebirth and on: level 200,000<br>
<b>Other updates</b><br>
- Zp spent at yardrat has been nerfed<br>
- Chance to gain a stat tick when killing mobs (normal mobs only)<br>
- TP has been made more effective at yardrat (probably adding option to spend on exp, after I find a good balance)<br>
- Levels gained from exploding mobs reduced<br>
- Exp from concentrating on exp has been buffed<br>
<font size = 1>
<font size = 4> 7/12/2019<br>
<font size = 1>
- New Changling gene, Regalis. Powerlevel based (King Kold)<br>
* Icons by Ryuuchi and Banto<br>
- New Android gene, Gluttonous. Str/Ki based (Android 21)<br>
* Icons by Ryuuchi<br>
- New Tuffle gene, Venerable. Semi Perm, Powerlevel based<br>
* Icons by Ryuuchi<br>
- Damage has been reduced for most techniques by about 30%<br>
- Toggle Lethal now effects projectiles and splash damage<br>
- Trying out different AI for exploding mobs<br>
- Stamina cost for ki attacks reduced by around 50%<br>
- Stamina cost for Zanzoken and After Image reduced, Zanzoken now costs half of what After Image costs<br>
- Renamed a few techniques (that interferred with macros)<br>
<font size = 4> 6/23/2019<br>
<font size = 1>
- Sword Attack power doubled<br>
- Small tweaks to dual train<br>
* The experience gained while dual training, is based on the person who initiated the dual training, so a higher level player could help level up a lower level player<br>
* Both people get stat ticks based on focus train stat ticks<br>
* Both people get much more TP than other forms of training<br>
* There is a small stamina drain with dual train, so you do have to rest occasionally, however it has been lowered and is pretty low<br>
- Exploding mob zone rewards now correctly work<br>
- Fixed small issue with equipment drops<br>
<font size = 4> 6/22/2019<br>
<font size = 1>
- New technique, <b>Focus Step</b><br>
* Learn at level 10k, to use, hold shift and hit an arrow key, it'll teleport you a few tiles in that direction, leaving an afterimage effect<br>
* Can not be used while in the air<br>
* Costs a small mount of ki, when flagged for pvp, costs stamina<br>
- New gene, <b>Rageful Half Saiyan</b> icon made by @LegoMyEggo and Banto<br>
- Enchanted weights for weapon, weapon power, and weapon resistance will now be dropped by mobs<br>
- New black turban icon (credit to Banto) so when a Turban drops, when it is colorized it will look much better<br>
- A couple things changed/removed to improve game performance (including a change to exploding mob AI)<br>
- Some bug fixes (including an equipment related one, several of which have been fixed lately thanks to Spada and Ippo)<br>
- Trace nuke can no longer be used in exploding mob zones<br>
- ZP rewards from Quester no longer limited to 8 purchases, however the final tier is extremely expensive<br>
- Goku Black suit can now be bought with Quest Points (same suit that Zealot Kais get when they wish for Goku Body)<br>
- Custom Scouter can now be bought with Quest Points, can choose custom color<br>
- Bubbles/Gregory catch/hit verbs now in Combat Tab<br>
- Sword Attack cooldown slightly reduced<Br>
<font size = 4> 6/17/2019<br>
<font size = 1>
<b>New techniques</b><br>
- Triple Ki Blasts: Fires 3 ki blasts with splash damage in a 3 tile wide area. Fairly costly to use, costs more in Explosive mob zones. Learn at 100 ki control<br>
- Trace Nuke: Fires a blast that when in range of another player explodes, forcing the damaged player to land if they are flying. Learn at level 100k<br>
* You can use this in the air yourself, if you are chasing someone (you can also punch someone while flying to make them land)<br>
* Low damage, exists when in pursuit of a target<br>
<B>On Screen HUD</b><br>
- The onscreen hud can be dragged anywhere on your screen<br>
- Can be toggled off and on in options<br>
- It doesn't update on timers, instead it updates manually only when your PL, KI or EXP changes. This makes it update immediate, and is more optimized than running on a quick timer, but I may have missed some stuff so let me know<br>
- PL and KI have states for every 10% up to 200%, if your PL or KI is above 200%, it'll be the same state as the 200% one<br>
- The EXP bar doesn't have any states above 100% exp<br>
- The Dragonball will turn blood red when you are flagged for PVP<br>
<b>Shadow Spar</b><br>
- Arrows appear above your character, hit the correct arrow to gain a bonus while you train with an image of yourself (feedback is appreciated)<br>
- You'll gain more experience, tp, and zenni. You will gain stat ticks based on self train ticks, but you might gain them a lot faster, depending on how quick you are<br>
- The further you go in a shadow spar combo, the more experience you'll get. The bonuses cap at 500 but if you don't mess up you can keep that going. 500 makes your exp ticks 5x of the default from self train (again, you could get these quicker than just normal self training)<br>
- You'll gain a ZP every time you hit 1000 in a combo<br>
- If you mess up, your combo will go away and you'll have to start from the beginning<br>
- The gravity room and HBTC, along with shards and other exp bonuses, all effect shadow sparring<br>
<b>Other updates</b><br>
- <b>Auto Target</b> command added to Combat tab. Automatically sets your target to the closest mob/player<br>
- Choose Target menu changed, cancel is at the bottom<br>
- While targetting a mob/player, you no longer need to be 3 tiles away to auto-aim in their direction<br>
- Super Kaioken has been weakened, but the drain has been reduced as well<br>
- Sword attack range slightly extended, will pierce ki attacks<br>
- Iron Fist speed increased<br>
- Beginnings of piercing attacks implemented, if two piercing attacks hit each other, they both blow up, if only one of them is piercing, it'll go right through the non piercing one<br>
- Text color verb replaced with Text Options, you can now have <b>colored names</b><br>
- Options to disable guild invites and shadow spar info<br>
- Exploding mob agro range reduced slightly<br>
- Finish-type moves (corrupt, drain etc) now have a higher cap and give more powerlevel when used. The cap is much higher when used on players, and lower on mobs<br>
- Some low level, good alignment peaceful mobs added around the city<br>
- Various bug fixes, mostly with equipment and buff type abilities<br>

<font size = 4> 6/8/2019<br>
<font size = 1>
- Mobs in both exploding zones will now respawn individually, instead of each group on their own list, this should help with both lag and getting jumped at a respawn<br>
- Exploding Cells slowed down a little bit<br>
- Hetap machines now sell 1 type of Hetap, a bottle instantly heals you and increases your current stats by 2x of your potential. However you are "full" longer than a senzu bean<br>
- Two new swords were added, obtainable with quest points. Like the Z Sword/Demon Blade they increase how much exp you gain while training however they are more effective than both<br>
- A couple of helpful NPCs added, with information around the area they are stationed<br>
- AoE Field Technique cast time reduced<br>
- Suit prices drastically reduced from suit shopkeep (Prices in suit guide updated)<br>
- Block IT option is back in Technique Options, however it only works when you aren't in PVP. While flagged for PVP people can IT to you regardless of the setting<br>
- Server zenni bonus fixed<br>
- Can now hit players standing on water with beams/blasts without being directly beside them<br>
<font size = 4> 6/3/2019<br>
<font size = 1>
- Exploding Cell Zone changed, not as empty/massive<br>
- Exploding cells are a bit faster than exploding saibas<br>
- Fixed bug where you could zanzo/after image and not trigger the right AI for these mobs<br>
<B>AoE Field Techniques</b><br>
- 3 techniques added, Damage Field, Heal Field, Slow Field<br>
* Damage Field damages all mobs in the area except the caster (PL based damage)<br>
* Heal Field heals caster and any party members when inside the field (heals percents not based on stats)<br>
* Slow Field slows down all mobs while they are inside the field, except the caster<br>
- Only Pure Blooded Kai knows heal field, only majin wizards know slow field<br>
- Saibaman, tuffles, humans, pure blooded kais, and majin wizards know damage field<br>
<font size = 4> 6/2/2019<br>
<font size = 1>
<b>Exploding Cell Junior Zone</b><br>
- A new building north of exploding saiba zone is added, you must obtain entry by buying a key with quest points<br>
- The new zones suicidal cell juniors give up to 2x the quest points of exploding saibamen, and up to 5x the experience/levels<br>
- They are a bit more likely to drop ZP Shards than any other mobs<br>
- a new quest npc, Injured Half Saiyan, is outside the zone, giving 2 quests similar to the other zone<br>
- This zone is bigger than the exploding saiba zone, but if you want you can run to the exit quicker, slightly less linear if you don't run that way<br>
- The exploding cells have a potential blast range higher than  exploding saibas<br>
* Note: While functional certain things need worked, in particular the cell junior icon<br>
* For this wipe, buying the key is cheaper than it will be in the future, since it was added after the fact<br>
<b>Power Up changes</b><br>
- Power up options located in Technique Options<br>
- Allows you to change your maximum power up potential (from 100-150%)<br>
- Can also change how long it takes to cooldown from reaching maximum power<br>
- Power up is now SLIGHTLY slower<br>
- Power Down command changed, now you reduce your stats to a percent of your choosing, instead of a number. And it reduces all 4 of your stats<br>
<B>New Character changes</b><br>
- New Changling gene, Vindictive, is Cooler based with a form beyond Golden even (thanks to Ryuuchi)<br>
- Feline now has a second graphical option, Chaotic, which is a dark version of the default (thanks to Ryuuchi)<br>
<b>Misc Updates</b><br>
- Concentrate stat ticks on EXP has been increased (though most don't focus on EXP and it's not a huge increase)<br>
- Some bugs fixed<br>
- Certain NPCs you won't be able to IT anymore when you're flagged for PVP<br>
- Some changes that will hopefully improve performance<br>
- Candy ray has been moved over to new projectile system<br>
- Superman suit has been reduced in price, since it's not very useful for most builds<br>
- You will now recieve the proper amount of levels from exploding zone mobs (more than before, cells worth more than saibas still)<br>
<font size = 4><b>Version 3.5</b><br>
5/26/2019<br>
<font size = 1>
<B>Customize your own build further!</b><br>
- At character creation, you can add/subtract points into your four stat multis, which effect level up gains and stat ticks. And optionally use points to increase your max stamina (up to 2000)<br>
* Note: increasing max stamina is useful for almost everything. Punches, projectiles, techniques. But mostly 1000 should be fine. However, having more stamina will allow you to fight longer without resting, and having extra stamina is extremely helpful for techniques like Kaioken, Regeneration, and Ki Shield<br>
* Stamina will also effect kaioken limit<br>
* Resting will take the same amount of time no matter how much stamina you have<br>
- Ki defense is no longer a trainable stat, instead, it is now integreted into defense (may need some adjustments)<br>
- At the moment, you won't be allowed to change your multis after you set them at the beginning, but ZP is still around to use<br>
<b>Other Changes</b><br>
- Stat tick formula changed, character level effects on stat ticks will cap at level 200k<br>
- Biological Androids can now choose between green and blue color scheme at character creation (thanks to Ryuuchi)<br>
- Killing a player will now net you exp in part based on your level and their level. Might need to change this some more, but it's more rewarding than before (although not rewarding for a high level to kill a low level)<br>
- Some mapping changes. Safe zone is different, expanded one of saiyan warrior islands, added Arena northeast part of namek anyone can use<br>
- Ki damage has been raised by 15%<br>
- Ki defense shards are no longer in the game, instead they have been replaced by ZP shards, they give a random of 1-5 ZP each use. However they are rare, especially from lower level mobs<br>
- Mr Popo prices changed. Training point crits are 2 mil a piece, ZP Crits 5 mil, Stat crits 10 mil<br>
- You will now gain 25 ZP at 20k kills, but only for your first 3 resets, then it'll switch to training points<br>
- 25k and 30k kill rewards lowered to 50 and 100 ZP each<br>
- After mode 25, you won't get a better bonus from spending zp at yardrat. However TP doesn't have this cap<br>
<b>Dragonball Changes</b><br>
- Earth dragonballs you can use as many times as you want, but the rewards are lower. Earth ZP wish is random between 1-10. Power is potentially helpful early on<br>
- ZP wish on Namek and BSDB has been increased and requirements to hit the max lowered<br>
- DragonRadar text has been slightly updated. Now it'll tell you if a player is holding a DB, what direction they are from you, or and if needed which planet, it will also tell you which ones you are holding onto(will work on the graphical radar later)<br>
* At level 150k you stop gaining more ZP from the Namek DBs and Level 300k is when you won't gain anymore ZPs from the BSDBs<br>
* Summoned Dragons won't stick on a character anymore, they'll apply to a turf instead<br>
- Wishing for Goku Body will now take a BSDB wish, and SSJRs multi has been raised back up to 75x. Also, cut the level requirement for SSJR down to 50k<br>
<b>Kaioken Changes</b><br>
- Kaioken has a new aura (thanks to Banto)<br>
- Kaioken "builds" are possible. You can still stack it on your transformation but you don't have to be stuck at 20x limit<br>
- Raising your stamina increases your kaioken limit, 1200 stamina = 25x, 1400 = 30x, 1600 = 35x, 1800 = 40x, 2000 = 50x, and if you also use your BSDB wish to increase your stamina by 1000, besides have 3x base stamina you'll be able to do 100x kaioken<br>
- You can also attempt to use kaioken beyond your maximum limit. Before it would immediately KO you, but now, it can work. How likely it is to work depends on how far over you go, and if it fails, it will instant KO you<br>
* I don't think kaioken will be too OP since the higher kaioken # you go the more stamina you lose too, but some adjustments might need to be made<br>
<br>
<font size = 4> 5/17/2019<br>
<font size = 1>
<B>Exploding Saibaman Zone Changes</b><br>
- The amount of quest points obtained from killing mobs has been increased (you will get 1-5 per kill)<br>
- Total experience gain from killing a mob increased (will get 1 level for sure, but can get around 3 levels per kill)<br>
- Chance of gaining stats from a kill increased from 10 to 25%<br>
- There is a small chance you obtain a ZP from killing a mob<br>
- Boss Saibas removed (for now) added some more exploding saibas to make up for it<br>
- New respawn method<br>
- Quest points awarded for exiting the zone are now based on how many kills you got (roughly half of that runs kills)<br>
<b>Quest Points</b><br>
- Lowered the price of various rewards<br>
- Can get multiple modes using QP now (cheapest being 10k QP, which should be easier to get now that exploding saibas give more per kill)<br>
<b>Misc. Updates<b><br>
- Each SEW wave range has been increased by 1<br>
- Altered punch animations (to see if the rare graphical bug still occurs)<br>
- A message now displays when your fatigue is at 80% or above while in Kaioken<br>
- If you are below 25% PL while gravity training, a red warning will now display<br>
<font size = 4> 5/8/2019<br>
<font size = 1>
- Stat ticks while gravity training has been made more effective<br>
- Health drain while gravity training has been slightly decreased<br>
- Stat gain from killing an exploding saibaman has been slightly increased, frequency changed from 5% to 10%<br>
- A couple bug fixes<br>
<font size = 4> 5/5/2019<br>
<font size = 1>
- Increased minimum damage for ki attacks<br>
- Slightly lowered SEW cooldown<br>
- Punch cooldown now has a minimum and maximum, still based on your melee skill<br>
- Gravity training is now more effective for EXP (self train especially)<br>
- A few bug fixes<br>
<font size = 4> 4/30/2019<br>
<font size = 1>
<b>Exploding Saibaman updates</b><br>
- New quest from Injured Saiyan<br>
- Mode + 1 option buyable with quest points<br>
- Potential stat gain from killing a mob has been increased, as has the cap<br>
- Regeneration has been somewhat nerfed while inside the zone<br>
- Power up nerf has been changed, it's now 15% more effective while in the zone<br>
- Exploding saibas will now respawn individually when the timer is up, in an attempt to prevent players from freezing<br>
- A few rare giant red saibamen have been added. They spawn small exploding saibamen when they have a player targetted, while keeping a bit of distance. These have about 75% of the powerlevel of SSJ Roses, although they won't physically attack you, if you can't kill them it might be a good idea to run<br>
* These give a lot of experience if you can kill one<br>
- A special effect has been added to indicate you have been damaged by an exploding saibaman<br>
<b>Gravity Training</b><br>
- The gravity chambers are open up again, however the way they work has been changed<br>
- Each room lets you set the gravity to one number. Room 1: 100x  2: 200x  3: 300x  4: 500x<br>
- You must either self-train or focus-train while in the gravity room to have it have any positive effect on your stats. While training, your exp, tp, and stat gain are increased, based on the level of the gravity<br>
- Each pull of the gravity, you will lose a percent of your health. The percent is based on the level of the gravity<br>
- You will also lose a very small amount of stamina<br>
<b>Kaioken Changes</b><br>
- Kaioken is now usable by any race even transformed/inverted<br>
- The stamina drain has been increased, and is based on what level of kaioken you use<br>
- If you get KO'd by kaioken you will stay KO'd longer, and when you wake up, you will be at very low health<br>
- You must have 50% of your base powerlevel to use kaioken<br>
- When you stop using kaioken, you will be taken to 25% of your base stats, despite where you were before(may change this later, but it kind of makes you commit to using it, instead of using it for a brief few seconds)<br>
- You can now use rest while in Kaioken, however you will recover stamina much slower<br>
<b>Other updates</b><br>
- Dragon Tips have been updated<br>
- Can no longer rest and zanzo at the same time<br>
- A change to powerup so that while you're on the cooldown, if your PL/KI/etc falls way below your base, it won't automatically heal you to 100%<br>
- Power Up speed has also been lowered a bit (this can be useful, if you stop powering up before you hit 150% of your base, then you don't have to let it cooldown before you can use it again<br>
- Rest will now heal powerlevel but only while your powerlevel is under 50% of your base<br>
- How fast resting heals your stats has been decreased (including stamina, but only barely)<br>
- Rewrote skill level up functions so equipment that adds to those skills will be taken into account (fixes small, rare bug)<br>
- Several bug fixes<br>
<font size = 4> 4/23/2019<br>
<font size = 1>
<b>Exploding Saibaman Zone</b><br>
- In this zone, there are many red saibaman, that will quickly run towards you, and when close enough, they will self destruct, causing a somewhat randomized area around them to be damaged<br>
- The damage is based on the range. The higher the range, the lower the damage<br>
- The damage is percent of your max powerlevel, this means you can mob here in base and still gain rewards, being transformed won't help at all<br>
- Another reason why you can do this in base, is because they only have 2 health and no defenses. Any technique will one hit them, the only exceptions are the AoE techniques, it takes 1-2 hits from splash damage<br>
- There is a kill counter specifically for these mobs, gain 1-2 levels every kill, after you obtain enough kills, the level ups will be slightly less frequent. You can gain more than one level per mob<br>
- There are 3 suits that can be obtained randomly from these mobs (they will go directly into your inventory)<br>
* Great Saiyaman Suit, Spiderman Suit, Megaman X Giga Armor suit<br>
- You will gain 1 exp and very little zenni from killing these mobs, therefore you can't level up party members on these mobs. However, the levels you do gain shouldn't interfere if you are in a party and someone is mobbing normal mobs<br>
- It is recommended that strength users use ki attacks, punching one before they explode is difficult<br>
- The zone is accessible through the old safe zone location, the small building north of the city<br>
- Powering up while inside this zone is only 10% effective<br>
- You cannot fly or IT in this zone<br>
- In order to leave this zone, you must make your way to the exit, on the far west side of the entrance (or die)<br>
- You have a 10% chance to heal a small amount of your PL, KI, and Fatigue when you kill one of these mobs, be sure to keep an eye out on your percents<br>
- There are two NPCs associated with this zone, one that gives a quest is right outside the door<br>
<B>Quest Points</B><br>
- There is an NPC by the dark house in the north part of the city where you can spend "quest points"<br>
* Quest Points are obtained by competing certain quests and killing certain mobs<br>
* The exploding saibaman zone mobs will give you quest points for killing them<br>
- At this NPC, you can spend quest points on certain one time boosts. Certain boosts won't show up in the menu until you have bought lower tiered boosts. More choices and ways to obtain quest points will be added in the future<br>
- There is currently one new suit obtainable with Quest Points<br>
<b>Level Up Issue</b><br>
- A temporary solution for those with high stats that don't get all level up gains while transformed, you can now turn off leveling up in options. When off, your exp % will go up and up, when you are done mobbing, you can revert, turn it back on, and gain 1 level, and you will start gaining all the levels you have earned<br>
* If you turn it off and are already gainiing levels, you will have to wait until your exp dips below 100%<br>
* If you get levels from a tournament or dragonballs, it will automatically turn back on, to avoid any infinite loops<br>
<b>Other updates</b><br>
- Added some new animations (mostly to Punch for visual indicators but also expanded on Power Dash and when something is KO'd it's now more obvious)<br>
- Respawn timer to Yemma (King Kai has no respawn timer) it's only a couple minutes most of the time, although dying in exploding saibaman zone will put the timer much higher<br>
- Emoticons added to chat (thanks to a library from Lummox Jr)<br>
- Quest tab altered<br>
- You can now move after the initial casting of SEW (is useful in exploding saiba zone)<br>
- Auto-face punch damage has been slightly increased (25% to 30%)<br>
- Zanzo/after image now cost no stamina when not in pvp (had it switched to cost no stamina when you are flagged)<br>
- Some ki techniques had their stamina costs reduced, and global cooldown for attacks slightly lowered<br>
- A couple techniques incorrectly triggered double damage in PVP, now it should only trigger when someone is actually using IT<br>
- HBTC now asks you if you are sure if you want to enter<br>
- Changes to the level up function, hoping to work around stats not adding due to high numbers<br>
<font size = 4> 4/17/2019<br>
<font size = 1>
<b>PVP Flagged system implemented</b><br>
- When hit by a player, or when you are hit by a player, you both are now flagged for PVP. Indicator in Vitals tab will display when flagged<br>
- Every attack should flag, if I missed something, let me know<br>
<b><u>While Flagged</u></b><br>
* You are added near the top of the instant tranmission list. IT'ing to a player takes longer than IT'ing to a mob, and you will recieve a text warning when someone is on the way<br>
* If you are flagged, it will take 2x as long to IT away<br>
* If you are hit while attempting to instant tranmission away, you will take double damage and instant transmission will fail<br>
* Flight speed is the same as move speed (faster when not flagged)<br>
* You power up at half speed when flagged<br>
* Zanzo/After Image cost stamina (no longer cost stamina when not flagged)<br>
* Fly cooldown when flagged (no more cooldown when not flagged)<br>
* Flying costs 20% stamina (no stamina cost when not flagged)<br>
* You will not be able to enter any safezones<br>
* You will remain flagged until you are out of combat for around a minute, hitting a player or getting hit again resets the counter (or if you die you are unflagged)<br>
* PVP flagged time is a bit higher if you hit someone, it's lower if you only got hit. However if you hit back, then it resets to the higher time even though you didn't start the fight<br>
* If you logout while flagged, it'll be known in OOC<br>
<b>Punch auto-face</b><br>
- When you use punch, if there isn't a mob or player directly in front of you, but there is one on any of the other tiles right beside you, you will automatically face them and hit them. However, total damage is reduced to 25% (direct hits are not nerfed at all, might adjust this later)<br>
- You do not need to choose a target for this to work, it does this for you<br>
* Given enough feedback I may increase/decrease the percentage<br>
<b>Time Skip changes</b><br>
* Move speed slowed down a bit more<br>
* Can fly while affected however flying and landing will no longer return you to base speed<br>
* Can zanzo/after image when affected, however, there is a large delay between each use<br>
* After your move speed returns to normal, there is a short period of time where you still have trouble with zanzo and flying<br>
<b>Other Updates</b><br>
- Super Saiyan 5 mobs added to Vegeta (somewhat stronger than SSJ4s)<br>
- Some end game mobs defenses were increased<br>
- Rest should no longer reset you to 100% KI if you are above it<br>
- Most attacks now add rage to the player damaged. Some attacks add more than others (like timeskip, will add between 20-35, being the tech that enrages the most)<br>
- Change to the level up function attempting to fix an annoying end game bug<br>
- Character move speed slightly increased<br>
- A couple minor fixes<br>
<font size = 4> 4/14/2019<br>
<font size = 1>
- Many end game mob stats and kill rewards have been dramatically increased (will update again soon to make any adjustments, such as if they are too strong or still too weak)<br>
- Durability gear will now drop from mobs<br>
- Punch minimum damage has been increased from 10% to 20%<br>
- Ki targetting will now not make you auto-face your target if you too close (Must be further than 2 tiles away)<br>
- Ki cast critical hits has changed, now at 100 ki cast, you have a 25% chance to critical hit (raising ki cast passed 100 does raise the odds now)<br>
- A critical ki attack is now +35% in damage (from 20%) and there is a message when you hit a target indicating if your attack was critical or not<br>
- Ki cost for various techniques reduced (I haven't gotten around to stamina reduction on ki attacks yet but will soon)<br>
- Pure Blooded Kais now gain levels when buffing other players (buffing themselves doesn't give the same bonus) If they buff a player a higher level than them, they gain more levels than one lower<br>
- Advanced Training buff has been made more effective for focus train and especially self train<br>
- Ki Absorb technique has been re-enabled. When active, you become fatigued over time, but when you are hit by a projectile, you will gain ki based on the damage. If you are at or above 300% Ki, ki absorb will fail<br>
- Flight speed increased. Zanzo/after image now have a stamina cost<br>
- Executioners Strike stamina cost reduced from 5% to 1%<br>
- Fixed some power up/down/rest related bugs (thanks to Ippo)<br>
- Power down will now only lower your powerlevel, and it won't bring your powerlevel back to base after a few seconds<br>
- Unleash Rage <i>should</i> properly work when not in a tourney (thanks to Satan)<br>
<font size = 4> 4/9/2019<br>
<font size = 1>
- FPS back up to 30<br>
- Targetting range has been increased<br>
- Firing an attack too far from a target no longer resets your target, you keep the same target until you select a new one, cancel, or relog<br>
- Fixed a bug that sometimes occured if you had a target selected and fired at somebody directly beside you<br>
- Power Dash now has a stamina cost, but damage has been increased by nearly 3x (and remember, if you Power Dash through most projectiles, it blows them up and you keep going, you could dash through a direct attack and still hit your target)<br>
- Executioners Strike now costs much less Ki, but has a stamina cost<br>
- Training points are now 5x more effective (mode still effects them)<br>
- Chips and Megachips are now auto used like shards (unless you have the option toggled off<br>
- A couple minor bug fixes<br>
<font size = 4> 4/7/2019<br>
<font size = 1>
- New targetting system implemented. To select a target, double click them, or use Set Target verb in combat. You must be close enough to a target to set it, and if the distance gets too far when you use an attack, the targetting system won't be use. When a target is set, upon firing a ki technique, you will automatically face the general direction of your target before firing<br>
<b>Note: we do not have the diagonal icon states for projectiles yet, so it won't look good until this is finished. However, it doesn't effect the function</b><br>
- Ki cost has been dramatically<br>
- Ki cast critical bonus has been raised from 10% to 20%<br>
- Melee based projectiles (dragon fist, iron fist) now calculate damage based on defense and durability, instead of ki defense and ki resistance like most projectiles<br>
- When you power up to maximum power, you will return to your base somewhat slower<br>
- Stat shards are now automatically used when you pick them up, toggle this off/on in Options<br>
- Stat shards buffed. Large: 50k, Great: 100k, Massive: 200k<br>
- Drop rates have been <i>slightly</i> lowered<br>
- Scoreboard wiped, Kills section is now Player Kills<br>
- Flying delay has been cut in half<br>
- Various bug fixes, major ones include a lucifer bug (thanks to Aed) and Yemma bug (thanks to Sar)<br>
- A few mobs have had their stats adjusted (Golden Oozarus, Power Weighted Androids, Ultimate Android) although end game mobs will likely recieve a boost in an upcoming update<br>
- New Training Modes and Kill ranks guide<br>
- A few updates to admin verbs<br>
<font size = 4> 4/2/2019<br>
<font size = 1>
- FPS has been reduced from 30 to 25, to see if the mass disconnects are influenced by a higher FPS<br>
- Demon transformation bug fixed<br>
- Flying now only costs 5% stamina, but there is a slight delay to fly again after you land<br>
- Exp gain from self train has been boosted slightly<br>
- Energy Barrier now has a longer cooldown<br>
- A couple other minor fixes<br>
<font size = 4> 3/31/2019<br>
<font size = 1>
-Transformations changed, no cycling but can pick form. If you think there's a problem with your trans/multi/etc let me know. You can train again while transformed<br>
- New kai icon for zealot kai gene, if you're a Zealot kai and want it let me know<br>
- Unique hairs for each hair style for SSJR<br>
- Hair color now correctly saves when you transform and revert (you will probably have to visit the Barber one time if you haven't or you may end up bald<br>
- New technique, Energy Barrier, learned at level 45k. Slows you down blocks all damage until it expires or it breaks (its health is based on 2x of your max powerlevel, and it takes reduced damage, especially from melee. But it can be broken. Costs stamina to create<br>
- Taking flight now costs 120 (about 12%) of your total stamina(landing costs nothing) This is another countermeasure for people who like to stay in the air in a fight<br>
- Area of effect damage from projectiles and SEW should force a flying player to land<br>
- Unleash Rage has been buffed, also you gain a very small amount of rage from taking damage from most type of attacks. You cannot unleash rage in a tournament<br>
- Shopkeepers will buy items from you at a better price, the sale price of great and massive stat shards in general has been increased<br>
- Meditate ticks increased<br>
- Ki defense effectiveness reduced to 50% - reason being, no ki tech does anywhere near 100% (unlike defense)
 This doesn't make ki defense useless, it's still useful, possibly still more useful than it should be. <br>
 - The cost of Executioners Strike and Super Explosion Wave has been reduced<br>
 - Can no longer use a senzu bean while in a tournament<br>
 - Quite a few bug fixes, thank you to those who have been reporting them, though there are still some left<br>
<font size = 4> 3/26/2019<br>
<font size = 1>
- A temporary fix implemented to fix a transformation/stat bug, you will be forced to revert before self/focus training or meditation. If you mob and gain levels it is recommended that when you are done, you revert, do not transform > gain levels > transform > revert. Do: transform > gain levels > revert > transform<br>
 Transformations are being reworked, when it is done this won't be an issue, and you will be able to jump directly to the transformation you want<br>
- Boosted shards/chips again. Shards: Small - 10k, Large - 25k, Great - 50k, Massive - 100k. Chips - 10k, Mega Chips - 30k<br>
- Removed some strong mobs that were around weaker mobs (probably others that need to go, let me know)<br>
- Level option for BSDB added back<br>
- Removed admin help verb, if you need help ask in OOC or on the discord. If you have a bug or suggestion use the report function<br>
- A couple other bug fixes<br>
<font size = 4> 3/25/2019<br>
<font size = 1>
- PL and KI percents will be red when you are powering up, or until your stats slowly lower back down to base after powering up, or while you are in kaioken<br>
- The cool-down period after you power up has been greatly reduced<br>
- You can now eat senzu beans while inverted or transformed but there is a cooldown timer on them, you can see if you are full in the statpanel under Fatigue<br>
- Added command to hide worn equipment. Right click on a worn piece and select Show/Hide Icon<br>
- Small shards and chips were not dropping properly<br>
- Slightly buffed shards/chips<br>
- New Technique Guide added (WIP)<br>
- Punch damage and cost has been reduced<br>
- Ki damage vs other players now has damage minimums and maximums, different per tech. For example, if you hit someone with a 10x and they have more ki defense than your 10x strength, the damage will be set to 10% of their PL, however if 10% of their PL is more than half of your current ki, you will damage them for half of your ki<br>
- Stat ticks adjusted<br>
- A few genes had the wrong PL requirement, they should all be correct now, as shown in the guide<br>
- Several bug fixes<br>
- Dragonball wishes have been changed from last wipe. Wishing for ZP is still effective, but if you choose to wish for Power, you will gain in all stats, a percent based on your own stats up to a cap. The cap depending on which set. Wishing for levels has been buffed<br>You can wish for endurance only on the BSDB, which will double your stamina. It's the only way to increase your stamina at this point<br>

<font size = 4><b>Version 3.0</b><br>
3/24/2019<br>
<font size = 1>
- All numbers (training, trans multis, mob stats, etc) have been drastically reduced. This was a big project so I expect there to be plenty of feedback after we wipe (mostly on mob stats)<br>
- You can now pick which gene you want. The genes with the slightly lower trans multis have a higher stat multi in their specialized stat (a prideful saiyan would gain more ki than a godly saiyan, and especially over honor/legandary, since Godly has the edge) However you won't see any difference early on.. the stats you gain early on very low, but since have so many levels this way it needed to be done<br>
- Transformations have been changed up. Now your PL and KI percentages will never go up to a high number, it'll be between 0-100%, based on your ki control. Though you can temporarily bring it above 100 with powering up or a buff<br>
- Power Up works while in transformations now, and you can toggle it off and on you don't have to let it finish. You can power up to 1.5x your base, so at 100 ki con you can power up to 150%<br>
- Instant Transmission is just a menu choice for every race, it only has NPCs in the list though. But you can input an EC if you want, to get to a player.<br>
- Stamina is now a static number, you don't have to train it anymore. Reason being is, after the first day or so stamina was pretty much pointless. So now you can afk train without having to worry about resting<br>
- Stamina is still used in various techniques, and I did adjust (reduce) most of the techs, but it might need adjusted again. However, I would macro Rest, in case you need it. Although most techniques don't take very much stamina eventually you'll need to rest. Resting does heal your PL/KI a bit too. And it won't take a long time to rest, you could rest in the arena and not get killed if you are quicker than your opponent.<br>
- With the reduced numbers I've had to take a look at ki cost for techniques. While the old system worked, after a point you basically had unlimited ki. I've redone Ki Cost to be based on a percent of your ki stats, plus a smaller static number based on the tech. So you might notice a 10x kamehameha takes 3% of your ki each time you use one, while a starbang only takes 1% Ki Use is still something you'll want to raise, it directly reduces what percent is subtracted (and it can be less than 1% with high ki use)<br>
- New Kai gene, Zealot, where you start as a perm, with invert. And you can perm if you wish, alternatively you can use the BSDBs and wish for Goku Body, and become Goku Black. Where as Goku Black, you'll have 1 transformation, SSJR, but to compensate for losing a BSDB wish they have the highest multi of any non perm in the game (75) <b>Note: don't rush to get goku body right away, you lose invert when you do, and SSJR requires 50mil PL</b><br>
- Some other genes have had their type changed. Bloodthirsty Human and Brave Konats are the only two Str/Sword type genes in the game<br>
- Removed all the overall skill increases from transformations. With Weights and Suits, people are way too OP. However the sword type genes do have a total increase of 10 in their weapon skills when they transform. I might go through and add a little bit to all the genes, but only skills that make sense (like melee and durability for a str/def based gene)<br>
- Deflect skill has been removed<br>
- Ki Cast now has another purpose. For most techniques, they will always fire now. But if the ki cast check is successful, it'll increase the damage of the attack by a small percent, like a critical hit. Some techniques still require ki cast to fire though (such as the rapid blast attacks, Big Bang like attacks, and the Galactic Donut-like attacks)<br>
- The stats that shards (and megachips) give has been drastically reduced. Shards are now based on 1% of your stat, not 5, and the cap for each: (Small - 500) (Large - 2000) (Great - 5000) (Massive - 10000)
I'll increase these if I need to, but I'd rather have them too low than too high<br>
- Removed gym equipment. Would like to add it back if it could be repurposed into something useful<br>
- Dragonball wishes changed. Potential ZP rewards are capped per wish (25, 100, 250) Can't wish for individual stats, but for power in general, and it's more effective than before<br>
<font size = 4> 2/19/2019<br>
<font size = 1>
- Screen size added back in Resolution menu, named View Size<br>
- Experimenting with different optimizations<br>
- New Options in Option verb, to toggle splash damage text, kill rewards, and party kill rewards (turning these off when killing massive amounts of mobs could improve your own personal game performance<br>
- <A HREF=https://discord.gg/8PpjgUk>Join Dragonball Ruinations Discord</A><br>
- Switched back to old movement<br>
- Arena isn't blocked off any longer, but you can't leave the area during a match<br>
- Speed stat calculations and gains removed from the game<br>
- A variable for tournaments was not being set to 0 after losing a match, should be fixed now<br>
- You should no longer be able to do a guild war against your own guild<br>
- Brave Rush now locks targets flying ability for longer<br>
- Defense from punch slightly less randomized (70-100% effectiveness to 85-100%)<br>
- Slightly increased Dodge stats effectiveness<br>
- Block now blocks 80% of remaining damage from a Punch, rather than calculating increased defense for that hit<br>
- Sense verb altered, need to see it in action to know if it's better<br>
- Guild Members tab removed completely, however the guild members verb in Guild tab shows all that info in a popup window<br>
- Quest tab should now properly display when you have a quest. If it's not there and you have a quest, Options > Toggle Tabs will bring it back up<br>
- Minor changes to the inferface<br>
- FPS temporarily reduced, from 25 to 20<br>
- Gravity Machine function was fixed up a bit<br>
- Dragon Radar text now tells you which direction the dragonballs are at<br>
- Kaioken now constantly drains stamina. Super Kaioken drains more, but is much stronger<br>


<font size = 4> 2/16/2019<br>
<font size = 1>
- Trying out different player movement setup<br>
- AI has been changed up, hopefully it performs better but need to see it in action with players<br>
- Level Up function changed, you will gain mass levels more slowly over time, but this <i>should</i> be much more optimized<br>
- Power Dash will now destroy a projectile if you dash right into it, you will take splash damage, but not direct damage, and keep dashing towards your target<br>
- Power Dash Range increased<br>
- Power Dash animation updated<br>
- Super Explosive Wave cooldown slightly reduced<br>
- Executioner Strike cooldown slightly increased, damage increased moderately<br>
- Ki Punch stamina cost slightly reduced<br>
- Punch damage reworked<br>
- Punch minimum damage was incorrectly being set to 0, now if your punch power - target defense power is less than 10% of your strength, your punch damage will be set to 10% of your strength<br>
- Sword Attack damage has also been modified<br>
- Punch and Sword Attack cooldowns modified<br>
- Sword Slash should no longer move Vault doors<br>
- Strength-based projectile AntiMatter (Bio Warrior tech) damage has been somewhat reduced, as has its speed<br>
- Broly Suit drop rate from Bank quest increased<br>
- You will now get a message if you can do the bank quest again<br>
- New Report option located in System > Report. Please report any bugs/suggestions you have. Your reports are confidencial, only admins can view your information (thanks to Super Saiyan X for creating this)<br>
- OOC and Say character limit increased from 150 to 250 characters, if you go over that amount it will cut off at 250 characters but display the whole message right below<br>
- Fixed a bug with Ki Punch and spamming techniques<br>
- Fixed a bug with the Legendary Sword (acquired from Tapion, Konats only)<br>
<font size = 4> 2/7/2019<br>
<font size = 1>
- Ki punch damage increased (45% strength * melee skill) and stamina cost cut in half<br>
- SEW code has been changed, should be a lot more efficient. If all goes well will lower the cooldown on SEW again<br>
- Punch has been redone, thanks to Xaliant<br>
- FAQ section added to new game guide, players may post comments/questions there<br>
- The rules have been recently updated<br>
- Bank security death bug fixed<br>
- Certain end game mobs were not dropping stat shards<br>

<font size = 4> 2/1/2019<br>
<font size = 1>
- Finish Buster and Brave Rush bug fixed<br>
- Bank Raid quest fixed<br>
- Respawn timers for various mobs altered<br>
- Update Maps has been updated to show map changes<br>
- Update Maps is now also viewable externally in Game Guide<br>
<b>**Map changes**</b><br>
- New turf icon for Yardrat<br>
- New island on Vegeta<br>
- Some ATMs removed<br>
- Other minor map fixes<br>
<font size = 4> 1/29/2019<br>
<font size = 1>
- Push technique added. Learn at 25k. Pushes target back plus deals strength based damage<br>
- Move delay slightly reduced (let me know if you prefer it this way)<br>
- Move speed is slightly quicker while flying<br>
- Brave Rush no longer freezes target and no attacks should be usable immediately after, also you have a small window where you can zanzo away and dodge the attack completely. It still locks zanzo, IT, forces the target to land, and slows them down for a limited amount of time after a hit<br>
- Farmer added to one of the Earth Islands, he gives a quest<br>
- Bank Raid quest (not a multiplayer raid, just a quest, works fine but needs some attention in the future)<br>
- Majin Sorcery has been changed to powerlevel based, message fixed<br>
- Majin Wizards trans multis adjusted<br>
- Corruption now caps at 1.5mil pl instead of 250k<br>
- Range where you will see chat from Say has been increased from 12 to 16(depending on your settings you still might not see someones say if they are on the edge of your screen<br>
- Space Suit and Tuxedo price have been reduced to 10 trillion zenni<br>
<b>**Map Changes**</b><br>
- 3 new areas on Yardrat with Goku SSJ Rose mobs<br>
- Glass part of the roof of buildings and some of the lines were incorrect, fixed now<br>
- Yardrat has a new water icon<br>
- Other minor changes<br>
<font size = 4> 1/20/2019<br>
<font size = 1>
- Bumped the FPS up to 25 (from 20)<br>
- Power dash now correctly applies damage<br>
- Projectiles can now travel across water<br>
- Executioners strike now fires faster and the cooldown has been reduced by 40%<br>
- Ki defense was lowered, it was too effective after damage minimums changed<br>
- Two new suits added in Suit Shopkeep (25 Trillion Zenni each)
- Two new custom auras added<br>
- Enemy view range expanded a bit more (again this might be reversed)<br>
- Interface changed (can change back if people don't like the new size of the map)<br>
<b>*Map Changes*</b><br>
- New island added to Yardat, with infernal dragons<br>
- Building above the gym has an interior (no NPC yet)<br>
- Planet Vegeta has a new structure which will be used in a quest sometime<br>
- A few map fixes<br>
<font size = 4> 1/17/2019<br>
<font size = 1>
- New melee tech added, Power Dash - damage similar to punch but only uses strength, no powerlevel. Learn at level 75k<br>
- City expanded (this is work in progress) with seperate buildings for shops, the bank, the barber, and the yamcha gym (which has been moved to the city)<br>
- ATM machines are located throughout the game, they work just like Bankers but you have to go to the Banker to transfer zenni<br>
- Roshi's island updated, saga island upgraded, now has Gokus house<br>
- Various structures have been added to the map (thanks to Ryuuchi for supplying many of the icons and coding them into a DM file)<br>
- Interface update, using a zoomed feature, you can zoom in and out using Resolution still, and the game auto adjusts the game map whenever you resize/maximize the window<br>
- Suits page added to game guide<br>
- Ki Shield now finally works<br>
- Damage minimums have been changed, different formula and reduced the minimum percent<br>
- Splash damage should now only have reduced damage against the shooter, before if the player hit themselves all splash damage was reduced to all targets<br>
- Enemies sight now has a slightly higher range (may change this back)<br>
- Various bug fixes<br>
<font size = 4> 1/15/2019<br>
<font size = 1>
- Unique move for each race added, learned at 80k. (Damage formula: 20% PL, 12% KI) has huge splash range<br>
** Bio Warriors new techs, Nerf Missles, is based on 20% PL, 12% str since all Bio Warrior genes are str based<br>
- Hit aliens level 20k tech, Vortex Skip, is now strength based<br>
- New melee technique, Ki Punch, fires a strength based attack a few tiles in front of the player (learn at level 50k, drains small percentage of stamina each use)<br>
- All strength based projectiles have a much lower max range (how far depends on each tech) Dragon Fist is about 8 tiles for example, while Ki Punch is only a few<br>
- Time skip now slows down the target instead of a short freeze (the duration and intensity may need adjusted<br>
- All ki projections max travel range has been reduced, from 40 to 18<br>
- Projectiles that have splash range will now explode when they reach their max travel distance, instead of just disappearing<br>
- You should no longer be able to fire a projectile with BR, however, punch still works (might change later<br>
- BR now slightly slows down the target after they have become unfrozen, however it's much shorter and less intense than timeskip<br>
- BR will now force the target to land if they are flying, and it disables flight for a short amount of time<br>
- Ki resistance effectiveness has been toned down a bit<br>
- Ki Shield technique effectiveness increased from 20% to 35%<br>
- New (and very expensive) suits have been added to the suit shopkeeper. The MK suits all give the same benefits, Anti Goku Suit is probably the best if you go ki, but Akatsuki Outfit has good melee benefits, and the best durability/ki resistance bonus of all suits (slight ki power reduction when equipped<br>
- Interface updated, guild chat now displays in the middle text box (give this a chance, if the map is too small I'll change it again, or you can change it manually)<br>
- Default aura has multiple color choices now (NOTE: if you log out without turning off a default aura, you will have to use fix aura. this is not an issue with other auras and will be addressed at a later date<br>
- Custom auras fixed, they now have transparency<br>
- Gravity Training guide added to new game guide<br>
- Dragon Tips have been updated<br>
- God Saibas and Dragons added to the Ice Cave on Earth<br>
- Some more end game mobs added to Yardrat<br>
- Some mob stat changes (UI Goku exp reward increased, Dragon exp increased slightly, some mobs on Yardrat were under level 1 million, they recieved stat boost and increased level<br>
- Minor quality of life updates (if your OOC message is too long it'll read the message back to you instead of just telling you it's too long, let me know if you have simple suggestions that go with this)<br>
- Majin regen changed back to the way it used to be (for now)<br>
- Various admin functions have been updated<br>
<font size = 4> 1/8/2019<br>
<font size = 1>
- Respawn timers have been reduced by 1/5th, if this works out will consider lowering them a bit more<br>
- Golden Oozarus added to Vegeta<br>
- A new island has been added to Yardrat, south of Omega Shenron NPC<br>
- Various mob rewards have been adjusted<br>
- Powerlevel based ki attacks have been nerfed<br>
<font size = 4> 1/6/2019<br>
<font size = 1>
- Videl has been updated, with 2 sections of auras, one section you can customize the colors. More auras will be added in the future (Thanks Ryuuchi)<br>
- Most mobs now move at full speed<br>
- You will no longer be effected by splash damage if you take a direct hit from a projectile<br>
- If you hit yourself with your own splash, the damage you take is greatly reduced<br>
- Race tourneys have been removed, at the moment there are 3 level tier tournies, and a world tournament anybody can join<br>
- New section on file menu, PVP, which has verbs related to tournaments and arena challenges<br>
- Talking to Yemma now revives you, you can walk snake way to visit king kai if you want<br>
- There is now a message displaying when a mob drops an item<br>
- Dodonpa is now learnable by Humans and Androids<br>
- Some mob stats and rewards have been adjusted<br>
- Explosive wave power is now based on powerlevel<br>
- Super Explosion Wave cooldown has been reduced, and it now fires slightly faster<br>
- Kamehameha now has splash range of 1<br>
- ST/FT gains for strength and defense have been raised<br>
- Majin Wizards buffs now function properly<br>
- Majin wizards can see their transformation skill in overall tab<br>
- Bug/exploit fixes<br>
<font size = 4> 1/3/2019<br>
<font size = 1>
- Weighted equipment will now drop in random colors
- Weighted equipment will drop slightly more often<br>
- You can now damage yourself by your own splash damage again, but the amount is reduced<br>
- Mobs changed, some mobs will now walk slower than others<br>
- Some mob stats altered<br>
- New ki shield icon (thanks to BlackAlleyCat)<br>
- Ki shield stamina drain lowered slightly<br>
- Kai and Majin Wizard buffs show now reapply after you transform/invert (this does not help perms yet)<br>
- Kai and Wizard buffs should now properly cap<br>
- Dodge skill nerfed, now 100 dodge is about a 10% chance to dodge a punch<br>
- Suit shopkeeper readded<br>
- Freeze cooldown has been reduced by 4/5ths<br>
- Ki homing attacks will no longer target players, only mobs<br>
<font size = 4> 12/30/2018<br>
<font size = 1>
- Ki Shield has been changed to reduce 20% of damage from ki attacks but while active it constantly fagitues you until you are out of stamina<br>
- Mob drops has been altered, the requirements for higher tiered drops has been increased and drop rate has been slightly lowered<br>
- New verb in Combat tab, "Toggle Lethal" by default it is off. When it is on, you will automatically kill your target. At the moment only works for Punch and Sword Attack<br>
- Some minor adjustments to mobs<br>
- Suit shopkeeper (temporarily) removed<br>
<font size = 4> 12/29/2018<br>
<font size = 1>
- Freeze is now a projectile<br>
- Kai multis have been adjusted<br>
- Item drops will now correctly drop all tiers of drops<br>
- Star bang damage has been fixed<br>
- Antimatter damage has been changed to strength based because all bio warrior genes are strength based<br>
- ZP Crits should now work correctly when a player is killed<br>
<font size = 4> 12/28/2018<br>
<font size = 1>
- Trunks NPC added back into game, located in the city<br>
- Cooldown on quick firing techniques increased slightly<br>
- Slight changes to projectile damage<br>
- Mob movement changed, all mobs move the same speed, and a bit faster (if you don't like this let us know)<br>
- Time skip has been nerfed<br>
- Antimatter is now learnable by Bio Warriors at level 20k<br>
- Sword attack now auto kills instead of KO<br>
<font size = 4> 12/26/2018<br>
<font size = 1>
- Mobs will now drop appropriate equipment for their level bracket<br>
- Slightly increased mob speed<br>
- Slightly increased player move delay (smoother movement with no lag jumps)<br>
- Finish delay has been reduced (less delay, more mob kills!)<br>
- Added commas to more numbers in game, such as using scan from a tech or scouter<br>
- Kais now learn kaioken automatically<br>
- Party chat character limit has been increased from 100 to 300 characters<br>
- A bug with the tournaments should be fixed<br>
<font size = 4> 12/25/2018<br>
<font size = 1>
- Added Suits and Suit Shopkeep. Suits are equipped to their own slot, they are very expensive but they increase different skills when equippped<br>
- Each race now has a unique projectile that they learn at level 20,000<br>
- Gravity cap now increases after each reset, with higher resets giving more of a reset. Defense and Ki defense cap is lower than the other stats. End game gravity is in the works<br>
- Omega Shenron has been added back to the map, at the moment he is on southeast Yardrat<br>
- Drop rate altered<br>
- The chance of gear that is dropped being enchanted was increased from 40% to 80%<br>
- Server Kill Boost fixed<br>
- Players should no longer get kicked out of HBTC<br>
<font size = 4> 12/22/2018<br>
<font size = 1>
- View Maps has been updated (also now located in file menu > game<br>
- Final Explosion should be fixed<br>
- Changes to the movement code<br>
- Majin Sorcery buff re-added to the game<br>
-- Majin Sorcery gives 30% buff to target if they are evil alignment, 10% if they are good<br>
- Both Kai and Majin Wizard buffs now re-apply if you revert and re-trans, so you won't lose them<br>
- Kai buffs cannot be stacked with Wizard buffs, and vice versa<br>
- A few more mob stat changes<br>
<font size = 4> 12/20/2018<br>
<font size = 1>
- All new multis for all races and genes, and invert buffed<br>
- Optimizations to enemy A.I.<br>
- Statpanel simplified and optimized a bit<br>
- Some mob adjustments<br>
- Namek, Bio, Majin regeneration changed
  - All now fatigue you while they are turned on<br>
  - Namek and Bios can continue to fight while they are regenerating<br>
  - Majins cannot move while they are regenerating, but they regenerate faster<br>
- Technique damage altered, random high damage fixed<br>
- Ki attack damage vs other players has been changed. Players have better defenses but techniques have different minimum damages based on the shooters current kit<br>
  - This is experimental and subject to change, and is intended to promote more skill than stats in a fight, however the stronger character will still have the advantage<br>
 - Sword Attack now hits 3 tiles wide in direction of player. Is still a WIP, does not work with diagonals and there is no animation<br>
- Kai buffs have been greatly nerfed, and the cooldown timers have been cut in half<br>
- Kai gravity field effectiveness cap has been tripled<br>
- Meditation experience gain rate doubled<br>
- Some mapping changes/fixes<br>
- Some verbs are now located on the file menu under "Game"<br>
- New update guide added (W.I.P.)<br>
- Who verb changed to be browser based<br>

<font size = 4> 12/17/2018<br>
<font size = 1>
- Temporarily reduced world FPS from from 40 to 20<br>
- Lowered the drop rate, especially for training shards<br>
- NPCs can no longer be thrown by powering up<br>
<font size = 4> Beta 2 12/16/2018</font>
<br>
<font size = 1>
- Pixel movement replaced for tile movement<br>
- Mob stats have been nerfed<br>
- A couple of techniques have been slightly nerfed<br>
- Certain mobs and map elements have been (temporarily) removed<br>
- Drop rates for gear have been increased<br>
- Drop rates for shards have been greatly increased, and higher tiered shards will no longer drop from lower level monsters<br>
- Sword Attack basics have been implemented(incomplete)<br>
- Various bug fixes<br>
<font size= 4>Update 3.0 Beta</font>
<br>
<font size = 1>
- Vastly updated map including new areas and many new mobs, and some new graphics.
<br>
- A lot of end game mobs added, Mobbing will be more pleasant now.
<br>
- Some techniques are no longer useful for killing players (such as SEW) instead a new projectile system has been implemented and most attacks use it. SEW is still just as useful for mobbing.
<br>
- Technique damage has been redone
<br>
- Most techniques have their own cooldown timer now so you don't have to wait to use another attack. And some attacks have very low cooldowns
<br>
- The focus is being moved away from stat based homing attacks. Burst Rush now does no damage, but still slows the target. Galactic Tyrant is gone
<br>
- Dragon Fist damage is now calculated based on strength, not ki, since melee players have lost a tech
<br>
- The sword abilities are also viable techs for melee users, some more melee techs could be coming in the future
<br>
- Because of the focus on projectiles, Ki Cast now raises a lot faster
<br>
- Transform multi's have been reworked. All perms are about 250, at the moment the non perms stay the same. However the "weak" genes such as prideful saiyan are now "specialized" genes. For example, a prideful saiyan gains a lot more max ki at each level compared to a godly saiyan, which potentially can add up quite a bit.
All 3 inverts have been slighted nerfed, and all of the multis are subject to change
<br>
- Gravity training is back in, there is a specific building for it on Earth (it is a safe zone)
<br>
- Your potential gravity gains do cap (and it is based on both gravity level and your character level) but through resets you can increase it
<br>
- Resets are now at 20k, 25k, and then 30k after that. At resets 5, 10, 15, and 20 your gravity cap raises
<br>
- Ki control gear is out of the game, the others are still in. This will allow players to pick and choose which weights they want to "build" their character
<br>
- Stat shards are no longer limited to 10, you can use as many as you want. However the gains have been greatly reduced and each level of stat shard has a cap where you won't gain anymore
no matter how much of that stat you have
<br>
- Interface slightly updated. You can drag the splitter between the statpanel and chat to make one show more or less
<br>
- Rest can now be toggled off/on
<br>

</font>
</body>
</html>
"}
mob/var/tmp/tourny1_watch=0
mob/PC
	verb
		Watch_Tournament()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Watch Tourny")
			if(usr.tourny_watch)
				usr << "Please stop watching the budokai first"
				return
			if(!usr.tourny1_watch)
				usr.ceye=client.eye
				usr.client.perspective=EYE_PERSPECTIVE
				client.eye=locate(477,11,7)
				usr.tourny1_watch=1
				return
			else
				client.eye=usr.ceye
				usr.client.perspective=EDGE_PERSPECTIVE
				usr.tourny1_watch=0
				return
		Update_Log()
			set category = "Channels"
			//usr<<browse(Updates,"window=Update")
			usr<<browse(Updates,"window=Players Online;size=960x720")
//		Text_Size()
//			set category = "Channels"
//			if(usr.playerwatch==1)
//				PlayerWatch(usr,"Text Size")
//			var/ts=input("How big do you want the chat text to appear? (Default 1, Current [usr.textsize]","Text Size") in list("1","2","3","Cancel")
//			if(ts == "Cancel")
//				return
//			usr.textsize = text2num("ts")
//			usr << "<font size = [usr.textsize]>Text size set to [usr.textsize]"
		Text_Options()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Text Color")
			var/cn=input("Choose name color") as color
			textcolorname = "<font color=[cn]>"

			var/c=input("Choose text color") as color
			var/bold = input("Do you want bold? (1=Yes Sir, 0=No)?","Custom Text Color",0) as num
			if(bold == 1) bold = "<B>"
			else if(bold != 1) bold = ""
			var/italic = input("Do you want italic? (1=Yes Sir, 0=No)?","Custom Text Color",0) as num
			if(italic == 1) italic = "<I>"
			else if(italic != 1) italic = ""
			var/underline = input("Do you want underline? (1=Yes Sir, 0=No)?","Custom Text Color",0) as num
			if(underline == 1) underline = "<U>"
			else if(underline != 1) underline = ""
			textcolor = "<font color=[c]>[bold][italic][underline]"
			usr.opendialog=0

/*
		Text_Color(c as color)
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Text Color")
			var/bold = input("Do you want bold? (1=Yes Sir, 0=No)?","Custom Text",0) as num
			if(bold == 1) bold = "<B>"
			else if(bold != 1) bold = ""
			var/italic = input("Do you want italic? (1=Yes Sir, 0=No)?","Custom Text",0) as num
			if(italic == 1) italic = "<I>"
			else if(italic != 1) italic = ""
			var/underline = input("Do you want underline? (1=Yes Sir, 0=No)?","Custom Text",0) as num
			if(underline == 1) underline = "<U>"
			else if(underline != 1) underline = ""
			textcolor = "<font color=[c]>[bold][italic][underline]"
			usr.opendialog=0
			*/
		View_Maps()
			set category="Channels"
			set desc="View the different world maps!"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"View Maps")
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			var/map=input("Which map do you want to view","Map") in list("Earth Map","Namek Map","Vegeta Map","Yardrat Map")
			src << browse("<body bgcolor=black text=white><p align=center>\
			<font size=5 face='Verdana'>...please wait...</font></body>","window=Map,\
			size=970x800")
			sleep(10)
			if(map=="Earth Map")
				usr << browse(file('EarthM.png'),"window=Map, \
				size=970x800" )
				usr.opendialog=0
				return
			if(map=="Namek Map")
				usr << browse(file('NamekM.png'),"window=Map, \
				size=970x800" )
				usr.opendialog=0
				return
			if(map=="Vegeta Map")
				usr << browse(file('VegetaM.png'),"window=Map, \
				size=970x800" )
				usr.opendialog=0
				return
			if(map=="Yardrat Map")
				usr << browse(file('YardratM.png'),"window=Map, \
				size=970x800" )
				usr.opendialog=0
				return
		Mr_Fix()
			set category="Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Mr Fix")
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			switch(input("What do you need help with?")in list("Fix Equipment","Overlays/Underlays","Dead on Earth","Lost Transform verbs","Tech Cooldown","Cancel"))
				if("Cancel")
					usr.opendialog=1
					return

				if("Shards")
					usr.smallshard = 0
					usr.largeshard = 0
					usr.greatshard = 0
					usr.massshard = 0
				if("Talk to NPC's")
					usr.talking=0
				if("Burst Rush/Galactic Tyrant")
					usr<<"<font color = white>Mr Fix: I'll Fixs your delays in 40 seconds"
					sleep(390)
					usr.burst_delay=0
					usr.tyrant_delay=0
					usr.skip_delay=0
					usr<<"<font color = white>Mr Fix: Your Delays have been fixed"
				if("Lost Transform verbs")
					for(var/obj/Transform/Transform/T1 in usr)
						del(T1)
					for(var/obj/Transform/Revert/T2 in usr)
						del(T2)
					var/obj/Transform/Transform/T1=new
					var/obj/Transform/Revert/T2=new
					T1.loc=usr
					T2.loc=usr
				if("Tech Cooldown")



					spawn(300)usr.tech_cooldown=0
					usr<<"<font color = white>Mr Fix: Your Tech Cooldowns will be fixed in 30 seconds"
				if("Fix Equipment")
					for(var/obj/O in usr)
						O.suffix=null
						O.equiped=0
					usr.weight=0
					usr.overlays-=usr.overlays
					usr.underlays-=usr.underlays
					usr.head="EMPTY"
					usr.back="EMPTY"
					usr.chest="EMPTY"
					usr.legs="EMPTY"
					usr.feet="EMPTY"
					usr.arms="EMPTY"
					usr.hands="EMPTY"
					usr.waist="EMPTY"
					usr.underclothes="EMPTY"
					usr.clothes="EMPTY"
					usr.weapone = "EMPTY"
					usr.suit = "EMPTY"
					usr.clothes_eq=0
					usr.scouter=0
					usr.scouter_eq=0
					usr.armor=0
					usr.armor_eq=0
					usr.under=0
					usr.under_eq=0
					usr.helmet=0
					usr.helmet_eq=0
					usr.gloves=0
					usr.gloves_eq=0
					usr.z_sword=0
					usr.radar=0
					usr.gitems=0
					usr.hench_equiped=0
					usr.saiyan_equiped=0
					usr.sellable_items=0
					usr.weightgi = 0
					usr.weightcape = 0
					usr.weightarmor = 0
					usr.weightarm = 0
					usr.weightleg = 0
					usr.weightankle = 0
					usr.weightwrist = 0
					usr.weighthead = 0
					usr.weightsword = 0
					usr.melee_bonus = 0
					usr.block_bonus = 0
					usr.counter_bonus = 0
					usr.critical_bonus=0
					usr.dodge_bonus = 0
					usr.durability_bonus = 0
					usr.ki_control_bonus=0
					usr.ki_power_bonus=0
					usr.ki_use_bonus=0
					usr.ki_res_bonus=0
					usr.reflect_bonus=0
					usr.ki_cast_bonus = 0
					usr.melee = usr.melee_max
					usr.block = usr.block_max
					usr.dodge = usr.dodge_max
					usr.counter = usr.counter_max
					usr.critical = usr.critical_max
					usr.ki_control = usr.ki_control_max
					usr.ki_power = usr.ki_power_max
					usr.ki_use = usr.ki_use_max
					usr.ki_res = usr.ki_res_max
					usr.reflect = usr.reflect_max
					usr.ki_cast = ki_cast_max
					usr.weapon_res_bonus = 0
					usr.weapon_resistance = usr.weapon_resistance_max
					usr.weapon_bonus = 0
					usr.weapon = usr.weapon_mastered
					usr.weapon_power_bonus = 0
					usr.weapon_power = usr.weapon_power_max
				if("Fix Icon")
					switch(input(usr,"Are you sure?","Fix Icon")in list("Yes","No"))
						if("Yes")
							usr.Skin_Apply()
							switch(usr.race)
								if("Bio Android")
									if(!usr.form_1)
										usr.icon='Bio Android - Form 1.dmi'
									if(usr.form_1)
										usr.icon='Bio Android - Form 2.dmi'
									if(usr.form_2)
										usr.icon='Bio Android - Form 3.dmi'
								if("Majin")
									if(!usr.form_1)
										usr.icon='Majin - Form 1.dmi'
									if(usr.form_1)
										usr.icon='Majin - Form 2.dmi'
									if(usr.form_2)
										usr.icon='Majin - Form 3.dmi'
									if(usr.form_3)
										usr.icon='Majin - Form 4.dmi'
									if(usr.form_4)
										usr.icon='Majin - Form 5.dmi'
								if("Namekian")
									usr.icon='Namek - Normal.dmi'
									if(usr.form_3)
										usr.icon='Namek - Super.dmi'
								if("Konat")
									usr.icon='Konat - Form 1.dmi'
									if(usr.form_3)
										usr.icon='Namek - Super.dmi'
								if("Tuffle")
									usr.icon='Bebi - Form 1.dmi'
									if(usr.form_1)
										usr.icon='Bebi - Form 2.dmi'
									if(usr.form_2)
										usr.icon='Bebi - Form 2.dmi'
									if(usr.form_3)
										usr.icon='Bebi - Form 3.dmi'
									if(usr.form_4)
										usr.icon='Bebi - Form 3.dmi'
								if("Android")
									if(usr.form_1)
										usr.icon='AndroidForm2.dmi'
									if(usr.form_2)
										usr.icon='AndroidForm3.dmi'
								if("Feline")
									usr.icon='Beerus.dmi'
				if("Overlays/Underlays")
					usr.underlays -= usr.underlays
					usr.overlays -= usr.overlays
					if(usr.majin)
						usr.overlays += 'Majin.dmi'
					if(usr.race == "Saiyan" && usr.has_tail)
						usr.overlays += 'Tail.dmi'
/*				if("Rest/Fly/IT")
					usr<<"MR FIX: 'I can have you all fixing in 10 seconds"
					sleep(100)
					usr.density = 1
					usr.boxing = 0
					usr.buku = 0
					usr.doing = 0
					usr.frozen = 0
					usr.powering = 0
					usr.buku_lock = 0
					usr.icon_state = ""
					usr.charging = 0
					usr.attack_lock	= 0
					usr.ki_lock	= 0
					usr.it_lock	= 0
					usr.buku_lock = 0
					usr.playing = 0
					usr.buku_lock = 0
					usr.grav = 0
					usr.hiting = 0
				//	usr.dualtrain = 0
					usr.dt_delay = 0
					if(usr.in_hbtc==0)
						usr.it_blocked=0
					usr<<"MR FIX: 'All Fixed"
					return*/
				if("Dead on Earth")
					if(usr.dead == 1)
						usr.loc = locate(410,370,7)
						usr.dead = 1
					else
						usr << "You are not dead, cannot continue."
			usr.opendialog=0


		Roleplay()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Roleplay")
			usr.opendialog=1
			var/rp=input("Please enter your roleplay here") as text
			view(12)<<"<font color = #FFA500>[src] [rp]</font>"
/*
		Stamina_Check()
			set category = "Channels"
			set background=1
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Stamina Check")
			switch(input("What do you want to check your stamina on?")in list("Self Train","Focus Train","Meditate","Dual Train","Cancel"))
				if("Cancel")return
				if("Meditate")
					var/staminacheck=0
					var/days=0
					var/hours=0
					var/minutes=0
					var/seconds=0
					staminacheck=staminaleft_max
					if(staminacheck>=600000000)return
					Start
					if(staminacheck>=691200)
						days+=1
						staminacheck-=691200
						goto Start
					if(staminacheck>=28800)
						hours+=1
						staminacheck-=28800
						goto Start
					if(staminacheck>=480)
						minutes+=1
						staminacheck-=480
						goto Start
					if(staminacheck>=8)
						seconds+=1
						staminacheck-=8
						goto Start
					if(days>=1)usr<<"<center><font color=white>Your maximum training time with meditate is approx:</font> <font color = aqua>[days]</font> days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your maximum training time with meditate is approx:</font> <font color = lime>[hours]</font> hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your maximum training time with meditate is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					staminacheck=0
					days=0
					hours=0
					minutes=0
					seconds=0
					staminacheck=round(staminaleft_max-staminaleft)
					if(staminacheck>=600000000)return
					Start2
					if(staminacheck>=691200)
						days+=1
						staminacheck-=691200
						goto Start2
					if(staminacheck>=28800)
						hours+=1
						staminacheck-=28800
						goto Start2
					if(staminacheck>=480)
						minutes+=1
						staminacheck-=480
						goto Start2
					if(staminacheck>=8)
						seconds+=1
						staminacheck-=8
						goto Start2
					if(days>=1)usr<<"<center><font color=white>Your training time remaining with meditate is approx:</font> <font color = aqua>[days] </font>days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your training time remaining with meditate is approx:</font> <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your training time remaining with meditate is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					return
				if("Dual Train")
					var/staminacheck=0
					var/days=0
					var/hours=0
					var/minutes=0
					var/seconds=0
					staminacheck=staminaleft_max
					if(staminacheck>=600000000)return
					Start
					if(staminacheck>=1036800)
						days+=1
						staminacheck-=1036800
						goto Start
					if(staminacheck>=43200)
						hours+=1
						staminacheck-=43200
						goto Start
					if(staminacheck>=720)
						minutes+=1
						staminacheck-=720
						goto Start
					if(staminacheck>=12)
						seconds+=1
						staminacheck-=12
						goto Start
					if(days>=1)usr<<"<center><font color=white>Your maximum training time with dual train is approx:</font> <font color = aqua>[days]</font> days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your maximum training time with dual train is approx:</font> <font color = lime>[hours]</font> hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your maximum training time with dual train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					staminacheck=0
					days=0
					hours=0
					minutes=0
					seconds=0
					staminacheck=round(staminaleft_max-staminaleft)
					if(staminacheck>=600000000)return
					Start2
					if(staminacheck>=1036800)
						days+=1
						staminacheck-=1036800
						goto Start2
					if(staminacheck>=43200)
						hours+=1
						staminacheck-=43200
						goto Start2
					if(staminacheck>=720)
						minutes+=1
						staminacheck-=720
						goto Start2
					if(staminacheck>=12)
						seconds+=1
						staminacheck-=12
						goto Start2
					if(days>=1)usr<<"<center><font color=white>Your training time remaining with dual train is approx:</font> <font color = aqua>[days] </font>days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your training time remaining with dual train is approx:</font> <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your training time remaining with dual train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					usr.opendialog=0
					return
				if("Self Train")
					var/staminacheck=0
					var/days=0
					var/hours=0
					var/minutes=0
					var/seconds=0
					staminacheck=src.staminaleft_max
					if(staminacheck>=600000000)return
					Start
					if(staminacheck>=172800)
						days+=1
						staminacheck-=172800
						goto Start
					if(staminacheck>=7200)
						hours+=1
						staminacheck-=7200
						goto Start
					if(staminacheck>=120)
						minutes+=1
						staminacheck-=120
						goto Start
					if(staminacheck>=2)
						seconds+=1
						staminacheck-=2
						goto Start
					if(days>=1)usr<<"<center><font color=white>Your maximum training time with self train is approx:</font> <font color = aqua>[days]</font> days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your maximum training time with self train is approx:</font> <font color = lime>[hours]</font> hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your maximum training time with self train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					staminacheck=0
					days=0
					hours=0
					minutes=0
					seconds=0
					staminacheck=round(src.staminaleft_max-src.staminaleft)
					if(staminacheck>=600000000)return
					Start2
					if(staminacheck>=172800)
						days+=1
						staminacheck-=172800
						goto Start2
					if(staminacheck>=7200)
						hours+=1
						staminacheck-=7200
						goto Start2
					if(staminacheck>=120)
						minutes+=1
						staminacheck-=120
						goto Start2
					if(staminacheck>=2)
						seconds+=1
						staminacheck-=2
						goto Start2
					if(days>=1)usr<<"<center><font color=white>Your training time remaining with self train is approx:</font> <font color = aqua>[days] </font>days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your training time remaining with self train is approx:</font> <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your training time remaining with self train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					usr.opendialog=0
					return
				if("Focus Train")
					var/staminacheck=0
					var/days=0
					var/hours=0
					var/minutes=0
					var/seconds=0
					staminacheck=staminaleft_max
					if(staminacheck>=600000000)return
					Start
					if(staminacheck>=345600)
						days+=1
						staminacheck-=345600
						goto Start
					if(staminacheck>=14400)
						hours+=1
						staminacheck-=14400
						goto Start
					if(staminacheck>=240)
						minutes+=1
						staminacheck-=240
						goto Start
					if(staminacheck>=4)
						seconds+=1
						staminacheck-=4
						goto Start
					if(days>=1)usr<<"<center><font color=white>Your maximum training time with focus train is approx:</font> <font color = aqua>[days]</font> days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your maximum training time with focus train is approx:</font> <font color = lime>[hours]</font> hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your maximum training time with focus train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					staminacheck=0
					days=0
					hours=0
					minutes=0
					seconds=0
					staminacheck=round(src.staminaleft_max-src.staminaleft)
					if(staminacheck>=600000000)return
					Start2
					if(staminacheck>=345600)
						days+=1
						staminacheck-=345600
						goto Start2
					if(staminacheck>=14400)
						hours+=1
						staminacheck-=14400
						goto Start2
					if(staminacheck>=240)
						minutes+=1
						staminacheck-=240
						goto Start2
					if(staminacheck>=4)
						seconds+=1
						staminacheck-=4
						goto Start2
					if(days>=1)usr<<"<center><font color=white>Your training time remaining with focus train is approx:</font> <font color = aqua>[days] </font>days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your training time remaining with focus train is approx:</font> <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your training time remaining with focus train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					usr.opendialog=0
					return
					*/

/*
		Give_Zenni(mob/PC/M in player)
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Give Zenni")
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			if (M.client)
				var/amount=input("How much zenni do you wish to give?")as num
				if(!M)
					usr.opendialog=0
					return
				if(amount <= 0)
					usr << "You must enter a positive number!"
					usr.opendialog=0
					return
				if(amount > usr.zenni)
					usr << "You don't have that much zenni!"
					usr.opendialog=0
					return
				M.zenni += amount
				usr.zenni -= amount
				usr.client.SaveChar()
				M.client.SaveChar()
				usr.opendialog=0
			else
				usr<<"You can't give zenni to mobs"
				usr.opendialog=0
				return
				*/


		AdminHelp()
			set category = "Channels"
			set name = "Admin Help"
			set hidden = 1
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Admin Help")
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			if(VoteMute.Find(src.key))
				src << "You have been muted!"
				usr.opendialog=0
				return
			var/T=input("Admin Help:")as null|text
			if(lentext(T)>20)
				src.afktime=0
			src.CheckChatSpam(T)
			if(Check_For_Spam(T,SPAM) == TRUE)
				src<<"Please do not use linebreak characters."
				usr.opendialog=0
				return
			if(T==""||T==null||T==0||!T)
				usr.opendialog=0
				return
			if(src.admin_muted)
				src << "You are muted!"
				return
			if(src.adminsay_delay >= 3)
				src<<"You must wait 30 seconds before using Admin Help again."
				src.admin_muted = 1
				spawn(300)src.admin_muted = 0
				usr.opendialog=0
				return
			T = html_encode(T)
			if(lentext(T) > 350)
				ChatLog(src,"Admin Help: [T]")
				src<<"Your message cannot exceed 350 characters."
				T=copytext(T,1,350)
			for(var/mob/PC/C in player)
				if(C.GMLevel)
					C << "\red (ADMIN HELP) [src.name] Says: [T]"
			src<<"\red Message sent. <b>Note: this is sent as a chat message only to admins. If none are active they won't see it. Use the Report function, or the Discord, if you wish to leave a message that will be seen for sure"
			src.adminsay_delay+=1
			spawn(10)
				src.adminsay_delay-=1
			spawn(600)
				src.admin_muted=0
			usr.opendialog=0

/*		Trade()
			set category = "Channels"
			if(usr.spam_delay)
				usr << "You must wait before using this verb again"
				return
			if(usr.trading)
				usr << "You are currently trading with someone."
				return
			usr.trading=1
			var/tmp/list/T=new/list()
			for(var/mob/PC/M in oview(8))
				if(M.tradeon)
					T.Add(M)
			T.Add("Cancel")
			var/mob/M=input("Who do you want to trade with?")in T
			if(!T)
				usr.trading=0
				return
			if(M=="Cancel")
				usr.trading=0
				return
			if(!M)
				usr.trading=0
				return
			if(M.trading)
				usr<<"[M] is currently trading with someone."
				usr.trading=0
			switch(alert("Do you wish to trade with [M]?","Trade","Yes","No"))
				if("No")
					usr.trading=0
					return
				else
					switch(alert(M,"Do you wish to trade with [usr]?","Trade","Yes","No"))
						if("No")
							if(!usr)
								return
							usr.trading=0
							return
						else
							if(!usr)return
							M.trading=1
							usr.StartTrade(M)
*/
/*
		Give_Suggestions()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Give Suggestions")
			if(src.sugg_delay)
				src << "You must wait 5 minutes before using this verb again."
				return
			src.sugg_delay=1
			switch(alert("Do you want to give a suggestion for the game?","Give a Suggestion","Yes","No"))
				if("No")
					spawn(30)src.sugg_delay=0
				if("Yes")
					var/sugg=input({"Write down your suggestion. Make sure to include a topic (if you want to suggest \
					a new race, make the topic 'New Race' etc.); You may only type down up to 250 characters so make \
					good use of them. The LR staff appreciates the effort you are doing to make the game a better place \
					to play. Thank you. (Your key will be automaticaly registered.)
Suggestion Ex.:

Topic:

Suggestion:"})as null|message
					src.CheckChatSpam(sugg)
					if(!sugg)
						spawn(30)src.sugg_delay=0
						return
					if(lentext(sugg)>250)
						alert("Please cut it down to 250 characters, if you need more, please use the forums, you have \
						all the space you need there.")
						spawn(30)src.sugg_delay=0
					else
						var/suggname="[_month]-[_day]-[_year]"
						var/SuggFile=file("world save files/Suggestions/[suggname].txt")
						SuggFile<<{"**********
Made by: [src.key]{IP: [src.client.address]}


[sugg]
**********"}
						alert("Thank you for your suggestion!")
						spawn(3000)usr.sugg_delay=0
*/
/*		Bug_Report()
			set category = "Channels"
			if(src.bug_delay)
				usr << "You must wait 5 minutes before using this verb again"
				return
			usr.bug_delay=1
			switch(alert("Do you want to report a bug you have found in the game?","Report a Bug","Yes","No"))
				if("No")
					spawn(30)usr.bug_delay=0
				if("Yes")
					var/sugg=input({"Write down your report; You may only type down up to 250 characters so make \
					good use of them. The LR staff appreciates the effort you are doing to make the game a better place \
					to play. Thank you. (Your key will be automaticaly registered.)
Report Ex.:

Bug:"})as null|message
					src.CheckChatSpam(sugg)
					if(!sugg)
						spawn(30)usr.bug_delay=0
						return
					if(lentext(sugg)>250)
						alert("Please cut it down to 250 characters, if you need more, please use the forums, you have \
						all the space you need there.")
						spawn(30)usr.bug_delay=0
					else
						var/bugname="[_month]-[_day]-[_year]"
						var/BugFile=file("world save files/Bug Reports/[bugname].txt")
						BugFile<<{"**********
Made by: [src.key]{IP: [src.client.address]}

[sugg]
**********"}
						alert("Thank you for your report!")
						spawn(3000)usr.bug_delay=0
*/

/*		Ignore(mob/PC/C in world)
			set category = "Channels"
			if(C == src)
				return

			if(istype(C,/mob/PC))
				var/X = alert("Do you want to ignore all messages from [C]?","Ignore [C]","Yes","No")
				if(X == "No")
					return
				else
					if(Ignored.Find(C))
						usr << "You have already ignored [C]."
						return

					Ignored += C
					usr << "You are now ignoring [C]."

					if(!C.Ignored.Find(usr))
						C << "[usr] has added you to their ignore list."
			else+
				usr << "You can only Ignore Players!"
				return


		Unignore(mob/C in Ignored)
			set category="Channels"

			var/X = alert("Do you want to un-ignore [C]?","Unignore [C]","Yes","No")
			if(X == "No")
				return
			else
				Ignored -= C
				usr << "You are no longer ignoring [C]."

				if(!C.Ignored.Find(usr))
					C << "[usr] has removed you from their ignore list."
*/
//Disabled send file as if a name is changed during send file a person can inject html into the game to access commands
		Send_File(mob/person in view(usr),filez as file)
			set category = "Channels"
			set name = "Send File"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Send File")
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			AdminMessage("[usr] is trying to send [person] a file  called [filez]")
			switch(alert(person,"[usr] is trying to send you a file its called [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
				if("Yes")
					alert(usr,"[person] accepted the file","File Accepted")

					person<<ftp(filez)
				if("No")
					alert(usr,"[person] declined the file","File Declined")
			usr.opendialog=0

		Save_Icon(obj/filez as icon in usr.contents)
			set hidden = 1
			set category = "Channels"
			set name = "SaveIcon"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Send File")
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			AdminMessage("[usr] is trying to send save a file  called [filez]")
		//	switch(alert(person,"[usr] is trying to send you a file its called [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
		//		if("Yes")
			alert(usr,"[usr] accepted the file","File Accepted")

			usr<<ftp(filez)

			usr.opendialog=0

		Who()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Who")
			if(usr.spam_delay)
				usr << "You must wait before using this verb again"
				return
			usr.spam_delay = 1
			var/count = 0
			var/browsewindow
			//usr<<"<body bgcolor="#000000" text="#FFFFFF"><big><font color = green>Online Player Check</font>"
			browsewindow += "<b><font size = 3><body bgcolor=#000000 text=#FFFFFF><font color = green>Online Player Check</b><br><br></font>"
			for(var/mob/PC/M)
				count++
				if(M.guild_name=="")
					browsewindow += "<font size = 2><body bgcolor=#000000 text=#FFFFFF><font color = green>Name: </font><font color = white>[M.name] ([M.key])</font> <font color = green>&nbsp;Race: </font><font color = white>[M.race]</font> <font color = green>&nbsp;Guild:</font> <font color = white>None</font><br>"
					//usr<<"<big><font color = green>Name: </font><font color = white>[M.name] ([M.key])</font> <font color = green>Race: </font><font color = white>[M.race]</font> <font color = green>Guild:</font> <font color = white>None</font>"

				else
					//usr<<"<big><font color = green>Name: </font><font color = white>[M.name] ([M.key])</font> <font color = green>Race: </font><font color = white>[M.race]</font> <font color = green>Guild:</font> <font color = white>[M.guild_name]</font>"
					browsewindow += "<font size = 2><body bgcolor=#000000 text=#FFFFFF><font color = green>Name: </font><font color = white>[M.name] ([M.key])</font> <font color = green>&nbsp;Race: </font><font color = white>[M.race]</font> <font color = green>&nbsp;Guild:</font> <font color = white>[M.guild_name]</font><br>"

			//usr<<"<big><font color = white> Players Online: [count]"
			browsewindow += "<br><br><body bgcolor=#000000 text=#FFFFFF><font size = 3><font color = white> Players Online: [count]"
			usr<<browse(browsewindow,"window=Players Online;size=800x600")
			usr.spam_delay = 0


//		Who2()

//			var/html="<html><head><title>Who</title></head>\
//			<body bgcolor=#000000> <text=#FFFFFF><body></td></tr>" // The code above is part of the table to display the players in the world.
//			for(var/mob/M in world) // this is a for list proc to search for mobs in the world.
//				if(M.client) // If the mob is a client add the below code.
//					html+="<tr><td algin=center><a href='?page=[M.key];action=Pages'>[M.name]</a></td>" //  add a cell to the talbe that contains the mobs key.
//			html+="</table></body></html>" // close all html tags
//			src<<browse(html,"window=who;size=275x300") // call the browse proc and tell it to display the html var
/*

		GameGuide()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Game Guide")
			if(usr.spam_delay)
				usr << "You must wait before using this verb again."
				return
			usr.spam_delay=1
			spawn(1)src.mainfile()
			spawn(35)usr.spam_delay=0
			winset(src,"Guide","is-visible=true")
*/
		Online_Moderators()
			set category="Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Online Moderators")
			var/gmc = 0
			src<<"<big><font color=red>Online Enforcers:"
			for(var/mob/PC/M in player)
				if(M.GMLevel)
					gmc ++
					src<<"<big><font color=red>[M]([M.key]) Level: [M.GMLevel]"
			src <<"<big><font color=#cccccc>GMs Online: [gmc]"

		/*
		Save()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Save")
			src.afktime=0
			if(src.saving)
				src << "You must wait before using this verb again"
				return
			if(cantsaveatall)
				src<<"World Shut down enabled. Saving has been disabled for safety reasons."
				return
			if(!src.saving)
				src.saving = 1
				alert("Game Saved!")
				src.client.SaveChar()
				spawn(30)src.saving = 0
				*/

		ServerInformation()
			set name = "Server Information"
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Server Information")
			if(usr.spam_delay)
				usr << "You must wait before using this verb again."
				return
			usr.spam_delay=1
			var/calcLag=abs(world.cpu-100)
			var/timeup=round((world.time/10)/60)
			var/server="<br><font color=red>Server Information:<br>"
			server+= {"<small><font color=red>Hosted On:<font color=white> [world.system_type]<br>"}
			server+= {"<small><font color=red>FPS:<font color=white> [world.fps]<br>"}
			server+= {"<small><font color=red>Efficiency:<font color=white> [calcLag]%<br>"}
			server+= {"<small><font color=red>Address:<font color=white> byond://[world.address]:[world.port]<br>"}
			server+= {"<small><font color=red>Time Up:<font color=white> [timeup] minutes<br>"}
			usr<<server
			spawn(50)usr.spam_delay=0

		Scoreboard()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Scoreboard")
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			switch(input("Which do you wish to view?","Scoreboard",) in list("Level","Power","Ki","Strength","Defense","Kills","Cancel"))
				if("Level")
					Ranking(src)
					RankingDisplay(src)
				if("Power")
					PLRanking(src)
					PLRankingDisplay(src)
				if("Ki")
					KIRanking(src)
					KIRankingDisplay(src)
				if("Ki Defense")
					KIDEFRanking(src)
					KIDEFRankingDisplay(src)
				if("Strength")
					STRRanking(src)
					STRRankingDisplay(src)
				if("Defense")
					DEFRanking(src)
					DEFRankingDisplay(src)
				if("Kills")
					KillRanking(src)
					KillRankingDisplay(src)
				if("Cancel")
					usr.opendialog=0
					return
			usr.opendialog=0


	// Do not modify this code unless you know what your doing.


/var/const/
	scoreboard={""}
	scoreboardtitle={"<STYLE>BODY {background: black;  color: white}</STYLE><head><title>Scoreboard</title></head></body>"}
/Rank_Entry/
	var{Name;Key;Level;Date;Kills;Power;KI;KID;STR;DEF}
	New(mob/person)
		if(!person)return
		Name=(person.name)
		Key=(person.key)
		Level=(person.level)
		Date=(time2text(world.realtime))
		Kills=(person.pks)
		Power=(person.powerlevel)
		KI=(person.ki)
		KID=(person.kidefense)
		STR=(person.strength)
		DEF=(person.defence)
/proc/
	RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/levels.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=#DAA520>Level<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/player=(levels[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[applycommas(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/levels.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score
		score=(level.len)
		if(score>=20)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 21
			level[(score)]=(character)
		else score=(level.len+1),level+=(character)
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score
	KillRankingDisplay(var/mob/person)
		var/list/ScoreboardList=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/PKills.sav")
		F[("stuff")]>>(ScoreboardList)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=#DAA520>Player Kills<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!ScoreboardList)html+="<TR><TD>No rankings.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Kills</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to ScoreboardList.len)
				var{character=(ScoreboardList[(number)]);Rank_Entry/player=(ScoreboardList[(character)])}
				html+="<tr><td>[(number)])</td><td>     [(player.Name)]</td><td>                    [applycommas(player.Kills)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	KillRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/PKills.sav")
		var/list/ScoreboardKills=new()
		F[("stuff")]>>(ScoreboardKills)
		if(!ScoreboardKills)ScoreboardKills=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=ScoreboardKills.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(ScoreboardKills[(character)])
			if(old.Kills>=player.pks)return score
			while(score>1)
				last=ScoreboardKills[(ScoreboardKills[(score-1)])]
				if(last.Kills>=player.pks)break
				ScoreboardKills[(score)]=(ScoreboardKills[(score-1)])
				ScoreboardKills[(--score)]=(character)
				ScoreboardKills[(ScoreboardKills[(score+1)])]=(last)
			ScoreboardKills[(character)]=(newest)
			F[("stuff")]<<(ScoreboardKills)
			return score
		score=(ScoreboardKills.len)
		if(score>=20)
			last=(ScoreboardKills[(ScoreboardKills[(score)])])
			if(last.Kills>=player.pks)return 21
			ScoreboardKills[(score)]=(character)
		else score=(ScoreboardKills.len+1),ScoreboardKills+=(character)
		while(score>1)
			last=(ScoreboardKills[(ScoreboardKills[(score-1)])])
			if(last.Kills>=player.pks)break
			ScoreboardKills[(score)]=(ScoreboardKills[(score-1)])
			ScoreboardKills[(--score)]=(character)
			ScoreboardKills[(ScoreboardKills[(score+1)])]=(last)
		ScoreboardKills[(character)]=(newest)
		F[("stuff")]<<(ScoreboardKills)
		return score
	PLRankingDisplay(var/mob/person)
		var/list/power=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/PL.sav")
		F[("stuff")]>>(power)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=#DAA520>Power<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!power)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Power</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to power.len)
				var{character=(power[(number)]);Rank_Entry/player=(power[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[applycommas(player.Power)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	PLRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/PL.sav")
		var/list/power=new()
		F[("stuff")]>>(power)
		if(!power)power=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=power.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(power[(character)])
			if(old.Power>=player.powerlevel)return score
			while(score>1)
				last=power[(power[(score-1)])]
				if(last.Power>=player.powerlevel)break
				power[(score)]=(power[(score-1)])
				power[(--score)]=(character)
				power[(power[(score+1)])]=(last)
			power[(character)]=(newest)
			F[("stuff")]<<(power)
			return score
		score=(power.len)
		if(score>=20)
			last=(power[(power[(score)])])
			if(last.Power>=player.powerlevel)return 21
			power[(score)]=(character)
		else score=(power.len+1),power+=(character)
		while(score>1)
			last=(power[(power[(score-1)])])
			if(last.Power>=player.powerlevel)break
			power[(score)]=(power[(score-1)])
			power[(--score)]=(character)
			power[(power[(score+1)])]=(last)
		power[(character)]=(newest)
		F[("stuff")]<<(power)
		return score
	KIRankingDisplay(var/mob/person)
		var/list/newki=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/KI.sav")
		F[("stuff")]>>(newki)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=#DAA520>Ki<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!newki)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Ki</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to newki.len)
				var{character=(newki[(number)]);Rank_Entry/player=(newki[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[applycommas(player.KI)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	KIRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/KI.sav")
		var/list/newki=new()
		F[("stuff")]>>(newki)
		if(!newki)newki=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=newki.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(newki[(character)])
			if(old.KI>=player.ki)return score
			while(score>1)
				last=newki[(newki[(score-1)])]
				if(last.KI>=player.ki)break
				newki[(score)]=(newki[(score-1)])
				newki[(--score)]=(character)
				newki[(newki[(score+1)])]=(last)
			newki[(character)]=(newest)
			F[("stuff")]<<(newki)
			return score
		score=(newki.len)
		if(score>=20)
			last=(newki[(newki[(score)])])
			if(last.KI>=player.ki)return 21
			newki[(score)]=(character)
		else score=(newki.len+1),newki+=(character)
		while(score>1)
			last=(newki[(newki[(score-1)])])
			if(last.KI>=player.ki)break
			newki[(score)]=(newki[(score-1)])
			newki[(--score)]=(character)
			newki[(newki[(score+1)])]=(last)
		newki[(character)]=(newest)
		F[("stuff")]<<(newki)
		return score
	KIDEFRankingDisplay(var/mob/person)
		var/list/newkid=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/KIDEF.sav")
		F[("stuff")]>>(newkid)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=#DAA520>Ki Defense<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!newkid)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Ki Defense</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to newkid.len)
				var{character=(newkid[(number)]);Rank_Entry/player=(newkid[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[applycommas(player.KID)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	KIDEFRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/KIDEF.sav")
		var/list/newkid=new()
		F[("stuff")]>>(newkid)
		if(!newkid)newkid=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=newkid.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(newkid[(character)])
			if(old.KID>=player.kidefense)return score
			while(score>1)
				last=newkid[(newkid[(score-1)])]
				if(last.KID>=player.kidefense)break
				newkid[(score)]=(newkid[(score-1)])
				newkid[(--score)]=(character)
				newkid[(newkid[(score+1)])]=(last)
			newkid[(character)]=(newest)
			F[("stuff")]<<(newkid)
			return score
		score=(newkid.len)
		if(score>=20)
			last=(newkid[(newkid[(score)])])
			if(last.KID>=player.kidefense)return 21
			newkid[(score)]=(character)
		else score=(newkid.len+1),newkid+=(character)
		while(score>1)
			last=(newkid[(newkid[(score-1)])])
			if(last.KID>=player.kidefense)break
			newkid[(score)]=(newkid[(score-1)])
			newkid[(--score)]=(character)
			newkid[(newkid[(score+1)])]=(last)
		newkid[(character)]=(newest)
		F[("stuff")]<<(newkid)
		return score
	STRRankingDisplay(var/mob/person)
		var/list/newstr=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/STR.sav")
		F[("stuff")]>>(newstr)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=#DAA520>Strength<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!newstr)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Strength</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to newstr.len)
				var{character=(newstr[(number)]);Rank_Entry/player=(newstr[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[applycommas(player.STR)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	STRRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/STR.sav")
		var/list/newstr=new()
		F[("stuff")]>>(newstr)
		if(!newstr)newstr=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=newstr.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(newstr[(character)])
			if(old.STR>=player.strength)return score
			while(score>1)
				last=newstr[(newstr[(score-1)])]
				if(last.STR>=player.strength)break
				newstr[(score)]=(newstr[(score-1)])
				newstr[(--score)]=(character)
				newstr[(newstr[(score+1)])]=(last)
			newstr[(character)]=(newest)
			F[("stuff")]<<(newstr)
			return score
		score=(newstr.len)
		if(score>=20)
			last=(newstr[(newstr[(score)])])
			if(last.STR>=player.strength)return 21
			newstr[(score)]=(character)
		else score=(newstr.len+1),newstr+=(character)
		while(score>1)
			last=(newstr[(newstr[(score-1)])])
			if(last.STR>=player.strength)break
			newstr[(score)]=(newstr[(score-1)])
			newstr[(--score)]=(character)
			newstr[(newstr[(score+1)])]=(last)
		newstr[(character)]=(newest)
		F[("stuff")]<<(newstr)
		return score
	DEFRankingDisplay(var/mob/person)
		var/list/newdef=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/DEF.sav")
		F[("stuff")]>>(newdef)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=#DAA520>Defense<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!newdef)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Defense</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to newdef.len)
				var{character=(newdef[(number)]);Rank_Entry/player=(newdef[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[applycommas(player.DEF)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	DEFRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/DEF.sav")
		var/list/newdef=new()
		F[("stuff")]>>(newdef)
		if(!newdef)newdef=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=newdef.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(newdef[(character)])
			if(old.DEF>=player.defence)return score
			while(score>1)
				last=newdef[(newdef[(score-1)])]
				if(last.DEF>=player.defence)break
				newdef[(score)]=(newdef[(score-1)])
				newdef[(--score)]=(character)
				newdef[(newdef[(score+1)])]=(last)
			newdef[(character)]=(newest)
			F[("stuff")]<<(newdef)
			return score
		score=(newdef.len)
		if(score>=20)
			last=(newdef[(newdef[(score)])])
			if(last.DEF>=player.defence)return 21
			newdef[(score)]=(character)
		else score=(newdef.len+1),newdef+=(character)
		while(score>1)
			last=(newdef[(newdef[(score-1)])])
			if(last.DEF>=player.defence)break
			newdef[(score)]=(newdef[(score-1)])
			newdef[(--score)]=(character)
			newdef[(newdef[(score+1)])]=(last)
		newdef[(character)]=(newest)
		F[("stuff")]<<(newdef)
		return score
/*
// Do not modify this code unless you know what your doing.

#define DEBUG
/var/const/
	scoreboard={""}
	scoreboardtitle={"<STYLE>BODY {background: black;  color: white}</STYLE><head><title>Scoreboard</title></head></body>"}
/Rank_Entry/
	var{Name;Key;Level;Date}
	New(mob/person)
		if(!person)return
		Name=(person.name)
		Key=(person.key)
		Level=(person.level)
		Date=(time2text(world.realtime))
/proc/
	RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("world save files2/levels.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/player=(levels[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.Level),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("world save files2/levels.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score
		score=(level.len)
		if(score>=25)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 11
			level[(score)]=(character)
		else score=(level.len+1),level+=(character)
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score

mob/verb/Scoreboard()
	set category = "Channels"
	Ranking(src)
	RankingDisplay(src)

*/


mob
	var
		tradeon=1
		tmp
			trading=0
	proc
		StartTrade(mob/PC/M)
			var/list/A=new/list()
			var/list/B=new/list()
			for(var/obj/Equipment/O1 in src)
				if(!O1.equiped)
					A.Add(O1)
			for(var/obj/Equipment/O2 in M)
				if(!O2.equiped)
					B.Add(O2)
			A.Add("Zenni")
			B.Add("Zenni")
			A.Add("Cancel")
			B.Add("Cancel")
			var/z1
			var/obj/W1
			var/obj/W2
			W1=input(src,"What do you want from [M]?")in B
			if(W1=="Cancel")
				M<<"[src] has canceled the trade."
				src.trading=0
				M.trading=0
				return
			if(W1=="Zenni")
				z1=input("How much Zenni do you want from [M]?","",M.zenni)as num
				if(!z1||z1<=0||z1>M.zenni)
					src<<"Number not valid."
					src.StartTrade(M)
				switch(alert(M,"[src] wants: [z1] Zenni. Are you willing to trade?","Trade","Yes","No"))
					if("No")
						src<<"[M] does not want to trade."
						src.trading=0
						M.trading=0
						return
					else
						src<<"[M] accepted."
						goto TurnOver
			else
				if(W1.equiped||!W1)
					src<<"That item is not available anymore."
					src.StartTrade(M)
				if(W1 in M.contents)
					src<<"Requested trade item: \icon[W1.icon] - [W1.name]"
					switch(alert(M,"[src] wants: [W1]. Are you willing to trade it?","Trade","Yes","No"))
						if("No")
							src<<"[M] does not want to trade [W1]."
							src.trading=0
							M.trading=0
							return
						else
							src<<"[M] accepted."
							goto TurnOver
				else
					src<<"That item is not available anymore."
					src.StartTrade(M)
			TurnOver
			W2=input(M,"What do you want from [src]?")in A
			if(W2=="Cancel")
				src<<"[M] has canceled the trade."
				src.trading=0
				M.trading=0
				return
			if(W2=="Zenni")
				var/z2=input(M,"How much Zenni do you want from [src]?","",src.zenni)as num
				if(!z2||z2<=0||z2>src.zenni)
					M<<"Number not valid."
					goto TurnOver
				switch(alert(src,"[M] wants: [z2] Zenni. Are you willing to trade?","Trade","Yes","No"))
					if("No")
						M<<"[src] does not want to trade."
						src.trading=0
						M.trading=0
						return
					else
						switch(alert(M,"[src] accepted. Go ahead with the trade?","Trade","Yes","No"))
							if("No")
								src<<"[M] does not want to trade."
								src.trading=0
								M.trading=0
							else
								if(W1=="Zenni")
									if(M.zenni<z1)
										src<<"[M] does not have enough zenni."
										M<<"You do not have enough zenni."
										src.trading=0
										M.trading=0
										return
									else
										M.zenni-=z1
										src.zenni+=z1
										M<<"Trade successful."
										src<<"Trade successful."
										src.trading=0
										M.trading=0
										return
								else
									if(W1.equiped||!W1)
										src<<"That item is not available anymore."
										src.trading=0
										M.trading=0
										return
									else
										if(src.zenni<z2)
											M<<"[src] does not have enough zenni."
											src<<"You do not have enough zenni."
											src.trading=0
											M.trading=0
											return
										if(W1 in M.contents)
											if(istype(W1,/obj/Equipment/Guild_Item)||istype(W1,/obj/Equipment/Guild_Item2))
												if(!src.in_guild)
													M<<"[src] must be in a guild to trade Guild Items."
													src<<"You must be in a guild to trade Guild Items."
													src.trading=0
													M.trading=0
													return
												else
													W1.guild=src.guild_name
													goto EndTrade
											EndTrade
											W1.loc=src
											W1.item_owner=src.key
											src.zenni-=z2
											M.zenni+=z2
											M<<"Trade successful."
											src<<"Trade successful."
											src.trading=0
											M.trading=0
											return
			else
				if(W2.equiped||!W2)
					M<<"That item is not available anymore."
					B.Remove(W2)
					goto TurnOver
				if(W2 in src.contents)
					M<<"Requested trade item: \icon[W2.icon] - [W2.name]"
					switch(alert(src,"[M] wants: [W2]. Are you willing to trade?","Trade","Yes","No"))
						if("No")
							M<<"[src] does not want to trade."
							src.trading=0
							M.trading=0
							return
						else
							switch(alert(M,"[src] accepted. Go ahead with the trade?","Trade","Yes","No"))
								if("No")
									src<<"[M] does not want to trade."
									src.trading=0
									M.trading=0
									return
								else
									if(W1=="Zenni")
										if(M.zenni<z1)
											src<<"[M] does not have enough zenni."
											M<<"You do not have enough zenni."
											src.trading=0
											M.trading=0
											return
										else
											if(W2.equiped||!W2)
												M<<"That item is not available anymore."
												src.trading=0
												M.trading=0
												return
											else
												if(W2 in src.contents)
													if(istype(W2,/obj/Equipment/Guild_Item)||istype(W2,/obj/Equipment/Guild_Item2))
														if(!M.in_guild)
															src<<"[M] must be in a guild to trade Guild Items."
															M<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else
															W2.guild=M.guild_name
													W2.loc=M
													W2.item_owner=M.key
													M.zenni-=z1
													src.zenni+=z1
													M<<"Trade successful."
													src<<"Trade successful."
													src.trading=0
													M.trading=0
													return
									else
										if(W1.equiped||!W1)
											src<<"That item is not available anymore."
											src.trading=0
											M.trading=0
											return
										if(W2.equiped||!W2)
											M<<"That item is not available anymore."
											src.trading=0
											M.trading=0
											return
										else
											if(W2 in src.contents)
												if(W1 in src.contents)
													if(istype(W2,/obj/Equipment/Guild_Item)||istype(W2,/obj/Equipment/Guild_Item2))
														if(!M.in_guild)
															src<<"[M] must be in a guild to trade Guild Items."
															M<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else
															W2.guild=M.guild_name
													if(istype(W1,/obj/Equipment/Guild_Item)||istype(W1,/obj/Equipment/Guild_Item2))
														if(!src.in_guild)
															M<<"[src] must be in a guild to trade Guild Items."
															src<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else
															W1.guild=src.guild_name
													W1.loc=src
													W2.loc=M
													W1.item_owner=src.key
													W2.item_owner=M.key
													M<<"Trade successful."
													src<<"Trade successful."
													src.trading=0
													M.trading=0
													return
				else
					M<<"That item is not available anymore."
					src.trading=0
					M.trading=0
					return





		/*
		Updates()
			set category = "Channels"
			src<<browse({"
<body bgcolor="#000000" text="#FFFFFF">
<font face="Tahoma">
<font color=silver style="font-size: 12pt">Updates</font>
<font style="font-size: 8pt">
<br>
<br>
<u>19/04/2015:</u><br><br>
Added Majin Incarnate gene for Humans<br>
"})*/




mob/PC/verb/New_Game_Guide()
	set category = "Channels"
	set name = "Game Guide"
//	usr << browse("<script>window.location='https://docs.google.com/spreadsheets/d/10y6a_sSrYk2jUL8P9y6uO_Q8ZsRdt__iPpi43xW9jBw/edit?usp=sharing';</script>")
 //usr << browse(file("help.html"),"window=help")
	//src << browse(file("Race Multis.html"),"window=Transformation Multis;size=1280x720;titlebar=1;can_resize=1")
	switch(input("View which guide??")in list("FAQ","Game Guide","Mob Stats","Technique List","Transformation Multis","Transformation Requirements","Training Modes and Ranks","Gravity Training","Suits","View Maps","Cancel"))
		if("FAQ")
			src << link("https://docs.google.com/document/d/12TDxDl_38s4xfZ928ZYrjwI0SRvuUzlrO-VdwnEP9xo/edit?usp=sharing")
		if("Game Guide")
			src << link("https://docs.google.com/document/d/19YoYpG4i_fixRGffBqBc_t_6Syioa_OjD5aNUR9m3X4/edit?usp=sharing")
		if("Mob Stats")
			src << link("https://docs.google.com/spreadsheets/d/1fT8U22HOEf8SfBlyFz8v7RecLyxUmKnh_W2FFfeicEA")
		if("Technique List")
			src << link("https://docs.google.com/document/d/17Tqg8Orl5Tdhl8FdLeAaAlbfuh_v8vkqkU7jWOGS3AQ/edit?usp=sharing")

		if("Transformation Multis")
			src << link("https://docs.google.com/spreadsheets/d/1aER0L9bTh_iW8sADsiZMRLAN031a4WoMn0r3gwTCHPc/edit?usp=sharing")
			//src << link("https://docs.google.com/spreadsheets/d/16jJDm7wmLtSNnhfh-gVg3QJ1oQ0YbRQixn-I9YDvtK0/edit?usp=sharing")
		if("Transformation Requirements")
			src << link("https://docs.google.com/document/d/1Uc2BfRb_ZGm703JgOBuOQ55VAUjXHuGyZa0RhMX9VRs/edit?usp=sharing")
		if("Gravity Training")
			src << link("https://docs.google.com/document/d/1-iQsErkEAkKZBICuObr6ZdgO2pkeJSM4g-4zh8Afztk/edit?usp=sharing")
		if("Suits")
			src << link("https://docs.google.com/document/d/18qpfD6_qhzB4mzsnNTh0sVm8TbNL_qG1r5eCMJJH4hQ/edit?usp=sharing")
		if("View Maps")
			src << link("https://docs.google.com/document/d/1d8pWcws-7eoSSe3HJHA1vhshb5t3D55G5BE4gXDwnqo/edit?usp=sharing")


		if("Training Modes and Ranks")
			src << link("https://docs.google.com/document/d/1xoMnWJlsn4Fn9I_jHc2U-z_Yt0jmBCdM9vZVSNEG5eU/edit?usp=sharing")


//*/


