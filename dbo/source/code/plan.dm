/*
DBO v1.2 plan
>Add in 'focus' system
>Remove WHP
>Start on the 'legend' system
>Make stamina increasable
>Add in a new area off snakeway for Princess Snake

'Focus' system
>Add in a hidden 'focus' stat, which can control the power of ki attacks
>'focus' decreaces over time, but meditation increates it

'Legend' system
>New stat:'fame'
>Gained by killing major mobs
-Add in legendary transes for each race, and they each require a certain amount of 'fame' -- and some questing -- to obtain
-Change LSSJ to use this new system

Things to do by v1.5:
-Redo custom techs
-Redo all techs
-Redo all NPCs
-Redo transes
-Add GM-only race
-Add GM-hangout place
*/

var/updates_html = {"<b><font color="yellow"><center>Version 1.2 Updates:</center></font><b>
<p><font color="yellow">
<ol>
	<li>2005-12-01 to 2005-12-05 - Misc. bug fixes</li>
	<li>2005-12-01 to 2005-12-03 - Focus system added</li>
	<li>2005-12-03 - WHP Removed</li>
	<li>2005-12-03 - Finished set of changes to stamina to allow for increaseable max</li>
	<li>2005-12-04 - Added new area for Princess Snake off snakeway</li>
	<li>2005-12-05 - Re-implemented the 'Power Up' technique</li>
	<li>2005-12-05 - Added name display for techniques in the HUD menu</li>
</ol>
</font></p><b><font color="yellow"><center>Version 1.1.1 Updates:</center></font><b>
<p><font color="yellow">
<ol>
	<li>2005-11-27 -- Bug fixes. LOTS of bug fixes.</li>
</ol>
</font></p>
<b><font color="yellow"><center>Version 1.1 Updates:</center></font><b>
<p><font color="yellow">
<ol>
	<li>2005-11-08 to 2005-11-23 - Completions of partially implemented things (ongoing changes)</li>
	<li>2005-11-08 to 2005-11-26 - Miscellaneous bug fixes</li>
	<li>2005-11-09 - Changed grav turfs (HBTC, Kaioshins, etc.)</li>
	<li>2005-11-09 - Changed saving system to fix the rollback bug</li>
	<li>2005-11-10 - Changed name display</li>
	<li>2005-11-13 - Rework of skill storage and some stats</li>
	<li>2005-11-13 to 2005-11-26 - Changed HUD (Mostly icon work)</li>
	<li>2005-11-22 - Added in system to try to reduce/fix the overlay bug</li>
	<li>2005-11-22 - Made Yemma be less discriminatory against good and evil players</li>
	<li>2005-11-22 - Absorb and Eat now use the standard death code</li>
	<li>2005-11-23 - Monsters now give out skill point exp</li>
	<li>2005-11-23 - Skill point exp needed now increases slightly for every new skill point</li>
	<li>2005-11-23 - Stamina regen from rest increased</li>
	<li>2005-11-23 - Completed ki skills system</li>
	<li>2005-11-26 - Removed the PL/W/H/P reqs from leaving hell</li>
	<li>2005-11-26 - The physical attack commands are now bound to macros: Q for punch, W for kick, A for block, and S for throw</li>
</ol>
</font></p>
<b><font color="yellow"><center>Version 1.00.20 Updates:</center></font><b>
<p><font color="yellow">
<b>Note:</b> This inclues all updates since the initial release of 1.00.19.1 in January 2005. <br />
<ol>
	<li>New character icons (Namek, Saiyan/Human) added</li>
	<li>Rest bug has been fixed</li>
	<li>Team Train bonuses increased</li>
	<li>The map has been modified</li>
	<li>New enemy mobs were added</li>
	<li>More quests were added</li>
	<li>Heavens was added</li>
	<li>Bio android transformation requirements changed</li>
	<li>Skill point system redone</li>
	<li>New title page</li>
</ol>
</font></p>
<b><font color="yellow"><center>Version 1.00.19.1 Updates:</center></font><b>
<p><font color="yellow">
<ol>
	<li>2005-01-29 - World-Chat reenabled</li>
	<li>2005-01-29 - GM code changed, new GM level added</li>
	<li>2005-01-29 - Custom Clothing NPC added</li>
</ol>
</font></p>
<b><font color="yellow"><center>Version 1.00.19 Updates:</center></font><b>
<p><font color="yellow">
<ol>
	<li>New Character Creation</li>
	<li>Mail System</li>
	<li>2005-01-16 - Guilds Removed(To be redone with a better system)</li>
	<li>2005-01-23 - New Guild System Added</li>
	<li>2005-01-27 - Fixed both Mechanical Android quests</li>
</ol>
</font></p>"}