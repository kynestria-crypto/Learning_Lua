###### "What is *this* crap?"
​	This is just a little mini project I created while learning Lua. Everything in it is just pure Lua code. It doesn't interact with anything outside and is basically useless outside of Lua environment. I think? (We covered the part where I'm learning, right?)

###### "Ugh. Fine. What is it supposed to "do"?"
​	Hey. Thanks for asking. So, I have a table with a questline: Title, steps, rewards, etc.
```lua
local quest_name = {
"step1",
"step2",
"step3", -- etc...

title = "Quest Title", --> the title that is actually displayed
rewards = {"reward1","reward2"},
auras = {["Buff Name"] = "Buff Description"},
​	​	{["Debuff Name"] = "Debuff Description"},
},
completed = false, --> true/false flag for quest completion
stepsDone = {} --> holds original steps value.
--[[questProgress() changes value of each step to true. This holds
that original value so I can use them again later. Maybe there's a 
better way. This is just what I worked out.]]
}
```
​	Obviously, the idea is that all of the information about the quest is stored in a single table, all nice and neat, right?

​	Side note: In my hypothetical quest, completion of the quest grants a buff and a debuff. The whole thing is a TV show reference and... doesn't matter. That's why they're there. They would be bestowed upon the player on quest completion.

###### "Cool, but like... then what?"
​	Getting to that. I have these three functions:
```lua
questRewards(questTable) --[[Will print the rewards, buffs, debuffs.
I can always add more things by adding them to the table to this in here.
Like a currency reward or other things]]

showQuest(questTable) --[[Will print the quest steps with completed steps
marked. This is why I needed somewhere to store the original values for 
the steps before they are changed to true]]

questProgress(questTable) --[[Triggers the completion of the next step in 
the quest. Prints a message saying that step is completed. If all steps are
completed; it prints a completion message, then uses showQuest to display 
all steps as completed, followed by questRewards() to display the rewards
received]]
```

###### "But...why?"
​​	The learning. That's why. I'll spend time learning a concept, taking notes, then try to create my own example of that concept in action. I'll test it out and if it works, then "Yay me!", I can move on to the next topic to learn. Why a questline progressor / tracker? I play WoW. Why the TV show reference? It's my favorite show. Learning something really should be fun and engaging. So, I'm making it that for me.