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
            Queue = "Interrupt",
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

--Use Fountain--

table.insert(GlobalVoiceLines.UsedFountainVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		--SuccessiveChanceToPlay = 0.66,
        Queue = "Interrupt",
        RequiredTrait = "EPCMegaeraTrait",
        Source = { SubtitleColor = Color.MegVoice },
		--RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },

		-- That's it.
		{ Cue = "/VO/MegaeraField_0290" },
		-- All right.
		{ Cue = "/VO/MegaeraField_0291" },
		-- Not bad.
		{ Cue = "/VO/MegaeraField_0628", },
	})

--Use fountain while health full--
table.insert(GlobalVoiceLines.UsedFountainVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		RequiredMinHealthFraction = 1.0,
		--SuccessiveChanceToPlay = 0.66,
        RequiredTrait = "EPCMegaeraTrait",
        Source = { SubtitleColor = Color.MegVoice },
		--RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },

		-- That's it.
		{ Cue = "/VO/MegaeraField_0290" },
		-- All right.
		{ Cue = "/VO/MegaeraField_0291" },
		-- Not bad.
		{ Cue = "/VO/MegaeraField_0628", },
	})

--Combat begins--
table.insert(GlobalVoiceLines.CombatBeginsVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		--SuccessiveChanceToPlay = 0.66,
        Queue = "Interrupt",
        CooldownTime = 250,
        RequiredTrait = "EPCMegaeraTrait",
        Source = { SubtitleColor = Color.MegVoice },
		RequiredFalseRooms = { "RoomOpening", "D_Boss01" },
		RequiredEncounterActiveEnemyCapMin = 2,
        RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "BossHarpy1", "BossHarpy2", "BossHarpy3", "BossHydra", "MiniBossMinotaur", "BossTheseusAndMinotaur", "BossHades", "BossCharon", "EnemyIntroFight01", "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro", "ThiefMineLayerIntro", "HeavyRangedIntro", "PunchingBagIntro", "LightSpawnerIntro", "DisembodiedHandIntro", "SpreadShotIntro", "ShieldRangedIntro", "CrusherIntro", "FreezeShotIntro", "RangedBurrowerIntro", "BerserkerIntro", "WaveFistIntro", "PitcherIntro", "SelfDestructIntro", "ShadeSwordUnitIntro", "ShadeSpearUnitIntro", "ShadeShieldUnitIntro",	"ShadeBowUnitIntro", "FlurrySpawnerUnitIntro", "ChariotIntro", "ChariotSuicideIntro"
		 },

		-- Am I interrupting something?
		{ Cue = "/VO/MegaeraField_0492" },
		-- Hold it right there.
		{ Cue = "/VO/MegaeraField_0084" },
		-- I'll make this quick.
		{ Cue = "/VO/MegaeraField_0085" },
		-- Beg me for mercy, fool.
		{ Cue = "/VO/MegaeraField_0086" },
		-- You want a taste of this?
		{ Cue = "/VO/MegaeraField_0087" },
        -- Come closer.
		{ Cue = "/VO/MegaeraField_0256" },
		-- Don't go anywhere.
		{ Cue = "/VO/MegaeraField_0257" },
        -- I'll make you hurt.
		{ Cue = "/VO/MegaeraField_0261" },
        -- Here's my whip!
		{ Cue = "/VO/MegaeraField_0260" },
        -- This won't hurt much.
		{ Cue = "/VO/MegaeraField_0624" },
		-- This will sting.
		{ Cue = "/VO/MegaeraField_0625" },
	})

--Combat resolved--
table.insert(GlobalVoiceLines.CombatResolvedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
        PlayOnceThisRun = true,
		PreLineWait = 0.65,
		--SuccessiveChanceToPlay = 0.66,
        Queue = "Interrupt",
        CooldownTime = 250,
        RequiredTrait = "EPCMegaeraTrait",
        RequiredFalseRooms = { "RoomOpening", "D_Boss01" },
		RequiredEncounterActiveEnemyCapMin = 2,
		ThreadName = "RoomThread",
        Source = { SubtitleColor = Color.MegVoice },
		--RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },

		-- That's it?
				{ Cue = "/VO/MegaeraField_0639", },
				-- Is that all?
				{ Cue = "/VO/MegaeraField_0640", },
                -- What else did you expect?
				{ Cue = "/VO/MegaeraField_0663" },
                -- You should have known better.
				{ Cue = "/VO/MegaeraField_0129" },
				-- I think we're finished here.
				{ Cue = "/VO/MegaeraField_0133" },
                -- It's all part of the job.
				{ Cue = "/VO/MegaeraField_0662" },
                -- That's what you get.
				{ Cue = "/VO/MegaeraField_0124" },
				-- Hah! Idiot.
				{ Cue = "/VO/MegaeraField_0125" },
                -- To hell with you.
				{ Cue = "/VO/MegaeraField_0130" },
                -- Do not come back.
				{ Cue = "/VO/MegaeraField_0299" },
                -- Drown in the River Styx.
				{ Cue = "/VO/MegaeraField_0303" },
				-- We're through.
				{ Cue = "/VO/MegaeraField_0304" },
				-- We're finished here.
				{ Cue = "/VO/MegaeraField_0305" },
	})

