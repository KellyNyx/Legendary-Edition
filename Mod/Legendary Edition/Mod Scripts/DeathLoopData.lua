GlobalVoiceLines.DeathVoiceLines =
{
	Queue = "Interrupt",
	RequiredFalseRooms = { "E_Story_01" },
	-- Augh damn it!
	{ Cue = "/VO/MegaeraField_0263", RequiredCompletedRuns = 0, BreakIfPlayed = true, SkipAnim = true },
	{
		{
			RandomRemaining = true,
			-- BreakIfPlayed = true,
			-- PreLineWait = 0.25,
			SkipAnim = true,
			RequiredFalseRooms = { "E_Story_01" },

					-- No...!
					{ Cue = "/VO/MegaeraField_0149", PreLineWait = 0.3 },
					-- No!
					{ Cue = "/VO/MegaeraField_0150", PreLineWait = 0.3 },
					-- How...!
					{ Cue = "/VO/MegaeraField_0151", PreLineWait = 0.3 },
					-- How...?!
					{ Cue = "/VO/MegaeraField_0152", PreLineWait = 0.3 },
					-- What...?!
					{ Cue = "/VO/MegaeraField_0153", PreLineWait = 0.3 },
					-- Impossible!
					{ Cue = "/VO/MegaeraField_0154", },
					-- I can't--!
					{ Cue = "/VO/MegaeraField_0155", PreLineWait = 0.6 },
					-- Again?!
					{ Cue = "/VO/MegaeraField_0156", },
					-- Not again?!
					{ Cue = "/VO/MegaeraField_0157", },
					-- Ungh, damn...
					{ Cue = "/VO/MegaeraField_0316", PreLineWait = 0.3 },
					-- Damn you...
					{ Cue = "/VO/MegaeraField_0317", },
					-- Ngh, blood and--
					{ Cue = "/VO/MegaeraField_0318", },
					-- Lord Hades, I...
					{ Cue = "/VO/MegaeraField_0319", },
					-- Sisters...
					{ Cue = "/VO/MegaeraField_0320", },
					-- Why, you...
					{ Cue = "/VO/MegaeraField_0321", },
					-- This is...
					{ Cue = "/VO/MegaeraField_0322", },
					-- How could I--!
					{ Cue = "/VO/MegaeraField_0323", },
					-- Absurd...
					{ Cue = "/VO/MegaeraField_0324", },
					-- Why...
					{ Cue = "/VO/MegaeraField_0325", },
		},
	},
}
