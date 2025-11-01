--[Quest Info table]
local over_the_rainbow = {
    --[Quest steps]
    "Help Wesley research opening a new portal",
    "Ask Lorne to locate a mystical hot spot",
    "Enter the portal to Pylea", 
    --[/Quest steps]
    title = "To Pylea", --> Quest Title
    reward = {"fur mantle", "Crebbil"}, --> Quest rewards (items) as an array.
    --[Auras] buff/debuffs received upon quest completion.
    auras = {buff = {["Daywalking"] = "Your human side is dominant in Pylea.\nYou are able to walk in sunlight,\nand you've noticed you have a reflection.\n...and why has no one ever told you\nabout your hair?"},
            -- buff = {["<Buff Name>"] = "Buff description"}
            debuff = {["Van-Tal"] = "When accessing your inner-demon;\nYou take on the true form of your inner-demon. \nYou enter a berserk-like state with no control."}
            -- debuff = {["<Debuff Name>"] = "Debuff description"}
        },
    --[/Auras]
    completed = false, -- true/false flag for quest completion
    stepsDone = {} --> "questProgress()" will store original step description here before changing the step to "true"}
}
--[/Quest info table]

--[[questRewards: Prints the rewards, and auras(if applicable) received from completing the quest.]]
local function questRewards(questTable)
    print("\n{[( )]}<<<Rewards>>>{[( )]}") -->Prints a "fancy" header...
    if questTable.completed == true then --> checks if true/false flag is "true"...
        if questTable.reward then --> checks if there are quest reward items...
            for i, v in ipairs(questTable.reward) do
                print(v .. " - added to inventory") --> prints each reward as "<Reward-Name> - added to inventory"
            end
        end
        if questTable.auras.buff then --> checks if there are buffs...
            for k, v in pairs(questTable.auras.buff) do
            print("\nBuff- " .. k .. ":" .. v) -- prints buff name and description
            end
        end
            if questTable.auras.debuff then --> checks if there are debuffs
            for k, v in pairs(questTable.auras.debuff) do
            print("\nDebuff- " .. k .. ":" .. v) --> prints debuff name and description
            end
        end
    end
end
--[/questRewards]
--[showQuest] will print current quest progress
local function showQuest(questTable)
    print("\nQuest:", questTable.title) --> prints "Quest:<title>"
    print(string.rep("-", 40))          --> prints "-" 40 times. (prints a divider line)

    for stepNum, step_is in ipairs(questTable) do
        local status = (step_is == true) and "[✔]" or "[ ]" 
        --> if the step from the quest table has been changed to "true" by questProgress(): status = "[✔]"
        --> if the step from the quest table *has not* been changed: status = "[ ]"
        local stepName = step_is --> assigns the value of "step_is" to "stepName" 
            if step_is == true then --> checks if "step_is" has been changed to "true"
            stepName = questTable.stepsDone[stepNum]--> assigns the stored original step description to "stepName"
            end            
--[[The catch here is, once step_is has been set to "true", the original step description is gone.
I wanted to be able to print the step description each time I used showQuest().
So, I needed the function to store the step description somewhere so it could be 
recalled by showQuest() to print it.]]
        
        print(string.format("%d. %-50s %s", stepNum, stepName, status))
        --[["%d." - placeholder for the index number (stepNum) will print: "<#>."
            "%-50s" - place holder for a string (stepName), left-aligned (-), padded to 50 characters (50s)
            "%s" - place holder for a normal string (no formatting) (status)
            "stepNum", "stepName", and "status" will slot into the placeholders in order.
            prints: "#. Step description                               [✔]"
            ]]
    end
    if questTable.completed == true then -->Checks if completed(in the quest table) is "true"...
        print("Quest Complete!") --> ...prints message if "true"
    end
    print(string.rep("-", 40))--> prints divider line
end

local function questProgress(questTable)
    for stepNum, step_is in ipairs(questTable) do 
        if step_is ~= true then --> checks if step description *has NOT* been changed to "true" by questProgress...
            local stepName = step_is --> saves original step name(step_is) as "stepName"
            table.insert(questTable.stepsDone, stepName) 
            --[[stores "stepName" (original step description) in "stepsDone" in the quest table
            showQuest will use "stepsDone" to print out the full step description once questProgress has 
            changed the original value of the step to "true".]]
            print(step_is .. "[Completed!]") --> prints "<step description> Completed!""
            questTable[stepNum] = true --> changes step description to "true"
            --[[ When this runs, it changes the first value on the array (where the steps are listed)
            to "true". Each time it runs after that, it looks for the first value that isn't "true", and
            does it's thing to it.]]
            
                if stepNum == #questTable then
                    questTable.completed = true
                    print("Quest complete: " .. questTable.title)
                    showQuest(questTable)
                    questRewards(questTable)
                end
                --[[checks if the current step number being acted on is the last step in the quest,
                if it is; prints "Quest Complete: <quest title>", then runs showQuest() to display the entire
                quest info with all steps marked as "[✔]". Then, runs questRewards() to display the quest rewards.]]
                return
            end
        end
end
print("[To Pylea - No steps completed]")
showQuest(over_the_rainbow)


print("\n[To Pylea - Progress - First step]")
questProgress(over_the_rainbow)

print("\n[To Pylea - First Step completed]")
showQuest(over_the_rainbow)


print("\n[To Pylea - Progress - Second step]")
questProgress(over_the_rainbow)

print("\n[To Pylea - Second Step completed]")
showQuest(over_the_rainbow)


print("\n[To Pylea - Progress - Third step]")
questProgress(over_the_rainbow)

