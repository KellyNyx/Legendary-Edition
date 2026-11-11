--Low Health--

table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Bastard!
				{ Cue = "/VO/MegaeraField_0090", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- You bastard!
				{ Cue = "/VO/MegaeraField_0091", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- How dare you!
				{ Cue = "/VO/MegaeraField_0094", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- You dare?
				{ Cue = "/VO/MegaeraField_0095", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Why, you!
				{ Cue = "/VO/MegaeraField_0096", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- That hurt.
				{ Cue = "/VO/MegaeraField_0097", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Ungh, you!
				{ Cue = "/VO/MegaeraField_0264", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Am I supposed to be impressed?
				{ Cue = "/VO/MegaeraField_0635", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Pfah!
				{ Cue = "/VO/MegaeraField_0265", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Tsch, heh.
				{ Cue = "/VO/MegaeraField_0267", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Augh, hahaha.
				{ Cue = "/VO/MegaeraField_0626", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Really.
				{ Cue = "/VO/MegaeraField_0629", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Not yet.
				{ Cue = "/VO/MegaeraField_0632", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Ungh, heh.
				{ Cue = "/VO/MegaeraField_0633", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Mm.
				{ Cue = "/VO/MegaeraField_0768", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Damn...
				{ Cue = "/VO/MegaeraField_0771", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Damn it!
			{ Cue = "/VO/MegaeraField_0098", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Damn you!
			{ Cue = "/VO/MegaeraField_0099", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Curse you!
			{ Cue = "/VO/MegaeraField_0100", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Blood and darkness!
			{ Cue = "/VO/MegaeraField_0101", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Urgh no.
			{ Cue = "/VO/MegaeraField_0262", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Gah, hrngh!
			{ Cue = "/VO/MegaeraField_0266", RequiredTrait = "EPCMegaeraTrait"})
table.insert(HeroData.DefaultHero.LowHealthVoiceLines, -- Augh damn it!
			{ Cue = "/VO/MegaeraField_0263", RequiredTrait = "EPCMegaeraTrait"})

--Cannot fight--
table.insert(HeroVoiceLines.CannotFightVoiceLines,{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.35,
			--ObjectType = "Harpy",
			RequiredTrait = "EPCMegaeraTrait",
			--SuccessiveChanceToPlay = 0.5,
            Source = { SubtitleColor = Color.MegVoice },
			CooldownTime = 5,

			-- That's not going to work.
			{ Cue = "/VO/MegaeraField_0517", RequiredTrait = "EPCMegaeraTrait" },
			-- I don't think so.
			{ Cue = "/VO/MegaeraField_0518", RequiredTrait = "EPCMegaeraTrait" },
			-- Not a chance.
			{ Cue = "/VO/MegaeraField_0523", RequiredTrait = "EPCMegaeraTrait" },
			-- Really?
			{ Cue = "/VO/MegaeraField_0524", RequiredTrait = "EPCMegaeraTrait" },
		})
-- table.insert(HeroVoiceLines.CannotFightVoiceLines[1], -- I don't think so.
-- 			{ Cue = "/VO/MegaeraField_0518", RequiredTrait = "EPCMegaeraTrait" })
-- table.insert(HeroVoiceLines.CannotFightVoiceLines[1], -- Not a chance.
-- 			{ Cue = "/VO/MegaeraField_0523", RequiredTrait = "EPCMegaeraTrait" })
-- table.insert(HeroVoiceLines.CannotFightVoiceLines[1], -- Really?
-- 			{ Cue = "/VO/MegaeraField_0524", RequiredTrait = "EPCMegaeraTrait" })

