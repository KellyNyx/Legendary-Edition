DeathLoopData =
{
	DeathArea =
	{
		ZoomFraction = 0.75,
		ZoomLerpTime = 4.0,
		CameraZoomWeights =
		{
			[40001] = 1.0,
			[210380] = 1.2,
			[50002] = 1.3,
			[555424] = 1.0,
		},
		SoftClamp = 0.75,
		CameraClamps = { 422050, 422043, 422045, 422046, 422047, 422048, 422049 },
		FullscreenEffectGroup = "LoungeHider_01",
		RichPresence = "#RichPresence_House",

		BinkSet = "NPCs",
		Binks =
		{
			"NPC_3DGhostAltFidget_Bink",
			"NPC_3DGhostAltIdle_Bink",
			"GhostChefChopOnion_Bink",
			"GhostChefChopOnion2_Bink",
			"ZagreusPetting_Bink",
		},

		ShowResourceUIOnly = true,

		IgnoreStemMixer = true,
		AmbientMusicParams =
		{
			LowPass = 0.0,
			Vocals = 1.0,
		},
		AmbientMusicVolume = 1.0,
		Ambience = "/Ambience/MusicExploration4Ambience",
		RemoveDashFireFx = true,
		SkipWeaponBinkPreLoading = true,

		FailedToFireFunctionName = "DeathAreaAttackFailPresentation",

		DistanceTriggers =
		{
			-- Hidden Inspect Point
			{
				TriggerObjectType = "InspectPoint", WithinDistance = 300, AlphaObjectIn = "Self", Repeat = true, RemoveNotifiedIds = true,
			},
			-- Lounge Closed
			{
				TriggerGroup = "LoungeReveal_01", WithinDistance = 6000, DeleteGroup = "LoungeReveal_01",
				RequiredMinCompletedRuns = 4,
				RequiredFalseFlags = { "InFlashback", },
			},
			-- Lounge Open VO
			{
				TriggerObjectType = "HouseTableRound01", WithinDistance = 425,
				RequiredMinCompletedRuns = 4,
				RequiredFalseFlags = { "InFlashback", },
				VoiceLines =
				{
					-- Hey the lounge is open.
					PreLineWait = 0.1,
					{ Cue = "/VO/ZagreusHome_0457", PlayOnce = true },
				},
			},
			{
				TriggerObjectType = "HouseTableRound01",
				RequiredFalseFlags = { "InFlashback", },
				RequiredFalseTextLinesThisRun = { "NyxAboutDusa03" },
				WithinDistance = 600,
				VoiceLines =
				{
					RandomRemaining = true,
					PreLineWait = 0.1,
					SuccessiveChanceToPlay = 0.1,
					RequiredHasFish = true,
					UsePlayerSource = true,

					-- Should visit the Head Chef.
					{ Cue = "/VO/ZagreusHome_1801", RequiredPlayed = { "/VO/ZagreusHome_1804" }, },
					-- The Head Chef always wants fish.
					{ Cue = "/VO/ZagreusHome_1802", RequiredPlayed = { "/VO/ZagreusHome_1804" }, },
					-- Fish delivery for the Head Chef.
					{ Cue = "/VO/ZagreusHome_1803", RequiredPlayed = { "/VO/ZagreusHome_1804" }, },
					-- The Head Chef is going to want this fish.
					{ Cue = "/VO/ZagreusHome_1804" },
				},
			},
			-- Top Hall Dim
			{
				TriggerGroup = "TopHallUnDim", WithinDistance = 300, FunctionName = "UnDimTopHall", Repeat = true,
			},
			{
				TriggerGroup = "TopHallDim", WithinDistance = 300, FunctionName = "DimTopHall", Repeat = true,
			},
			-- LoungeDim
			{
				TriggerGroup = "LoungeUnDim", WithinDistance = 400, FunctionName = "UnDimLounge", Repeat = true,
				RequiredMinCompletedRuns = 4,
			},
			{
				TriggerGroup = "LoungeDim", WithinDistance = 450, FunctionName = "DimLounge", Repeat = true,
				RequiredMinCompletedRuns = 4,
			},
			-- Lounge Shortcut Dim
			{
				TriggerGroup = "LoungeShortcutUnDim", WithinDistance = 200, FunctionName = "UnDimLounge", Repeat = true,
				RequiredCosmetics = { "Cosmetic_LoungeShortcut" },
			},
			{
				TriggerGroup = "LoungeShortcutDim", WithinDistance = 200, FunctionName = "DimLounge", Repeat = true,
				RequiredCosmetics = { "Cosmetic_LoungeShortcut" },
			},

			-- Ghosts
			{
				TriggerGroup = "Ghost3D", WithinDistance = 900, FunctionName = "GhostExpressiveEmote", Repeat = true,
			},
			-- Hades
			{
				TriggerObjectType = "NPC_Hades_01", WithinDistance = 1500, ScaleY = 0.75, RequiredCompletedRuns = 0, LockToCharacter = true,
				TriggerOnceThisRun = true, SetFlagTrue = "MetHades",
				-- Stinger = "/Music/HadesTheme",
				Stinger = "/Leftovers/World Sounds/MapZoomInShortHigh",
				RequiresFalseHadesProcession = true,
				VoiceLines =
				{
					-- Back already?
					{ Cue = "/VO/Hades_0087", PreLineWait = 0.65, RequiredCompletedRuns = 0, PlayOnceThisRun = true, },
				},
			},
			{
				TriggerObjectType = "NPC_Hades_01", WithinDistance = 1300, ScaleY = 0.5, RequiredMinCompletedRuns = 1,
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					{
						PlayOnce = true,
						IsIdAlive = 427173,
						PreLineWait = 0.35,
						TriggerOnceThisRun = true,
						UsePlayerSource = true,
						TriggerCooldowns = { "HouseNPCAnySpeech", },
						RequiredScreenViewedFalse = "GhostAdmin",
						UsePlayerSource = true,
						Cooldowns =
						{
							{ Name = "ZagreusMiscHouseSpeech", Time = 20 },
						},
						-- note: second line here is for Early Access players.

						-- Who's that new shade there next to Father?
						-- { Cue = "/VO/ZagreusHome_1061", RequiredFalsePlayed = { "/VO/ZagreusHome_1062" }, RequiredFalseTextLines = { "HadesAboutGhostAdmin01" } },
						-- Someone's at the desk next to the throne...
						{ Cue = "/VO/ZagreusHome_1524", RequiredFalsePlayed = { "/VO/ZagreusHome_1062" }, RequiredFalseTextLines = { "HadesAboutGhostAdmin01" } },
						-- Something's different about that shade next to Father.
						{ Cue = "/VO/ZagreusHome_1062", RequiredFalsePlayed = { "/VO/ZagreusHome_1524" }, RequiredMinCompletedRuns = 3 },
					},
				}
			},
			-- Persephone
			{
				TriggerObjectType = "NPC_Persephone_Home_01", WithinDistance = 1100, ScaleY = 0.5, RequiredQueuedTextLines = "OlympianReunionQuestComplete",
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					{
						UsePlayerSource = "true",

						-- Mother!
						{ Cue = "/VO/ZagreusField_3605" },
					},
					{
						BreakIfPlayed = true,
						PreLineWait = 0.2,
						ObjectType = "NPC_Persephone_Home_01",

						-- Zagreus!
						{ Cue = "/VO/Persephone_0300" },
					}
				},
			},
			-- GhostAdmin Hints: Early Game (Later On version below)
			{
				TriggerObjectType = "NPC_Hades_01", WithinDistance = 1200, ScaleY = 0.5,
				RequiredMinCompletedRuns = 2,
				RequiredMaxCompletedRuns = 8,
				RequiredResourcesMin = { Gems = 30 },
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					[1] = GlobalVoiceLines.GhostAdminUseHintVoiceLines,
				},
			},
			-- GhostAdmin Hints: Later On
			{
				TriggerObjectType = "NPC_Hades_01", WithinDistance = 1200, ScaleY = 0.5,
				RequiredMinCompletedRuns = 9,
				RequiredMaxCompletedRuns = 25,
				RequiredResourcesMin = { SuperGems = 3 },
				RequiredFalseCosmetics = { "RoomRewardMetaPointDropRunProgress", "ChallengeSwitches3" },
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					[1] = GlobalVoiceLines.GhostAdminUseHintVoiceLines,
				},
			},
			{
				TriggerObjectType = "NPC_Hades_01", WithinDistance = 1100, ScaleY = 0.5, RequiredMinCompletedRuns = 1, RequiredFalseQueuedTextLines = { "HadesPostEnding01", "OlympianReunionQuestComplete" },
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					TriggerCooldowns = { "ZagreusAnyQuipSpeech" },
					{
						RequiredTextLinesThisRun = "PersephoneFirstMeeting",
						BreakIfPlayed = true,
						RequiresRunCleared = true,
						PreLineWait = 0.35,
						RequiresFalseHadesProcession = true,
						Cooldowns =
						{
							{ Name = "HouseNPCAnySpeech", Time = 10 },
						},

						-- He's finally returned.
						{ Cue = "/VO/Hades_0218" },
					},
					{
						RequiredTextLinesThisRun = "PersephoneMeeting02",
						BreakIfPlayed = true,
						RequiresRunCleared = true,
						PreLineWait = 0.35,
						RequiresFalseHadesProcession = true,
						Cooldowns =
						{
							{ Name = "HouseNPCAnySpeech", Time = 10 },
						},

						-- Urgh, how could he... you.
						{ Cue = "/VO/Hades_0440" },
					},
					{
						RandomRemaining = true,
						BreakIfPlayed = true,
						RequiresRunCleared = true,
						PreLineWait = 0.35,
						RequiresFalseHadesProcession = true,
						RequiresNullAmbientMusicId = true,
						RequiredFalsePrevRooms = { "DeathAreaBedroom", "DeathAreaOffice", "DeathAreaBedroomHades" },
						Cooldowns =
						{
							{ Name = "HouseNPCAnySpeech", Time = 10 },
						},

						-- You'll go no further, boy; at least, not yet.
						-- { Cue = "/VO/Hades_0360", RequiredPlayed = { "/VO/Hades_0433" } },
						-- Alas for ongoing Underworld renovations.
						-- { Cue = "/VO/Hades_0435", RequiredPlayed = { "/VO/Hades_0433" } },
						-- Everything is as it always was.
						{ Cue = "/VO/Hades_0433" },
						-- He's finally returned.
						{ Cue = "/VO/Hades_0218", RequiredPlayed = { "/VO/Hades_0433" }, RequiredMinRunsCleared = 10 },
						-- Don't you see, boy? You are trapped.
						{ Cue = "/VO/Hades_0406", RequiredPlayed = { "/VO/Hades_0433" }, RequiredFalseTextLines = { "Ending01" }, },
						-- I didn't think you had it in you, boy.
						{ Cue = "/VO/Hades_0408", RequiredPlayed = { "/VO/Hades_0433" } },
						-- Hmph! I was looking all over for you.
						{ Cue = "/VO/Hades_0432", RequiredPlayed = { "/VO/Hades_0433" } },
						-- I just got back shortly before you did!
						{ Cue = "/VO/Hades_0436", RequiredPlayed = { "/VO/Hades_0433" } },
						-- Resolved the trouble with the Satyrs yet?
						{ Cue = "/VO/Hades_0437", RequiredPlayed = { "/VO/Hades_0433" } },
						-- You're bound to my domain, boy.
						{ Cue = "/VO/Hades_0438", RequiredPlayed = { "/VO/Hades_0433" }, RequiredFalseTextLines = { "Ending01" }, },
						-- So very tired...
						{ Cue = "/VO/Hades_0439", RequiredPlayed = { "/VO/Hades_0433" }, RequiredFalseTextLines = { "Ending01" }, },
						-- Urgh, how could he... you.
						{ Cue = "/VO/Hades_0440", RequiredPlayed = { "/VO/Hades_0433" }, RequiredFalseTextLines = { "Ending01" }, RequiredFalseTextLinesLastRun = { "PersephoneFirstMeeting" }, },
						-- Congratulations...!
						{ Cue = "/VO/Hades_0216", RequiredPlayed = { "/VO/Hades_0433" }, RequiredTextLines = { "Ending01" }, },
						-- Congratulations, boy.
						{ Cue = "/VO/Hades_0217", RequiredPlayed = { "/VO/Hades_0433" }, RequiredTextLines = { "Ending01" }, },
						-- Welcome home, boy!
						{ Cue = "/VO/Hades_0219", RequiredPlayed = { "/VO/Hades_0433" }, RequiredTextLines = { "Ending01" }, },
						-- Everyone, look who it is!
						{ Cue = "/VO/Hades_0358", RequiredPlayed = { "/VO/Hades_0433" }, RequiredTextLines = { "Ending01" }, },
						-- He did it again, Cerberus!
						{ Cue = "/VO/Hades_0357", IsIdAlive = 370007, RequiredPlayed = { "/VO/Hades_0359", "/VO/Hades_0433" } },
						-- He's done it, Cerberus!
						{ Cue = "/VO/Hades_0359", IsIdAlive = 370007, RequiredPlayed = { "/VO/Hades_0433" } },						
						-- Hrm.
						{ Cue = "/VO/Hades_1101", RequiredTextLines = { "Ending01" }, },
						-- Zagreus.
						{ Cue = "/VO/Hades_1102", RequiredTextLines = { "Ending01" }, },
						-- Our work is never done...
						{ Cue = "/VO/Hades_1103", RequiredTextLines = { "Ending01" }, },
						-- More to be done.
						{ Cue = "/VO/Hades_1104", RequiredTextLines = { "Ending01" }, },
						-- Thought I had you, there.
						{ Cue = "/VO/Hades_1105", RequiredTextLines = { "Ending01" }, },
						-- Boy.
						{ Cue = "/VO/Hades_1106", RequiredTextLines = { "Ending01" }, },
						-- Boy, erm. Zagreus.
						{ Cue = "/VO/Hades_1107", RequiredPlayed = { "/VO/Hades_1106" }, RequiredTextLines = { "Ending01" }, },
						-- There you are.
						{ Cue = "/VO/Hades_1108", RequiredTextLines = { "Ending01" }, },
						-- Returned, have you?
						{ Cue = "/VO/Hades_1109", RequiredTextLines = { "Ending01" }, },
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						PreLineWait = 0.35,
						RequiresFalseHadesProcession = true,
						RequiresNullAmbientMusicId = true,
						RequiredFalsePrevRooms = { "DeathAreaBedroom", "DeathAreaOffice", "DeathAreaBedroomHades" },
						Cooldowns =
						{
							{ Name = "HouseNPCAnySpeech", Time = 10 },
						},

						-- <Laughter>
						{ Cue = "/VO/Hades_0072", PreLineAnim = "Hades_HouseWryLaughToGlaringToWriting", RequiredFalseTextLines = { "Ending01" }, PreLineThreadedFunctionName = "HadesLaughDisable" },
						-- <Laughter>
						-- { Cue = "/VO/Hades_0073" },
						-- <Laughter>
						{ Cue = "/VO/Hades_0074", PreLineAnim = "Hades_HouseWryLaughToGlaringToWriting", PreLineThreadedFunctionName = "HadesLaughDisable" },
						-- <Laughter>
						{ Cue = "/VO/Hades_0075", PreLineAnim = "Hades_HouseWryLaughToGlaringToWriting", PreLineThreadedFunctionName = "HadesLaughDisable" },
						-- <Laughter>
						{ Cue = "/VO/Hades_0076", PreLineAnim = "Hades_HouseWryLaughToGlaringToWriting", PreLineThreadedFunctionName = "HadesLaughDisable" },
						-- <Sigh>
						{ Cue = "/VO/Hades_0077" },
						-- <Groan>
						{ Cue = "/VO/Hades_0078" },
						-- <Scoffing>
						{ Cue = "/VO/Hades_0079" },
						-- Unnngghhh...
						{ Cue = "/VO/Hades_0080" },
						-- Urrnnggghhh....
						{ Cue = "/VO/Hades_0081" },
						-- Back again, hm?
						{ Cue = "/VO/Hades_0082" },
						-- <Tsk, tsk, tsk, tsk> Too bad, boy.
						{ Cue = "/VO/Hades_0083" },
						-- Hrrnn?
						{ Cue = "/VO/Hades_0084" },
						-- Euugghh...
						{ Cue = "/VO/Hades_0085" },
						-- Back already?
						{ Cue = "/VO/Hades_0087", RequiredFalseSeenRoomThisRun = "C_Intro" },
						-- Ahem.
						{ Cue = "/VO/Hades_0108" },
						-- Ahem?
						{ Cue = "/VO/Hades_0109" },
						-- Forget something again?
						{ Cue = "/VO/Hades_0110", RequiredFalseSeenRoomThisRun = "C_Intro" },
						-- Such a shame.
						{ Cue = "/VO/Hades_0111" },
						-- For shame.
						{ Cue = "/VO/Hades_0112" },
						-- Disgraceful.
						{ Cue = "/VO/Hades_0113", RequiredFalseTextLines = { "Ending01" }, },
						-- Had enough yet?
						{ Cue = "/VO/Hades_0114" },
						-- Ah, tough luck.
						{ Cue = "/VO/Hades_0115" },
						-- Didn't hear you come in.
						{ Cue = "/VO/Hades_0116" },
						-- Psh.
						{ Cue = "/VO/Hades_0117", RequiredFalseTextLines = { "Ending01" }, },
						-- You.
						{ Cue = "/VO/Hades_0118", RequiredFalseTextLines = { "Ending01" }, },
						-- You again.
						{ Cue = "/VO/Hades_0119", RequiredFalseTextLines = { "Ending01" }, },
						-- Pardon the interruption, everyone.
						{ Cue = "/VO/Hades_0120" },
						-- You never learn.
						{ Cue = "/VO/Hades_0121", RequiredFalseTextLines = { "Ending01" }, },
						-- Look who's back.
						{ Cue = "/VO/Hades_0122" },
						-- Oh it's only you.
						{ Cue = "/VO/Hades_0123", RequiredFalseTextLines = { "HadesGift04" }, },
						-- Grown any wiser yet?
						{ Cue = "/VO/Hades_0434", RequiredFalseTextLines = { "Ending01" }, },
						-- Well, well, well.
						{ Cue = "/VO/Hades_0431" },
						-- Pathetic.
						{ Cue = "/VO/Hades_0050", RequiredFalseSeenRoomThisRun = "C_Boss01", RequiredFalseTextLines = { "Ending01" }, },
						-- Useless.
						{ Cue = "/VO/Hades_0051", RequiredFalseTextLines = { "Ending01" }, },
						-- To suffer such indignity, from my own kin.
						{ Cue = "/VO/Hades_0058", RequiredFalseTextLines = { "Ending01" }, },
						-- A pitiful attempt.
						{ Cue = "/VO/Hades_0059", RequiredFalseSeenRoomThisRun = "C_Boss01", RequiredFalseTextLines = { "Ending01" }, },
						-- Elysium is up in arms again because of you.
						{ Cue = "/VO/Hades_0407", RequiredBiome = "Elysium", },
						-- Fought all the way out of Elysium, only to end up here.
						{ Cue = "/VO/Hades_0405", RequiredBiome = "Styx", },
						-- The Hydra shall grow back, boy.
						{ Cue = "/VO/Hades_0356", RequiredAnyRoomsThisRun = { "B_Boss01", "B_Boss02" }, RequiredFalseSeenRoomThisRun = "C_Boss01" },
					},
				},
			},
			-- Behind Hades
			{
				TriggerGroup = "BehindHadesPoints",
				WithinDistance = 150,
				RequiredFalseFlags = { "InFlashback", },
				RequiredFalseQueuedTextLines = GameData.HadesGardenTextLines,
				RequiredFalseTextLinesThisRun = { "HadesAboutOlympianReunionQuest01A" },
				VoiceLines =
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					CooldownTime = 200,
					ObjectType = "NPC_Hades_01",
					RequiresFalseHadesProcession = true,
					SuccessiveChanceToPlay = 0.75,

					-- Get away from back there.
					{ Cue = "/VO/Hades_0487" },
					-- Go about your business.
					{ Cue = "/VO/Hades_0488" },
					-- You are irritating me, boy.
					{ Cue = "/VO/Hades_0489" },
					-- Get where I can see you.
					{ Cue = "/VO/Hades_0490" },
					-- Back away from there.
					{ Cue = "/VO/Hades_0491" },
					-- Stop being a fool.
					{ Cue = "/VO/Hades_0492", RequiredFalseTextLines = { "Ending01" }, },
					-- Don't you have someplace else to be?
					{ Cue = "/VO/Hades_0493" },
					-- Begone from there.
					{ Cue = "/VO/Hades_0494" },
					-- Cease this, boy.
					{ Cue = "/VO/Hades_0495" },
					-- Have you no better way to pass the time?
					{ Cue = "/VO/Hades_0496" },
				},
			},
			-- Cerberus
			{
				TriggerObjectType = "NPC_Cerberus_01", WithinDistance = 500,
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					-- whine
					-- { Cue = "/VO/CerberusWhineHappy" },
				},
			},
			-- Nyx
			{
				TriggerObjectType = "NPC_Nyx_01", WithinDistance = 500,
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "NyxGrantsRespec",
						SuccessiveChanceToPlay = 0.33,
						PreLineAnim = "NyxIdleGreeting",

						-- Here.
						{ Cue = "/VO/Nyx_0226" },
					},
					{
						BreakIfPlayed = true,
						RequiredAnyQueuedTextLines = { "NyxAboutPersephoneMeeting01", "NyxAboutPersephoneMeeting01B" },
						SuccessiveChanceToPlay = 0.33,
						PreLineAnim = "NyxIdleGreeting",

						-- Child?
						{ Cue = "/VO/Nyx_0227" },
					},
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "NyxAboutPersephoneMeeting03",
						SuccessiveChanceToPlay = 0.33,
						PreLineAnim = "NyxIdleGreeting",

						-- A word.
						{ Cue = "/VO/Nyx_0221" },
					},
					{
						SuccessiveChanceToPlay = 0.33,
						BreakIfPlayed = true,
						RequiresRunCleared = true,
						RequiredQueuedTextLines = "NyxAboutPersephoneMeeting05",
						RequiredFalseTextLines = { "Ending01" },
						PreLineAnim = "NyxIdleGreeting",

						-- Did you find her?
						{ Cue = "/VO/Nyx_0217" },
					},
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "NyxAboutPersephoneMeeting06",
						SuccessiveChanceToPlay = 0.33,
						PreLineAnim = "NyxIdleGreeting",

						-- Wait...
						{ Cue = "/VO/Nyx_0293" },
					},
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "NyxAboutPersephoneMeeting07",
						SuccessiveChanceToPlay = 0.33,
						PreLineAnim = "NyxIdleGreeting",

						-- Zagreus?
						{ Cue = "/VO/Nyx_0412" },
					},
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "NyxRevealsArthurAspect01",
						SuccessiveChanceToPlay = 0.33,
						PreLineAnim = "NyxIdleGreeting",

						-- A moment.
						{ Cue = "/VO/Nyx_0225" },
					},
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "NyxAboutChaos05",
						SuccessiveChanceToPlay = 0.33,
						PreLineAnim = "NyxIdleGreeting",

						-- A word, child?
						{ Cue = "/VO/Nyx_0222" },
					},
					{
						BreakIfPlayed = true,
						RequiredTextLinesThisRun = "Ending01",
						PreLineAnim = "NyxIdleGreeting",

						-- Ah.
						{ Cue = "/VO/Nyx_0212" },
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						SuccessiveChanceToPlay = 0.33,
						RequiresRunCleared = true,
						RequiredTextLines = { "PersephoneFirstMeeting" },
						RequiredFalseTextLinesThisRun = { "PersephoneFirstMeeting" },
						PreLineAnim = "NyxIdleGreeting",
						RequiresNullSecretMusicId = true,
						RequiresNullAmbientMusicId = true,
						RequiredFalsePrevRooms = { "DeathAreaBedroom", "DeathAreaOffice", "DeathAreaBedroomHades" },

						-- You have done well.
						{ Cue = "/VO/Nyx_0215", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- You broke free.
						{ Cue = "/VO/Nyx_0216", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- You reached the surface...
						{ Cue = "/VO/Nyx_0217" },
						-- Well done.
						{ Cue = "/VO/Nyx_0219", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- At last.
						{ Cue = "/VO/Nyx_0220", RequiredPlayed = { "/VO/Nyx_0217" }, },
						-- I never doubted you.
						{ Cue = "/VO/Nyx_0283", RequiredPlayed = { "/VO/Nyx_0217" }, },
						-- Excellently done.
						{ Cue = "/VO/Nyx_0285", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, RequiredTextLines = { "Ending01" }, },
						-- I knew that you were more than capable.
						{ Cue = "/VO/Nyx_0282", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- I had envisioned that you would succeed.
						{ Cue = "/VO/Nyx_0284", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, RequiredFalseTextLinesThisRun = { "Ending01" }, },
						-- Skillfully executed work.
						{ Cue = "/VO/Nyx_0286", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- Well done, child.
						{ Cue = "/VO/Nyx_0474", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- A commendable result.
						{ Cue = "/VO/Nyx_0475", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- You have done well.
						{ Cue = "/VO/Nyx_0476", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- Excellent work.
						{ Cue = "/VO/Nyx_0477", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- To your continued success.
						{ Cue = "/VO/Nyx_0478", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						SuccessiveChanceToPlay = 0.25,
						PreLineAnim = "NyxIdleGreeting",
						RequiresNullSecretMusicId = true,
						RequiresNullAmbientMusicId = true,
						RequiredFalsePrevRooms = { "DeathAreaBedroom", "DeathAreaOffice", "DeathAreaBedroomHades" },

						-- You have come home.
						{ Cue = "/VO/Nyx_0054" },
						-- Hmm.
						{ Cue = "/VO/Nyx_0052", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- You are home.
						{ Cue = "/VO/Nyx_0055", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- Child.
						{ Cue = "/VO/Nyx_0204", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- My child.
						{ Cue = "/VO/Nyx_0205", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- You have returned.
						{ Cue = "/VO/Nyx_0206", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- You are returned.
						{ Cue = "/VO/Nyx_0207", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- It is you.
						{ Cue = "/VO/Nyx_0208", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- You are back.
						{ Cue = "/VO/Nyx_0209", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- You are here.
						{ Cue = "/VO/Nyx_0210", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- A setback, then.
						{ Cue = "/VO/Nyx_0211", RequiredPlayed = { "/VO/Nyx_0054" }, RequiresRunNotCleared = true, },
						-- Ah.
						{ Cue = "/VO/Nyx_0212", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- Be unseen.
						{ Cue = "/VO/Nyx_0213", RequiredPlayed = { "/VO/Nyx_0054" }, RequiredTextLines = { "NyxGift09" } },
						-- There you are.
						{ Cue = "/VO/Nyx_0214", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- Zagreus.
						{ Cue = "/VO/Nyx_0411", RequiredPlayed = { "/VO/Nyx_0054" } },
						-- The Fates have been unkind.
						{ Cue = "/VO/Nyx_0261", RequiredPlayed = { "/VO/Nyx_0054" }, RequiredRoomThisRun = "D_Boss01", RequiresRunNotCleared = true, },
						-- Another setback to be overcome.
						{ Cue = "/VO/Nyx_0262", RequiredPlayed = { "/VO/Nyx_0054" }, RequiredRoomThisRun = "D_Boss01", RequiresRunNotCleared = true, },
						-- The realm is strong.
						{ Cue = "/VO/Nyx_0479", RequiredPlayed = { "/VO/Nyx_0217" }, RequiredTextLines = { "Ending01" }, },
						-- The House is in order.
						{ Cue = "/VO/Nyx_0480", RequiredTextLines = { "Ending01" }, },
						-- Haaaaah.
						-- { Cue = "/VO/Nyx_0053" },
						-- A welcome sight.
						-- { Cue = "/VO/Nyx_0056" },
					}
				},
			},
			-- Nyx Missing
			{
				TriggerGroup = "NyxMissingPoints",
				WithinDistance = 375,
				RequiredCompletedRuns = 3,
				RequiredFalseFlags = { "InFlashback", },
				VoiceLines =
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					UsePlayerSource = true,
					PlayOnceFromTableThisRun = true,

					-- Wonder where Nyx went.
					{ Cue = "/VO/ZagreusHome_0452" },
				},
			},
			-- Dusa
			{
				TriggerObjectType = "NPC_Dusa_01", WithinDistance = 680,
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "DusaVsNyx03",
						SuccessiveChanceToPlay = 0.33,
						UsePlayerSource = true,

						-- Oh...
						{ Cue = "/VO/ZagreusHome_0561" },
					},
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "DusaVsNyx04",
						SuccessiveChanceToPlay = 0.33,
						UsePlayerSource = true,

						-- Dusa...?
						{ Cue = "/VO/ZagreusHome_0244" },
					},
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "DusaWithNyx03",
						SuccessiveChanceToPlay = 0.33,
						UsePlayerSource = true,

						-- Dusa!
						{ Cue = "/VO/ZagreusHome_2021" },
					},
				},
			},
			-- Orpheus
			{
				TriggerObjectType = "NPC_Orpheus_01", WithinDistance = 350,
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						ChanceToPlay = 0.4,
						SuccessiveChanceToPlay = 0.33,
						RequiresNullAmbientMusicId = true,
						PreLineAnim = "OrpheusFidget",
						Cooldowns =
						{
							{ Name = "HouseNPCAnySpeech", Time = 10 },
						},

						-- Hello...!
						{ Cue = "/VO/Orpheus_0060", RequiredPlayed = { "/VO/Orpheus_0061" }, },
						-- Hello...
						{ Cue = "/VO/Orpheus_0061", RequiredFalseTextLines = { "OrpheusAboutSingersReunionQuest01" }, },
						-- Hmm.
						{ Cue = "/VO/Orpheus_0062", RequiredPlayed = { "/VO/Orpheus_0061" }, },
						-- Ah.
						{ Cue = "/VO/Orpheus_0063", RequiredPlayed = { "/VO/Orpheus_0061" }, },
						-- Oh, um, hello.
						{ Cue = "/VO/Orpheus_0064", RequiredPlayed = { "/VO/Orpheus_0061" }, },
						-- Hello there.
						{ Cue = "/VO/Orpheus_0065", RequiredPlayed = { "/VO/Orpheus_0061" }, },
						-- Zagreus.
						-- { Cue = "/VO/Orpheus_0091", RequiredPlayed = { "/VO/Orpheus_0061" }, },
						-- Zagreus?
						-- { Cue = "/VO/Orpheus_0092", RequiredPlayed = { "/VO/Orpheus_0061" }, },
						-- Hello my friend.
						{ Cue = "/VO/Orpheus_0093", RequiredPlayed = { "/VO/Orpheus_0061" }, RequiredTextLines = { "OrpheusGift02" }, },
						-- Hello friend.
						{ Cue = "/VO/Orpheus_0094", RequiredPlayed = { "/VO/Orpheus_0061" }, RequiredTextLines = { "OrpheusGift06" }, },
						-- Greetings.
						{ Cue = "/VO/Orpheus_0095", RequiredPlayed = { "/VO/Orpheus_0061" }, RequiredTextLines = { "OrpheusGift02" }, },
					},
				},
			},
			-- Meg
			-- moved to NPCData / GlobalVoiceLines
		},

		StartUnthreadedEvents =
		{
			{
				FunctionName = "ActivateConditionalItems",
			},
			-- ending
			{
				FunctionName = "CheckGardenOpen",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredTextLines = { "PersephoneReturnsHome01" },
				},
				Args =
				{
					DeleteGroups = { "GardenOpenDelete" },
					SetClamps = { 422050, 422043, 422045, 422046, 422047, 422048, 555425, 555424 },
				},
			},
			-- ending
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredFalseTextLines = { "Ending01" },
					RequiredRoomThisRun = "Return04",
				},
				Args =
				{
					Ids = { 555686, 555688, },
				},
			},
			{
				FunctionName = "SetupEndingScene",
				GameStateRequirements =
				{
					RequiredFalseTextLines = { "Ending01" },
					RequiredRoomThisRun = "Return04",
				},
				Args =
				{
					SetClamps = { 422050, 422043, 422045, 422046, 422047, 422048, 555425, 556837 },
					SetCameraZoomWeights =
					{
						[40001] = 1.0,
						[210380] = 1.2,
						[50002] = 1.3,
						[555424] = 0.85,
						[556836] = 0.85,
					},
				},
			},
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredFalseTextLines = { "Ending01" },
					RequiredFalseRooms = { "DeathAreaBedroomHades" },
					RequiredRoomThisRun = "Return04",
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 555687 },
					DistanceTrigger =
					{
						WithinDistance = 2000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							SkipPan = true,
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.85,
									UsePlayerSource = true,

						 			-- Wow...
						 			-- { Cue = "/VO/ZagreusField_0285" },
								},
								{
									PreLineWait = 0.35,
									BreakIfPlayed = true,
									PostLineWait = 0.65,

									-- Zagreus.
									-- { Cue = "/VO/MegaeraHome_0058" },
								},
							},
							TextLineSet =
							{
								Ending01 =
								{
									-- requirements are above
									EndVoiceLines =
									{
										PreLineWait = 2.35,
										BreakIfPlayed = true,

										-- Zagreus? Come here a moment, please.
										-- { Cue = "/VO/Persephone_0114" },
									},
									{ Cue = "/VO/Persephone_0101", Speaker = "NPC_Persephone_01", 
										Portrait = "Portrait_Persephone_Default_01",
										PostLineFunctionName = "GardenScenePan",
										PortraitExitAnimation = "Portrait_Persephone_Default_01_Exit",
										PreLineWait = 0.35,
										EndSound = "/VO/CerberusBarks",
										Text = "...I spent many days tending this garden... or nights? Quite difficult to tell the time here. But, it's held on longer than I would have expected..." },

									{ Cue = "/VO/Hades_0913",
										-- SecretMusicActiveStems = { "Room", "Strings", "WoodWinds", "Harp", "Trombones", "Percussion" },
										-- SecretMusicMutedStems = { "Room", "Strings", "WoodWinds", "Harp", "Trombones", "Percussion" },

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Default_01",
										PreLineFunctionName = "HadesArmsCross",
										Text = "...Persephone... I..." },

									{ Cue = "/VO/Persephone_0103",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicMutedStems = { "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01", Portrait = "Portrait_Persephone_Joyful_01",
										Emote = "PortraitEmoteSurprise",
										PreLineAnim = "PersephoneGarden_Shocked", PreLineAnimTarget = 555688,
										PostLineAnim = "PersephoneGarden_Vulnerable_ShockToThoughtful", PostLineAnimTarget = 555688,
										Text = "Cerberus! I missed you so. And dutiful as ever, aren't you." },

									{ Cue = "/VO/Hades_0914",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Averted_01", PreLineWait = 0.35,
										PreLineFunctionName = "HadesArmsUnCross",
										Text = "...I'm sorry. Know that I am sorry." },

									{ Cue = "/VO/Persephone_0104",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicMutedStems = { "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01", Portrait = "Portrait_Persephone_Apprehensive_01",
										PreLineAnim = "PersephoneGarden_Vulnerable_ReturnToIdle", PreLineAnimTarget = 555688,
										Text = "Hades... you look tired. Though, I am not the only one you ought to be apologizing to." },

									{ Cue = "/VO/Hades_1202",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Averted_01",
										PreLineFunctionName = "HadesArmsCross",
										Text = "I know. I know, I.... Why have you returned? If Olympus... if your mother discovers what happened, not even Zeus, not even {#DialogueItalicFormat}he {#PreviousFormat}could stop what would transpire, here!" },

									{ Cue = "/VO/Persephone_0105",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicMutedStems = { "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01", Portrait = "Portrait_Persephone_Default_01",
										PreLineFunctionName = "HadesArmsUnCross",
										PreLineAnim = "PersephoneGarden_Vulnerable", PreLineAnimTarget = 555688,
										Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}, I've a thought or two about how we can settle that. Though I shall need for you and Zagreus to cooperate with me on a solution. Or, if you'd rather, I could just return the way I came?" },

									{ Cue = "/VO/Hades_0916",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Default_01",
										PreLineFunctionName = "HadesArmsCross",
										Text = "A solution? What, do you intend to have them over for Ambrosia? Not even you can fix a broken family, Persephone." },

									{ Cue = "/VO/Persephone_0106",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicMutedStems = { "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01",
										Portrait = "Portrait_Persephone_FiredUp_01",
										PortraitExitAnimation = "Portrait_Persephone_FiredUp_01_Exit",
										PreLineAnim = "PersephoneGarden_Greeting",
										PreLineAnimTarget = 555688,
										Text = "You're right, Hades! I can't. Certainly not by myself. So, are you going to help me, or what?" },

									{ Cue = "/VO/Hades_0917",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Averted_01",
										PreLineFunctionName = "HadesArmsUnCross",
										PreLineWait = 0.9,
										Text = "...I would do anything that you would ask of me." },

									{ Cue = "/VO/Persephone_0107",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicMutedStems = { "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01",
										Portrait = "Portrait_Persephone_Apprehensive_01",
										PortraitExitAnimation = "Portrait_Persephone_Apprehensive_01_Exit",
										PreLineAnim = "PersephoneGarden_Dismiss", PreLineAnimTarget = 555688,
										Text = "Then, first, talk to your son." },

									{ Cue = "/VO/Hades_0918",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Default_01",
										PreLineWait = 1.31,
										PreLineFunctionName = "HadesArmsCross",
										Text = "...{#DialogueItalicFormat}Mm{#PreviousFormat}. Zagreus? You have already met Persephone, our Queen. I expect for you to show deference to her, at all times!" },

									{ Cue = "/VO/ZagreusHome_2678",

										SecretMusicActiveStems = { "WoodWinds" },
										SecretMusicMutedStems = { "Trombones", "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Defiant_01",
										PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
										Text = "Wow, Father, you called me by my name! What is this strange sensation that I feel? Perhaps it's this {#DialogueItalicFormat}deference {#PreviousFormat}of which you speak?" },

									{ Cue = "/VO/Persephone_0109",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicMutedStems = { "WoodWinds", "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01", Portrait = "Portrait_Persephone_FiredUp_01",
										PortraitExitAnimation = "Portrait_Persephone_FiredUp_01_Exit",
										Emote = "PortraitEmoteDepressed",
										PreLineAnim = "PersephoneGarden_Dismiss", PreLineAnimTarget = 555688,
										Text = "Oh, stop it, both of you. Don't make me regret this, Hades. Speak honestly with him. About yourself, not me. Go on." },

									{ Cue = "/VO/Hades_0919",

										SecretMusicActiveStems = { "Trombones", "Room" },
										SecretMusicMutedStems = { "WoodWinds", "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Averted_01",
										SecretMusicSection = 2,
										PreLineWait = 0.8,
										PreLineFunctionName = "HadesArmsUnCross",
										Text = "Yes. I... Zagreus. I know there have been times... when I've let my mood reflect on you. I showed very little patience. Questioned your judgment, often, when my own was flawed. Thus, I apologize to you, my son. I have no excuses. And I ask no forgiveness." },

									{ Cue = "/VO/ZagreusHome_3267",

										SecretMusicActiveStems = { "WoodWinds" },
										SecretMusicMutedStems = { "Trombones", "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Defiant_01",
										PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
										Text = "What about the part where you lied to me about Mother, do you apologize for that? Your foul moods, and venting them on me... I've long since come to expect that from you. And I resented you for it. But I always thought... you're honest." },

									{ Cue = "/VO/Hades_0943",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "WoodWinds", "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Averted_01",
										PreLineFunctionName = "HadesArmsCross",
										PreLineWait = 0.3,
										Text = "Your mother did not come here willingly when we originally met. When she left... believing you were stillborn... her decision was final. I believed that she was better off without the lot of us, Olympus included. Deceiving both of you... it tore against my being. But it needed to be done." },

									{ Cue = "/VO/ZagreusHome_3268",

										SecretMusicActiveStems = { "WoodWinds" },
										SecretMusicMutedStems = { "Trombones", "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Empathetic_01",
										PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
										PreLineFunctionName = "HadesArmsUnCross",
										Text = "Well, you didn't need to vent all that inner turmoil onto me throughout my life. Though, I think I understand. I only wish I could have understood sooner. So, uh... what now? I've grown so used to ransacking your domain, I think I'm really going to miss it." },

									{ Cue = "/VO/Hades_0920",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "WoodWinds", "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Default_01",
										PreLineFunctionName = "HadesArmsCross",

										PreLineAnim = "CerberusHappyGreeting_ReturnToIdle", PreLineAnimTarget = 555687,
										Text = "About that... your {#DialogueItalicFormat}ransacking {#PreviousFormat}revealed many flaws in our security. The types that never get into reports. Our reputation rides on there being no escape from here. Would you... keep trying to break free? Not for my sake. But for this realm. For the Queen." },

									{ Cue = "/VO/Persephone_0328",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicMutedStems = { "WoodWinds", "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01", Portrait = "Portrait_Persephone_Default_01",
										PreLineAnim = "PersephoneGarden_Vulnerable", PreLineAnimTarget = 555688,
										Text = "Zagreus... If you keep fighting out of here... it shall help keep appearances that everything is as it always was." },

									{ Cue = "/VO/ZagreusHome_2681",

										SecretMusicActiveStems = { "WoodWinds" },
										SecretMusicMutedStems = { "Percussion", "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Defiant_01",
										Text = "Question, Father. Let's say I accept. When next I reach the surface... is it still going to be you waiting up there?" },

									{ Cue = "/VO/Hades_0921",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion", "WoodWinds" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Default_01",
										PreLineFunctionName = "HadesArmsUnCross",
										Text = "Ah, boy. If you think for an instant that I shall go easier on you because of this, you'll soon learn otherwise." },

									{ Cue = "/VO/ZagreusHome_2682",

										SecretMusicActiveStems = { "WoodWinds" },
										SecretMusicMutedStems = { "Percussion", "Trombones" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Defiant_01",
										SecretMusicSection = 3,
										Text = "So I just battle to the surface and repeatedly kill my own father, then?" },

									{ Cue = "/VO/Hades_0922",

										SecretMusicActiveStems = { "Trombones" },
										SecretMusicMutedStems = { "Percussion", "WoodWinds" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Hades_01", Portrait = "Portrait_Hades_Default_01",
										Emote = "PortraitEmoteFiredUp",
										PreLineFunctionName = "HadesArmsCross",
										Text = "You have it half-correct!" },

									{ Cue = "/VO/Persephone_0111",

										SecretMusicActiveStems = { "Percussion" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "NPC_Persephone_01", Portrait = "Portrait_Persephone_Default_01",
										Text = "Perhaps you'll also tend to my little cottage while you're in the area? The garden doesn't take much care at all. I'd like to keep the place in decent shape. In case I cannot suffer this for long." },

									{ Cue = "/VO/ZagreusHome_2683",

										SecretMusicActiveStems = { "WoodWinds" },
										SecretMusicActiveStemsDuration = 2,
										SecretMusicMutedStemsDuration = 3,

										Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Default_01",
										PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
										Text = "{#DialogueItalicFormat}Hahaha{#PreviousFormat}, well! I guess I'll see what I can do." },

									{ Cue = "/VO/Persephone_0113",

										PreLineThreadedFunctionName = "EndAmbience",
										Speaker = "NPC_Persephone_01", Portrait = "Portrait_Persephone_Default_01",
										PortraitExitAnimation = "Portrait_Persephone_Default_01_Exit",
										EndSound = "/Leftovers/Menu Sounds/EmoteThoughtful",
										SecretMusicSection = 10,
										PreLineFunctionName = "HadesArmsUnCross",
										PreLineAnim = "PersephoneGarden_Greeting", PreLineAnimTarget = 555688,
										Text = "Just do the best you can. And, clearly, I've work to do as well. We have a lot of it ahead of us, I'd say. So, shall we get started, then?" },

									-- to Hades Bedroom, Storyteller
									{ Cue = "/VO/ZagreusHome_3724",
										PreLineThreadedFunctionName = "PostEndingAmbience",
										Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Default_01",
										PreLineFunctionName = "ViewPortraitPresentation",
										PreLineFunctionArgs = { PortraitAnimationName = "PortraitFamily", FadeInTime = 1.5, FadeOutWait = 38, PanDuration = 32,
											SecretMusic = "/Music/MusicExploration1_MC",
											PortraitGlobalVoiceLines = "StorytellerEndingVoiceLines" },
										FadeOutTime = 0.5, FullFadeTime = 2.5,
										LoadMap = "DeathAreaBedroomHades",
										-- SpawnOnId = 422138, AngleTowardHero = true,
										TeleportHeroToId = 555690, AngleHeroTowardTargetId = 421926,
										FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
										PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
										PreLineWait = 0.35,
										-- PostLineFunctionName = "DisplayEndingMessage",
										-- PostLineFunctionArgs = { Delay = 0.5, MessageId = "GameCleared_Message01" },
										PostLineThreadedFunctionName = "KeyAchievementPresentation",
										PostLineFunctionArgs = { Title = "EndingComplete", Sound = "/Music/ARStinger_All_5" },
										-- PostLineFunctionArgs = { TextColor = Color.Red, AnimationName = "", AnimationOutName = "", TextRevealSound = "", Title = "", Text = "NPC_Eurydice_01" },
										Text = "{#DialogueItalicFormat}After all this time{#PreviousFormat}, it's only been a few days! But it's been good. Mother and Father are back together, made some new friends, got this fancy painting! Easy. All is well in the Underworld!" },
								},
							},
						},
					},
				},
			},
			{
				FunctionName = "ActivateConditionalItems",
			},
			-- hades almost always present
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
				},
				Args =
				{
					Ids = { 370006, },
				},
			},
			-- achilles in Flashback 02
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "InFlashback", },
					RequiredTextLines = { "NyxFlashback01" },
				},
				Args =
				{
					Ids = { 370009, },
				},
			},
			-- Achilles always present for HadesBedroom first visit
			{
				FunctionName = "ActivatePrePlaced",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "ZagSpecialEventInProgress" },
				},
				Args =
				{
					Types = { "NPC_Achilles_01", },
				},
			},
			{
				FunctionName = "ActivatePrePlaced",
				GameStateRequirements =
				{
					RequiredTextLinesThisRun = "AchillesAboutHadesBedroom01",
				},
				Args =
				{
					Types = { "NPC_Achilles_01", },
				},
			},
			{
				FunctionName = "SpecialEventDoorPresentation",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "ZagSpecialEventInProgress" },
				},
			},

			-- Dusa Fired -- Nyx always present
			{
				FunctionName = "ActivatePrePlaced",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "DusaNotYetReHired" },
				},
				Args =
				{
					Types = { "NPC_Nyx_01", },
				},
			},
			-- ending
			-- after first clear, nyx and achilles always appear
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredTextLinesThisRun = "PersephoneFirstMeeting",
				},
				Args =
				{
					Types =
					{
						"NPC_Achilles_01",
						"NPC_Nyx_01",
					},
				},
			},
			-- nyx always appears after lord hades event
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredAnyTextLinesThisRun = { "LordHadesAboutPersephoneMeeting02", "PersephoneMeeting05_A", "PersephoneMeeting05_B", "PersephoneMeeting06", "PersephoneMeeting07", "PersephoneMeeting09" },
				},
				Args =
				{
					Types =
					{
						"NPC_Nyx_01",
					},
				},
			},
			-- queen persephone always appears after ending01
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredTextLinesThisRun = "PersephoneReturnsHome01",
				},
				Args =
				{
					Types =
					{
						"NPC_Persephone_Home_01",
					},
				},
			},
			-- persephone & nyx always present during OlympianReunionQuest
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTextLines = { "PersephoneAboutOlympianReunionQuest01" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				},
				Args =
				{
					Types =
					{
						"NPC_Nyx_01",
						"NPC_Persephone_Home_01",
					},
				},
			},
			-- first run
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredMaxCompletedRuns = 0,
				},
				Args =
				{
					Types =
					{
						"NPC_Hypnos_01",
						-- "NPC_Hades_01",
						"NPC_Cerberus_01",
						"NPC_Nyx_01",
						"NPC_Achilles_01",
						-- "NPC_Dusa_01",
						-- "NPC_Orpheus_01",
						"NPC_FurySister_01",
						-- "NPC_Thanatos_01",
						-- "TrainingMelee",
					},
					ActivationCapMin = 5,
					ActivationCapMax = 5,
				},
			},
			-- before lounge opens
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredMinCompletedRuns = 1,
					RequiredMaxCompletedRuns = 3,
				},
				Args =
				{
					Types =
					{
						"NPC_Hypnos_01",
						-- "NPC_Hades_01",
						"NPC_Cerberus_01",
						"NPC_Nyx_01",
						"NPC_Achilles_01",
						-- "NPC_Dusa_01",
						"NPC_Orpheus_01",
						"NPC_FurySister_01",
						-- "NPC_Thanatos_01",
						-- "TrainingMelee",
					},
					ActivationCapMin = 3,
					ActivationCapMax = 5,
				},
			},
			-- after lounge opens (before orpheus)
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredFalseCosmetics = { "OrpheusUnlockItem" },
					RequiredFalseTextLines = { "Ending01" },
					RequiredMinCompletedRuns = 4,
				},
				Args =
				{
					Types =
					{
						"NPC_Hypnos_01",
						-- "NPC_Hades_01",
						"NPC_Cerberus_01",
						"NPC_Nyx_01",
						"NPC_Achilles_01",
						"NPC_Dusa_01",
						-- "NPC_Orpheus_01",
						"NPC_FurySister_01",
						"NPC_Thanatos_01",
						-- "TrainingMelee",
					},
					ActivationCapMin = 3,
					ActivationCapMax = 5,
				},
			},
			-- after orpheus
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredCosmetics = { "OrpheusUnlockItem" },
					RequiredFalseTextLines = { "Ending01" },
					RequiredMinCompletedRuns = 4,
				},
				Args =
				{
					Types =
					{
						"NPC_Hypnos_01",
						-- "NPC_Hades_01",
						"NPC_Cerberus_01",
						"NPC_Nyx_01",
						"NPC_Achilles_01",
						"NPC_Dusa_01",
						"NPC_Orpheus_01",
						"NPC_FurySister_01",
						"NPC_Thanatos_01",
						-- "TrainingMelee",
					},
					ActivationCapMin = 4,
					ActivationCapMax = 6,
				},
			},
			-- after ending: check persephone away status
			{
				FunctionName = "CheckIsPersephoneAway",
				GameStateRequirements =
				{
					RequiredTextLines = { "PersephoneLeavesToOlympus01" },
				},
			},
			-- persephone always spawns immediately after being set to return
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "PersephoneJustReturned", },
				},
				Args =
				{
					Ids = { 555714, },
				},
			},
			-- general NPC activation (with queen persephone present)
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", "PersephoneAway" },
					RequiredTextLines = { "Ending01" },
				},
				Args =
				{
					Types =
					{
						"NPC_Hypnos_01",
						-- "NPC_Hades_01",
						"NPC_Cerberus_01",
						"NPC_Nyx_01",
						"NPC_Achilles_01",
						"NPC_Dusa_01",
						"NPC_Orpheus_01",
						"NPC_FurySister_01",
						"NPC_Thanatos_01",
						"NPC_Persephone_Home_01",
						-- "TrainingMelee",
					},
					ActivationCapMin = 5,
					ActivationCapMax = 7,
				},
			},
			-- general NPC activation (while queen persephone is away)
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback" },
					RequiredTrueFlags = { "PersephoneAway" },
					RequiredTextLines = { "Ending01" },
				},
				Args =
				{
					Types =
					{
						"NPC_Hypnos_01",
						-- "NPC_Hades_01",
						"NPC_Cerberus_01",
						"NPC_Nyx_01",
						"NPC_Achilles_01",
						"NPC_Dusa_01",
						"NPC_Orpheus_01",
						"NPC_FurySister_01",
						"NPC_Thanatos_01",
						-- "NPC_Persephone_Home_01",
						-- "TrainingMelee",
					},
					ActivationCapMin = 4,
					ActivationCapMax = 6,
				},
			},
			-- force nyx and meg to appear for Ending
			{
				FunctionName = "ActivateAnyPrePlaced", Args = { Ids = { 370010, 390082 }, },
				GameStateRequirements =
				{
					RequiredTextLinesThisRun = "Ending01",
				},
			},
			-- force hypnos to appear for Brothers Quest
			{
				FunctionName = "ActivateAnyPrePlaced", Args = { Ids = { 370024 }, },
				GameStateRequirements =
				{
					IsIdAlive = 423052,
					RequiredTextLines = { "ThanatosAboutHypnos02" },
					RequiredFalseTextLines = { "HypnosAboutThanatos04" },
				},
			},
			{
				FunctionName = "ActivateAnyPrePlaced", Args = { Ids = { 370024 }, },
				GameStateRequirements =
				{
					RequiredTextLines = { "ThanatosWithHypnos03" },
					RequiredFalseTextLines = { "ThanatosWithHypnos07" },
				},
			},
			-- force persephone & hades to appear for Epilogue
			{
				FunctionName = "ActivateAnyPrePlaced", Args = { Ids = { 559274, 370006 }, },
				GameStateRequirements =
				{
					RequiredTextLines =
					{
						"PersephoneAboutOlympianReunionQuest01",
						"ZeusAboutOlympianReunionQuest01",
						"PoseidonAboutOlympianReunionQuest01",
						"AthenaAboutOlympianReunionQuest01",
						"AresAboutOlympianReunionQuest01",
						"AphroditeAboutOlympianReunionQuest01",
						"ArtemisAboutOlympianReunionQuest01",
						"DionysusAboutOlympianReunionQuest01",
						"DemeterAboutOlympianReunionQuest01",
						"HermesAboutOlympianReunionQuest01"
					},
					RequiredFalseTextLines =
					{
						"OlympianReunionQuestComplete"
					},
				},
			},
			-- additional start-up
			{
				FunctionName = "FadeOutIds",
				GameStateRequirements =
				{
					RequiredFalseCosmetics = { "GhostAdminDesk", },
				},
				Args =
				{
					Ids = { 210375 },
				},
			},
			{
				FunctionName = "ActivatePrePlacedObstacles",
				Args =
				{
					Groups = { "GhostWorker", "GhostLine", "GhostPatrol", "GhostBarPatrons", "GhostBartender", "GhostKitchen" },
				},
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
				},
			},
			{
				FunctionName = "ActivatePrePlacedObstacles",
				Args =
				{
					Groups = { "GardenLights" },
				},
				GameStateRequirements =
				{
					RequiredTextLines = { "PersephoneReturnsHome01" },
				},
			},
			{
				FunctionName = "ActivateOneOfAPrePlacedGroupSet",
				Args =
				{
					ActivationChance = 0.7,
					Groups = { "GhostEavesdropA", "GhostEavesdropB", "GhostEavesdropC", "GhostEavesdropD", "GhostEavesdropE", "GhostEavesdropF" },
				},
				GameStateRequirements =
				{
					--RequiredMinCompletedRuns = 1,
					RequiredFalseFlags = { "InFlashback", },
				},
			},
			-- hides an in-lounge GhostInspectPoint until Lounge is open
			{
				FunctionName = "FadeOutIds",
				GameStateRequirements =
				{
					RequiredMaxCompletedRuns = 4,
				},
				Args =
				{
					Ids = { 421098 },
				},
			},
			{
				FunctionName = "UnlockDeathAreaInteractbles",
				Args = {},
			},
			{
				FunctionName = "UpdateEmployeeOfTheMonth",
				GameStateRequirements =
				{
					RequiredMinCompletedRuns = 4,
					RequiredFalseFlags = { "InFlashback", },
				},
				Args = { MinRunsPerEmployee = 1, MaxRunsPerEmployee = 3, ChangeChance = 0.5, },
			},
			{
				FunctionName = "CheckConversations",
				Args = {},
			},
			{
				FunctionName = "DisableWeapons",
				Args = {},
			},
			{
				FunctionName = "CheckDashOverride",
				Args = {},
			},
			{
				FunctionName = "StartCustomDeathAreaAmbience",
			},
		},

		ThreadedEvents =
		{
			{
				FunctionName = "FlashbackLeftBedroom",
				Args = {},
				GameStateRequirements =
				{
					RequiredTrueFlags = { "InFlashback" },
				}
			},
			{
				-- Hallway workers
				FunctionName = "PatrolPath",
				Args =
				{
					GroupName = "GhostWorker",
					NewGroupName= "ActiveGhosts",
					RemoveFromGroup = true,
					AddToGroup = true,
					MaxPatrols = 10,
					SendPatrolInterval = 0.1,
					SpeedMin = 120,
					SpeedMax = 180,
					Loop = true,
					Path =
					{

						{ Id = 393497, OffsetRadius = 200 },
						{
							Branch =
							{
								{
									{ Id = 393491, OffsetRadius = 30, },
									{
										Branch =
										{
											{
												{ Id = 393499, OffsetRadius = 10 },
												{ Id = 393485, OffsetRadius = 10, PostArriveWait = 2, EmoteOnEnd = "Smile", AngleTowardIdOnStop = 370010 },
												{ Id = 393499, OffsetRadius = 10 },
											},
											{
												{ Id = 393484, OffsetRadius = 100, },
												{ Id = 393483, OffsetRadius = 30, },
												{ Id = 424986, OffsetRadius = 30, },
												{ Id = 424987, OffsetRadius = 10, PostArriveWait = 4, EmoteOnEnd = "Smile" },
												{ Id = 424986, OffsetRadius = 30, },
												{ Id = 393483, OffsetRadius = 30, },
												{ Id = 393484, OffsetRadius = 30, },
											},
											{
												{ Id = 393499, OffsetRadius = 10 },
												{ Id = 393498, OffsetRadius = 10, PostArriveWait = 2, EmoteOnEnd = "Disgruntled" },
												{ Id = 393499, OffsetRadius = 30, },
											},
											{
												{ Id = 393493, OffsetRadius = 20, PostArriveWait = 2 },
											},
										},
									},
								},

								{
									{ Id = 393492, OffsetRadius = 10 },
									{
										Branch =
										{
											{
												{ Id = 393494, OffsetRadius = 10, PostArriveWait = 4 },
											},
											{
												{ Id = 393486, OffsetRadius = 50, },
												{
													Branch =
													{
														{
															{ Id = 393489, OffsetRadius = 10, PostArriveWait = 1.0 },
															{ Id = 393486, OffsetRadius = 10, PostArriveWait = 1.0 },

														},
														{
															{ Id = 393487, OffsetRadius = 10 },
															{ Id = 393488, OffsetRadius = 10, PostArriveWait = 3.0 },
															{ Id = 393487, OffsetRadius = 10 },
															{ Id = 393486, OffsetRadius = 10 },
														},
														{
															{ Id = 421074, OffsetRadius = 10 },
															{ Id = 393490, OffsetRadius = 10, PostArriveWait = 2.0 },
															{ Id = 421074, OffsetRadius = 10 },
															{ Id = 393486, OffsetRadius = 10 },
														},
														{
															{ Id = 421072, OffsetRadius = 10, PostArriveWait = 2.0, MinUseInterval = 2.0, EmoteOnEnd = "Smile" },
															{ Id = 393486, OffsetRadius = 10 },
														},
													},
												},
											},
										},
									},
								},
							},
						},
					},
				},
			},
			{
				-- Hades line
				FunctionName = "SetupGhostProcession",
				Args =
				{
					--ForceEligible = true,
					GhostOptionNames = { "MediumGhost01", "TallGhost01", "SmallGhost01", "TartarusGhost01", "TartarusGhost01", "TartarusGhost01", "TartarusGhost01" },
					BreakAfterNumJudgementsMin = 6,
					BreakAfterNumJudgementsMax = 15,
					BreakDurationMin = 60,
					BreakDurationMax = 120,
					Path =
					{
						{ Id = 393482, OffsetRadius = 10, SpeedMin = 200, SpeedMax = 250, },
						{
							Id = 393481,
							MinUseInterval = 2.1,
							--MinUseInterval = 12,
							SpeedMin = 200,
							SpeedMax = 250,

							-- Judgement Sequence // this turns on the V/O lines, the MinUseInterval, PostArriveWait and DestroyOnEnd values need to be flipped
							HadesJudgement = true,
							HadesJudgementPositiveChance = 0.2,

							JudgeSummoningPreWait = 0.6,
							JudgeSummoningPostWait = 1.5,
							JudgeAddressingPreWait = 0.7,
							JudgeAddressingPostWait = 3.0,

							GhostPreCaseWait = 0.4,
							GhostCaseEmotes = { "Fear", "Disgruntled", "Embarrassed" },

							JudgeListeningChance = 1.0,
							JudgeListeningPreWait = 0.6,
							JudgeListeningPostWait = 2.5,

							JudgePositiveVerdictPreWait = 2.6,
							JudgePositiveVerdictPostWait = 1.0,

							JudgeNegativeVerdictPreWait = 2.3,
							JudgeNegativeVerdictPostWait = 1.3,

							PostArriveWait = 2.0,
							--PostArriveWait = 0.1,
							DestroyOnEnd = true,
						},
					},
				},
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
				},
			},

			{
				--FunctionName = "HiFiGhostPatrol",
				--Args = { },
				--GameStateRequirements = { },

				FunctionName = "PatrolPath",
				Args =
				{
					GroupName = "3DGhosts",
					NewGroupName= "Active3DGhosts",
					RemoveFromGroup = true,
					AddToGroup = true,
					MaxPatrols = 1,
					SendPatrolInterval = 2.0,
					SpeedMin = 40,
					SpeedMax = 80,
					Loop = true,
					Path =
					{
						{ Id = 391307, MinUseInterval = 7.0, SpeedMin = 20, SpeedMax = 20, PostArriveWait = 5.0, AnimateOnEnd = "3DGhostAltFidget", },
					},
				},
			},
		},

		UnthreadedEvents =
		{

		},

		RushMaxRangeOverride = 200,

		InspectPoints =
		{
			[391473] =
			{
				RequiredFalseFlags = { "InFlashback" },
				UseText = "UseGhostInspectPoint",
				RequiredMinCompletedRuns = 1,
			},

			-- misc inspect points
			[370016] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				InteractTextLineSets =
				{
					InspectHouse01 =
					{
						EndVoiceLines =
						{
							PreLineWait = 0.3,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							-- You know I can hear you, old man.
							{ Cue = "/VO/ZagreusHome_0339" },
						},
						{ Cue = "/VO/Storyteller_0119",
							Text = "{#DialogueItalicFormat}The House of Hades: That dark and lavishly appointed lair of the Underworld's King is home not just to him, but to his willful progeny." },
					},
				},
			},
			[421076] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				RequiredMinCompletedRuns = 1,
				RequiredMaxCompletedRuns = 3,
				InteractTextLineSets =
				{
					InspectLoungeClosed01 =
					{
						-- Least we can look forward to the grand reopening.
						-- Cerberus destroyed the lounge again?
						EndCue = "/VO/ZagreusHome_0409",
						EndWait = 0.3,
						{ Cue = "/VO/Storyteller_0192",
							Text = "{#DialogueItalicFormat}What once was a small lounging area within the House of Hades now is sealed off, in utter shambles since the multi-headed Cerberus tore the space apart, mourning the missing Prince." },
					},
				},
			},
			[391577] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredMinCompletedRuns = 3,
				RequiredMaxCompletedRuns = 6,
				RequiredFalseFlags = { "InFlashback", },
				InteractTextLineSets =
				{
					InspectShades01 =
					{
						-- I listen!
						EndCue = "/VO/ZagreusHome_0265",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0157",
							Text = "{#DialogueItalicFormat}Shades of the dead mill constantly within the House, complaining of their woes, and seeking audience from any who would listen." },
					},
				},
			},
			[391576] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredMinCompletedRuns = 4,
				RequiredFalseFlags = { "InFlashback", },
				RequiredTextLines = { "InspectEmployeeOfTheMonth01" },
				RequiredMaxAnyCosmetics =
				{
					Cosmetics = GameData.LoungeCosmetics,
					Count = 8,
				},
				InteractTextLineSets =
				{
					InspectLoungeOpen01 =
					{
						-- It's better than nothing.
						EndCue = "/VO/ZagreusHome_0264",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0156",
							Text = "{#DialogueItalicFormat}The lounging area within the House of Hades is a dismal place to be, in spite of its intended purpose to enliven the House's grim inhabitants." },
					},
				},
			},
			[424963] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredMinCompletedRuns = 4,
				RequiredFalseFlags = { "InFlashback", },
				InteractTextLineSets =
				{
					InspectEmployeeOfTheMonth01 =
					{
						EndVoiceLines =
						{
							PreLineWait = 0.35,
							UsePlayerSource = true,

							-- It's supposed to be updated every so often but it's always Thanatos.
							{ Cue = "/VO/ZagreusHome_0996", RequiredFalsePlayed = { "/VO/ZagreusHome_1284", "/VO/ZagreusHome_2477" }, RequiredTextLines = { "ThanatosFirstAppearance" }, RequiredFalseTextLines = { "Ending01" }, },
							-- Never made it up there myself!
							{ Cue = "/VO/ZagreusHome_1284", RequiredFalsePlayed = { "/VO/ZagreusHome_0996", "/VO/ZagreusHome_2477" }, RequiredTextLines = { "Ending01" } },
							-- Won't ever see my face up on that wall I guess.
							{ Cue = "/VO/ZagreusHome_2477", RequiredFalsePlayed = { "/VO/ZagreusHome_0996", "/VO/ZagreusHome_1284" } },
						},
						{ Cue = "/VO/Storyteller_0272",
							Text = "{#DialogueItalicFormat}A commemorative board adorns one of the stoic walls within the lounging area, celebrating and proclaiming the accomplishments of those who serve Lord Hades best of all." },
					},
				},
			},
			[370001] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				Hidden = true,
				RequiredMinCompletedRuns = 4,
				RequiredFalseFlags = { "InFlashback", },
				RequiredTextLines = { "InspectLoungeOpen01" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				InteractTextLineSets =
				{
					InspectCellar01 =
					{
						EndVoiceLines =
						{
							{
								PreLineWait = 0.45,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								-- Still waiting for the festive occasion when we'll open one of these.
								{ Cue = "/VO/ZagreusHome_3720" },
							},
						},
						{ Cue = "/VO/Storyteller_0388",
							Text = "{#DialogueItalicFormat}The ancient casks of wine hidden within the recesses of the House of Lord Hades... few have tasted the intoxicating vintage they contain, and fewer still are permitted anywhere near their vicinity." },
					},
				},
			},
			[556918] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				InteractTextLineSets =
				{
					InspectCellar01 =
					{
						EndVoiceLines =
						{
							{
								PreLineWait = 0.45,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								-- They fought bravely, but Lord Dionysus was too strong.
								{ Cue = "/VO/ZagreusHome_3721" },
							},
						},
						{ Cue = "/VO/Storyteller_0413",
							Text = "{#DialogueItalicFormat}The stalwart casks of wine within the House of Hades now are almost entirely devoid of content, having bravely stood against the combined thirst of the Olympians during a certain feast." },
					},
				},
			},
			[556919] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				InteractTextLineSets =
				{
					InspectOlympusSculpture01 =
					{
						EndVoiceLines =
						{
							{
								PreLineWait = 0.45,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								-- The handiwork of Lord Hephaestus, himself! Sounds like he's been rather busy.
								{ Cue = "/VO/ZagreusHome_3728" },
							},
						},
						{ Cue = "/VO/Storyteller_0414",
							Text = "{#DialogueItalicFormat}A majestic gilded edifice of Mount Olympus, crafted with the utmost care from the true mountain's stone, now shines forever brightly even in the dim light of the House of Hades, as a parting gift from the Lord Master's kin." },
					},
				},
			},			
			[427176] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				Hidden = true,
				RequiredFalseTextLinesThisRun = { "InspectHouse01" },
				RequiredFalseFlags = { "InFlashback", },
				InteractTextLineSets =
				{
					InspectMural01 =
					{
						EndVoiceLines =
						{
							{
								PreLineWait = 0.45,
								UsePlayerSource = true,
								-- He's not really that great.
								{ Cue = "/VO/ZagreusHome_1858" },
							},
							{
								PreLineWait = 0.25,
								ObjectType = "NPC_Hades_01",
								RequiresFalseHadesProcession = true,
								-- Keep it down!
								{ Cue = "/VO/Hades_0614" },
							},
						},
						{ Cue = "/VO/Storyteller_0286",
							Text = "{#DialogueItalicFormat}A vast and intricately crafted mosaic depicts the Underworld King presiding over the enormity of his domain, whilst its chthonic residents look on in awe of him." },
					},
				},
			},

			[423058] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				Hidden = true,
				RequiredDeathRoom = "D_Boss01",
				AreIdsNotAlive = { 370007 },
				RequiredFalseFlags = { "InFlashback", },
				InteractTextLineSets =
				{
					InspectThrone01 =
					{
						-- That thing doesn't look particularly comfortable.
						EndCue = "/VO/ZagreusHome_0932",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0252",
							Text = "{#DialogueItalicFormat}Seldom does the overbearing throne of grim Lord Hades sit unoccupied; thus the House's denizens all go about their business, daring not so much as to ask why." },
					},
				},
			},

			-- garden
			[556828] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTextLines = { "Ending01" },
				RequiredFalseFlags = { "InFlashback", },
				InteractTextLineSets =
				{
					InspectHouseGarden01 =
					{
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							-- Not like Mother's cottage, but not bad.
							{ Cue = "/VO/ZagreusHome_3534" },
						},
						{ Cue = "/VO/Storyteller_0405",
							Text = "{#DialogueItalicFormat}The garden of Persephone the Queen, off-limits to the Prince throughout his life, now is laid bare to him at last in all its splendor." },
					},
				},
			},

			-- Flashback 1
			[391518] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback01" },
				RequiredFalseTextLines = { "Flashback06" },
				InspectMoveIds =
				{
					[391553] = 391558,
					--[391571] = 391571,
				},
				InteractTextLineSets =
				{
					Flashback02 =
					{
						PlayOnce = true,
						-- I said, shut up, old man!
						EndCue = "/VO/ZagreusHome_0177",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0132", PostLineFunctionName = "AdvanceFlashback",
							UseableOffIds = { 391473 },
							FadeOutIds = { 391473 },
							Text = "{#DialogueItalicFormat}He ventures toward the stately throne of his Lord Father, half-expecting to be caught, but ill-expecting what he is about to find." },
					},
				},
			},
			[391542] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback02" },
				RequiredFalseTextLines = { "Flashback06" },
				InspectMoveIds =
				{
					[391553] = 391560,
					[391571] = 391470,
				},
				InteractTextLineSets =
				{
					Flashback03 =
					{
						PlayOnce = true,
						-- I'm not listening!
						EndCue = "/VO/ZagreusHome_0335",
						EndWait = 0.4,
						{ Cue = "/VO/Storyteller_0133", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}He does not know exactly what he seeks. He only knows that something always has felt off to him, that he does not belong. Who is he, really? Lord Hades never would indulge such questions. So, Prince Zagreus would find out for himself." },
					},
				},
			},
			[391517] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback03" },
				RequiredFalseTextLines = { "Flashback06" },
				InteractTextLineSets =
				{
					Flashback04 =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0134", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}He rifles through his Lord Father's possessions. There is not much of any import there. Ledgers and administrative parchmentwork. Correspondence from Olympus which he had ignored. No trace of any reference to his son." },
					},
				},
			},
			[391544] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback04" },
				RequiredFalseTextLines = { "Flashback06" },
				InspectMoveIds =
				{
					--[391553] = 391560,
					[391571] = 420897,
				},
				InteractTextLineSets =
				{
					Flashback05 =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0135", EndSecretMusic = true, SecretMusic = "/Music/MusicHadesReset2_MC", SecretMusicSection = 0, SecretMusicActiveStems = { "Guitar", }, SecretMusicMutedStems = { "Drums", "Bass" },
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}But then, there is the note... written finely in a hand and voice the likes of which the Prince had never seen or heard." },
						{ Cue = "/VO/Persephone_0018", BoxAnimation = "PersephoneLetter", BoxExitAnimation = "PersephoneLetterOut", BoxOffsetY = 120, TextOffsetX = -390,
							TextOffsetY = GetLocalizedValue(-20, {
 								{ Code = "de", Value = -65 },
 								{ Code = "pl", Value = -40 },
 								{ Code = "pt-BR", Value = -50 },
								{ Code = "it", Value = -50 },
 								{ Code = "ko", Value = -70 },
 								{ Code = "ja", Value = -40 },
 							}),
							TextWidth = 780, TextColor = Color.Black,
							Text = "{#DialogueItalicFormat}'Hades: I can no longer tolerate my life here in this place. So, I am leaving, even if it kills me. I won't be returning to Olympus. If there is a place where I belong in this world, it must be somewhere between heaven and hell. Perhaps it's on the coast and has a little garden. Take care of Cerberus; I shall miss him.'" },
						{ Cue = "/VO/Storyteller_0125",
							Text = "{#DialogueItalicFormat}Thus did Prince of the Underworld Zagreus absorb the contents of this hidden letter, written in his mother's hand." },
						{ Cue = "/VO/ZagreusHome_0178", StartSound = "/Leftovers/SFX/TextReveal", Speaker = "PlayerUnit", Portrait = "Portrait_Zag_Defiant_01", PortraitExitAnimation = "Portrait_Zag_Defiant_01_Exit", EndSecretMusic = true,
							Emote = "PortraitEmoteSurprise",
							PreLineAnim = "ZagreusTalkDenial_Full", PreLineAnimTarget = "Hero",
							Text = "His mother's hand, my mother's hand, wait, {#DialogueItalicFormat}what{#PreviousFormat}?! You're saying this Persephone, that she's my... mother...? But, but Father always said that Nyx was my.... That liar. He lied to me, they both did. All my life!" },
						{ Cue = "/VO/Storyteller_0126ALT", PostLineFunctionName = "AdvanceFlashback", PostLineSecretMusic = "/Music/MainThemeQuiet",
							Text = "{#DialogueItalicFormat}Uhhh erm thus did the Prince discover, inadvertently, the well-kept truth about his lineage. Entirely by chance, this did occur...." },
					},
				},
			},
			[391515] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback05" },
				RequiredFalseTextLines = { "Flashback06" },
				InspectMoveIds =
				{
					[391553] = 420900,
					[391571] = 420899,
				},
				InteractTextLineSets =
				{
					Flashback06 =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0128ALT", PostLineFunctionName = "AdvanceFlashback",
							Text = "{#DialogueItalicFormat}Persephone... the one-time Queen of all the Underworld... where had she gone, and why? Engulfed by newfound questions and his rage, the Prince decided to confront his Lord and Master." },
					},
				},
				OnUsedFunctionName = "ActivatePrePlaced",
				OnUsedFunctionArgs =
				{
					Types = { "NPC_Nyx_01", },
					CheckConversations = true,
				},
			},

			-- Flashback 2
			[427207] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_01" },
				InspectMoveIds =
				{
					[391553] = 391560,
					--[391571] = 391571,
				},
				InteractTextLineSets =
				{
					Flashback_DayNightJob_02 =
					{
						PlayOnce = true,
						-- Going as fast as I can, you hurry up!
						EndCue = "/VO/ZagreusHome_2116",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0304", PostLineFunctionName = "AdvanceFlashback",
							UseableOnIds = { 420896 },
							FadeInIds = { 390325 },
							Text = "{#DialogueItalicFormat}Responsibility-rejecting Zagreus strides down his Father's hall, quite unconcerned about the urgency with which he is expected to behave under a set of circumstances such as this." },
					},
				},
			},
			[427208] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_02" },
				InspectMoveIds =
				{
					[391553] = 427209,
					[391571] = 427210,
				},
				InteractTextLineSets =
				{
					Flashback_DayNightJob_03 =
					{
						PlayOnce = true,
						-- You better not give me away, old man.
						EndCue = "/VO/ZagreusHome_2117",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0305", PostLineFunctionName = "AdvanceFlashback",
							ActivateIds = { 427199, 555677 },
							UseableOffIds = { 391473, 427213 },
							FadeOutIds = { 391473, 427213 },
							Text = "{#DialogueItalicFormat}The door to the administrative chamber beckons just beyond the hall. The prince perchance believes that he may enter quietly, without drawing the notice of those laboring within." },
					},
				},
			},
			-- see DeathAreaOffice for more

			-- cosmetics inspect points
			-- pillars
			[424958] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_HousePillars", },
				InteractTextLineSets =
				{
					Inspect_HousePillars_01 =
					{
						PlayOnce = true,
						-- I guess there are a lot of gemstones here.
						EndCue = "/VO/ZagreusHome_0993",
						EndWait = 0.4,
						{ Cue = "/VO/Storyteller_0269",
							Text = "{#DialogueItalicFormat}Among the countless splendid gemstones hidden underneath the earth, a great many are used to decorate the House of Hades, god of the dead, god of riches." },
					},
				},
			},
			-- north fountain
			[424960] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_NorthHallFountain", },
				InteractTextLineSets =
				{
					Inspect_NorthFountain_01 =
					{
						PlayOnce = true,
						-- Now I feel bad.
						EndCue = "/VO/ZagreusHome_0994",
						EndWait = 0.55,
						{ Cue = "/VO/Storyteller_0270",
							Text = "{#DialogueItalicFormat}Water is the source of life, yet still it flows within the darkest Underworld recesses, whilst restless shades of mortals look upon it and recall the short days they could drink it and draw breath." },
					},
				},
			},
			-- south fountain
			[424961] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_SouthHallFountain", },
				InteractTextLineSets =
				{
					Inspect_SouthFountain_01 =
					{
						PlayOnce = true,
						-- Ever since? It's not been that long.
						EndCue = "/VO/ZagreusHome_0995",
						EndWait = 0.45,
						{ Cue = "/VO/Storyteller_0271",
							Text = "{#DialogueItalicFormat}The gemstone-bearing Prince commissioned such a finely crafted fountain for the House, that all the shades who witnessed it still think of him quite fondly, ever since." },
					},
				},
			},
			-- cauldron
			[424962] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_KitchenStoveCauldron", },
				InteractTextLineSets =
				{
					Inspect_Cauldron_01 =
					{
						PlayOnce = true,
						-- I wish I did not know that.
						EndCue = "/VO/ZagreusHome_0997",
						EndWait = 0.4,
						{ Cue = "/VO/Storyteller_0273",
							Text = "{#DialogueItalicFormat}The dead have utterly no use for sustenance, although they try to feast upon it anyway, as though imagining the customs of the mortal life brings them some sense of peace." },
					},
				},
			},
			-- kitchen island
			[425000] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_KitchenIsland", },
				InteractTextLineSets =
				{
					Inspect_KitchenIsland =
					{
						PlayOnce = true,
						-- It's all right, wasn't hungry anyway.
						EndCue = "/VO/ZagreusHome_1315",
						EndWait = 0.45,
						{ Cue = "/VO/Storyteller_0274",
							Text = "{#DialogueItalicFormat}Having invested heavily into the cooking-area within the House of Hades, the empty-stomached Zagreus can nonetheless find nothing fit to eat." },
					},
				},
			},

			-- poet bust
			[427177] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_NorthHallBust", },
				InteractTextLineSets =
				{
					Inspect_PoetBust_01 =
					{
						PlayOnce = true,
						-- Never heard of him.
						EndCue = "/VO/ZagreusHome_1900",
						EndWait = 0.45,
						{ Cue = "/VO/Storyteller_0290",
							Text = "{#DialogueItalicFormat}Within the House's gallery now sits the bust of a distinguished poet, ruggedly handsome in his age, who, although yet to earn his fated fame, shall probably be better known someday." },
					},
				},
			},
			-- asphodel statue
			[427178] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_NorthHallPedestalBust", },
				InteractTextLineSets =
				{
					Inspect_AsphodelStatue_01 =
					{
						PlayOnce = true,
						-- I could take him.
						EndCue = "/VO/ZagreusHome_1903",
						EndWait = 0.45,
						{ Cue = "/VO/Storyteller_0293",
							Text = "{#DialogueItalicFormat}The frightful countenance of a bleached Bloodless warrior decorates the hall forever more, eternally in tribute to the savage servants of the House's lord." },
					},
				},
			},
			-- warrior statue
			[427179] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_NorthHallWarriorStatue", },
				InteractTextLineSets =
				{
					Inspect_WarriorStatue_01 =
					{
						PlayOnce = true,
						-- He sure looks tall...
						EndCue = "/VO/ZagreusHome_1906",
						EndWait = 0.45,
						{ Cue = "/VO/Storyteller_0296",
							Text = "{#DialogueItalicFormat}The perfect-chiseled physicality of one of Greece's greatest-ever heroes now adorns the House's gallery, reminding most onlookers of many ways in which they fail to compare." },
					},
				},
			},
			-- lounge fireplace
			[555808] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_LoungeFireplace" },
				InteractTextLineSets =
				{
					Inspect_MainHallFireplace01 =
					{
						PlayOnce = true,
						-- It's really quite cozy.
						EndCue = "/VO/ZagreusHome_2856",
						EndWait = 0.55,
						{ Cue = "/VO/Storyteller_0364",
							Text = "{#DialogueItalicFormat}The light provided by the flames of deepest hell enhances the lounging area with a soft glow; and their warmth soothes the few living denizens there." },
					},
				},
			},
			-- sundial
			[555809] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredCosmetics = { "Cosmetic_NorthHallSundial" },
				InteractTextLineSets =
				{
					Inspect_Sundial01 =
					{
						PlayOnce = true,
						-- Looks like it's 7:48...
						EndCue = "/VO/ZagreusHome_2857",
						EndWait = 0.55,
						{ Cue = "/VO/Storyteller_0365",
							Text = "{#DialogueItalicFormat}Time seems to stand quite still within the eternal realm of the dead, evidenced even by the means of measuring its passage." },
					},
				},
			},

		},

		ObstacleData =
		{
			-- Ghost Secretary / GhostAdmin / Ghost Admin / House Contractor
			-- note: this is the desk itself
			[210158] =
			{
				Name = "GhostAdmin",
				InteractDistance = 200,
				UseText = "UseGhostAdmin",
				OnUsedFunctionName = "UseGhostAdmin",
				AnimOffsetZ = 250,
				--DestroyIfNotSetup = true,
				NoSaleEmote = "StatusIconEyeRoll",
				NoSaleEmoteTargetId = 427173,
				MadeSaleEmote = "StatusIconSmile",
				MadeSaleEmoteTargetId = 427173,
				-- EmoteOffsetZ = 50,
				SetupGameStateRequirements =
				{
					RequiredMinCompletedRuns = 1,
					RequiredFalseFlags = { "InFlashback", },
				},
				SetupFunctions =
				{
					{ Name = "ActivateAnyPrePlaced", Args = { Ids = { 425703, 425709, 421735, 425708, 427174, 427173, 427175, }, }, },
					{
						Name = "PlayStatusAnimation",
						Args = { Animation = "StatusIconWantsToTalkImportant", },
						GameStateRequirements =
						{
							RequiredScreenViewedFalse = "GhostAdmin",
							RequiredFalseFlags = { "InFlashback", },
						},
					},
					{
						Name = "PlayStatusAnimation",
						Args = { Animation = "StatusIconWantsToTalkImportant", },
						GameStateRequirements =
						{
							AnyAffordableGhostAdminItem = "Critical",
							RequiredFalseFlags = { "InFlashback", },
						},
					},
				},
			},
			-- Contractor Coffee Fizz
			[210375] =
			{
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "GhostAdminDesk" },
				},
				DestroyIfNotSetup = true,
			},
			-- Ghost Admin Character / Ghost Secretary Character / House Contractor
			[427173] =
			{
				Name = "GhostAdminCharacter",
				EmoteOffsetZ = 125,
				DistanceTrigger =
				{
					WithinDistance = 600,
					Emote = "StatusIconFear",
					TriggerOnceThisRun = true,
				},
			},
			-- Market / Trade/ Exchange / Ghost Broker / Wretched Broker
			[423390] =
			{
				Name = "Market",
				InteractDistance = 150,
				InteractOffsetX = -225,
				InteractOffsetY = -100,
				UseText = "UseMarket",
				-- UseSound = "/Leftovers/World Sounds/CaravanCreak",
				OnUsedFunctionName = "UseMarketObject",
				NoSaleEmote = "StatusIconDisgruntled",
				MadeSaleEmote = "StatusIconSmile",
				EmoteOffsetZ = 100,
				SetupGameStateRequirements =
				{
					RequiredMinCompletedRuns = 4,
				},
				DistanceTriggers =
				{
					{
						WithinDistance = 600,
						Emote = "StatusIconOhBoy",
						TriggerOnceThisRun = true,
					},
					{
						WithinDistance = 100,
						Repeat = true,
						VoiceLines =
						{
							BreakIfPlayed = true,
							RandomRemaining = true,
							CooldownTime = 20,
							UsePlayerSource = true,

							-- Pardon.
							{ Cue = "/VO/ZagreusHome_0663" },
							-- Pardon me!
							{ Cue = "/VO/ZagreusHome_0664" },
							-- Oop my mistake.
							{ Cue = "/VO/ZagreusHome_0665" },
							-- Excuse me.
							{ Cue = "/VO/ZagreusHome_0666" },
							-- Beg your pardon.
							{ Cue = "/VO/ZagreusHome_0667" },
							-- Sorry.
							{ Cue = "/VO/ZagreusHome_0668" },
							-- Sorry!
							{ Cue = "/VO/ZagreusHome_0669" },
							-- My fault.
							{ Cue = "/VO/ZagreusHome_0670" },
						},
					},
				}
			},
			-- Lounge Ambience Generator
			[425014] =
			{
				SetupGameStateRequirements =
				{
					RequiredMinCompletedRuns = 4,
					RequiredFalseFlags = { "InFlashback", },
				},
				DestroyIfNotSetup = true,
			},
			-- Ghost Chef / House Chef
			[423399] =
			{
				Name = "GhostChefCharacter",
				UseText = "Fishing_ChefInteract",
				OnUsedFunctionName = "TurnInFish",
				EmoteOffsetZ = 290,
				AnimOffsetZ = 375,
				SetupFunctions =
				{
					{
						Name = "DisableObjects",
						Args = { Type = "ChefGhost01" },
						GameStateRequirements =
						{
							RequiredFalseFlags = { "InFlashback", },
							RequiredHasNoFish = true,
						},

					},
					{
						Name = "PlayStatusAnimation",
						Args = { Animation = "StatusIconWantsToTalk", },
						GameStateRequirements =
						{
							RequiredFalseFlags = { "InFlashback", },
							RequiredHasFish = true,
						},
					},
				},
				DistanceTriggers =
				{
					{
						WithinDistance = 500,
						Emote = "StatusIconEmbarrassed",
						TriggerOnceThisRun = true,
					},
					{
						WithinDistance = 350,
						Repeat = true,
						VoiceLines =
						{
							BreakIfPlayed = true,
							RandomRemaining = true,
							CooldownTime = 8,
							PlayOnceFromTableThisRun = true,
							UsePlayerSource = true,
							SuccessiveChanceToPlay = 0.33,

							-- What's cooking?
							{ Cue = "/VO/ZagreusHome_1291", RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- Head Chef.
							{ Cue = "/VO/ZagreusHome_1292", RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- Chef.
							{ Cue = "/VO/ZagreusHome_1293", RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- Greetings, Chef.
							{ Cue = "/VO/ZagreusHome_1294" },
							-- What's for breakfast?
							{ Cue = "/VO/ZagreusHome_1295", RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- What's for breakfast? Dinner maybe?
							{ Cue = "/VO/ZagreusHome_1296", RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- Something smells good.
							{ Cue = "/VO/ZagreusHome_1297", RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- How's that knife set working out?
							{ Cue = "/VO/ZagreusHome_1298", RequiredCosmetics = { "Cosmetic_Knives", }, RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- Those spices working out all right?
							{ Cue = "/VO/ZagreusHome_1299", RequiredCosmetics = { "Cosmetic_SpiceRack", }, RequiredPlayed = { "/VO/ZagreusHome_1294" } },
							-- Cooking's one way to pass the time.
							{ Cue = "/VO/ZagreusHome_1300", RequiredPlayed = { "/VO/ZagreusHome_1294" } },
						},
					}
				},
			},

			-- Employee of the Month
			[423452] =
			{
				UseText = "UseEmployeeSign01",
				OnUsedGameStateRequirements =
				{
					-- RequiredFalseFlags = { "InFlashback" },
					RequiredTextLines = { "InspectEmployeeOfTheMonth01" },
				},
				OnUsedFunctionName = "UseEmployeeSign",
				OnUsedFunctionArgs = { },
				DisableIfUnuseable = true,
				InteractDistance = 190,
				InteractOffsetY = 60,
				InteractOffsetX = -150,
			},

			-- DeathArea Cosmetics
			-- Poet Bust
			[425947] =
			{
				UseText = "UsePoetBust01",
				OnUsedFunctionName = "UsePoetBust",
			},

			-- Asphodel Statue
			[426443] =
			{
				UseText = "UseStatue01",
				OnUsedFunctionName = "UseStatue",
			},

			-- Warrior Statue
			[426368] =
			{
				UseText = "UseStatue01",
				OnUsedFunctionName = "UseStatue",
			},

			-- Mechanism
			[426321] =
			{
				UseText = "UseStatue01",
				OnUsedFunctionName = "UseStatue",
			},

			-- Sundial
			-- see ConditionalItemData
			-- Bedroom Door
			[391697] =
			{
				Name = "BedroomDoor",
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", "ZagSpecialEventInProgress", },
				},
				OnUsedFunctionName = "DeathAreaSwitchRoom",
				OnUsedFunctionArgs = { Name = "DeathAreaBedroom", HeroStartPoint = 40009, HeroEndPoint = 40012, },
				InteractDistance = 140,
				AutoActivate = true,
				DistanceTrigger =
				{
					WithinDistance = 500,
					VoiceLines =
					{
						PlayOnce = true,
						RequiredTrueFlags = { "ZagSpecialEventInProgress" },
						TriggerCooldowns =
						{
							{ Name = "ZagreusMiscHouseSpeech", Time = 10 },
						},
						-- No. Can't go this way just yet...
						{ Cue = "/VO/ZagreusHome_3671", Queue = "Always" },
					},
					FunctionName = "HandleAchillesBedroomObjective"
				}
			},
			[391025] =
			{
				SetupGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					AreIdsNotAlive = { 390000 },
				},
				UseText = "UseChair",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				ShakeSelf = true,
				OnUsedGlobalVoiceLines = "TakeASeatVoiceLines",
				InteractDistance = 110,
				InteractOffsetY = 10,
			},
			[210467] =
			{
				SetupGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
				},
				UseText = "UseChair",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				ShakeSelf = true,
				OnUsedGlobalVoiceLines = "TakeASeatVoiceLines",
				InteractDistance = 110,
				InteractOffsetY = 10,
			},
			[210075] =
			{
				UseText = "UseChair",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				ShakeSelf = true,
				OnUsedGlobalVoiceLines = "TakeASeatVoiceLines",
				InteractDistance = 110,
				InteractOffsetY = 10,
			},
			[210353] =
			{
				UseText = "UseChair",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				ShakeSelf = true,
				OnUsedGlobalVoiceLines = "TakeASeatVoiceLines",
				InteractDistance = 110,
				InteractOffsetY = 10,
			},
			-- Hades Throne
			[422028] =
			{
				UseText = "UseChair",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				ShakeSelf = true,
				ShakeIds = { 426236, 422027 },
				OnUsedGlobalVoiceLines = "UsedThroneVoiceLines",
				InteractDistance = 180,
				InteractOffsetY = -50,
				InteractOffsetX = 40,
				SetupGameStateRequirements =
				{
					AreIdsNotAlive = { 370006 },
					RequiredFalseFlags = { "InFlashback" },
				},
			},
			-- Garden Entrance
			[555445] =
			{
				Name = "GardenEntrance",
				DistanceTriggers =
				{
					{
						WithinDistance = 1500,
						VoiceLines =
						{
							{
								PlayOnceFromTableThisRun = true,
								RandomRemaining = true,
								UsePlayerSource = true,
								RequiredTextLines = { "Ending01" },
								Cooldowns =
								{
									{ Name = "ZagreusGardenSpeech", Time = 20 },
								},
								-- The garden's always open now...
								{ Cue = "/VO/ZagreusHome_3723", PlayOnce = true, },
								-- Should check the garden.
								{ Cue = "/VO/ZagreusHome_3722", RequiredAnyQueuedTextLines = GameData.GardenTextLines, ChanceToPlayAgain = 0.66 },
							},
						},
					},
				}
			},
			-- Garden Tree
			[556400] =
			{
				Name = "GardenTree",
				DistanceTriggers =
				{
					{
						WithinDistance = 700,
						VoiceLines =
						{
							PlayOnceFromTableThisRun = true,
							RandomRemaining = true,
							SuccessiveChanceToPlay = 0.25,
							UsePlayerSource = true,
							RequiredTextLines = { "Ending01" },
							Cooldowns =
							{
								{ Name = "ZagreusGardenSpeech", Time = 20 },
							},

							-- <Inhale... Exhale>
							{ Cue = "/VO/ZagreusHome_3607", RequiredPlayed = { "/VO/ZagreusHome_3610" } },
							-- <Deep Breath>
							{ Cue = "/VO/ZagreusHome_3608", RequiredPlayed = { "/VO/ZagreusHome_3610" } },
							-- Can't believe Father kept this place locked up...
							{ Cue = "/VO/ZagreusHome_3609", RequiredPlayed = { "/VO/ZagreusHome_3610" } },
							-- <Sigh> It's nice here...
							{ Cue = "/VO/ZagreusHome_3610" },
							-- Pom trees are coming in nicely.
							{ Cue = "/VO/ZagreusHome_3611", RequiredPlayed = { "/VO/ZagreusHome_3610" } },
							-- Mother's taken good care of this place since she got back.
							{ Cue = "/VO/ZagreusHome_3612", RequiredPlayed = { "/VO/ZagreusHome_3610" } },
							-- Peace and quiet...
							{ Cue = "/VO/ZagreusHome_3613", RequiredPlayed = { "/VO/ZagreusHome_3610" } },
							-- ...I like it here.
							{ Cue = "/VO/ZagreusHome_3614", RequiredPlayed = { "/VO/ZagreusHome_3610" } },
						},
					},
				}
			},
			-- Olympus Statue / Olympus Sculpture / EpilogueReunionQuest
			[556697] =
			{
				Name = "HouseStatueMtOlympus01",
				UseText = "UseShrinePointClear_QuestCleared",
				OnUsedFunctionName = "UseOlympusSculpture",

				SetupGameStateRequirements =
				{
					RequiredTextLines = { "OlympianReunionQuestComplete" },
				},
				Activate = true,
				DistanceTriggers =
				{
					{
						WithinDistance = 1200,
						VoiceLines =
						{
							PlayOnce = true,
							UsePlayerSource = true,
							-- Still can't get over our gift from the Olympians. It's glorious!
							{ Cue = "/VO/ZagreusHome_3688" },
						},
					},
				}
			},
		}
	},

	DeathAreaBedroom =
	{
		ZoomFraction = 1.0,
		SoftClamp = 0.75,

		AmbientMusicParams =
		{
			LowPass = 1.0,
			Vocals = 1.0,
		},
		AmbientMusicVolume = 1.0,
		Ambience = "/Ambience/MusicExploration4Ambience",

		RemoveDashFireFx = true,
		IgnoreStemMixer = true,
		IntroSequenceDuration = 0.5,
		DebugOnly = true,
		LinkedRoom = "RoomOpening",
		NoAutoEquip = true,
		ShowResourceUIOnly = true,
		FullscreenEffectGroup = "Foreground_01",
		SkipWeaponBinkPreLoading = true,
		RichPresence = "#RichPresence_Bedroom",

		LegalEncounters = { "Empty", },

		ReverbValue = 2.0,

		FailedToFireFunctionName = "DeathAreaAttackFailPresentation",

		CheckObjectives = { "MetaPrompt", "BedPrompt" },

		StartUnthreadedEvents =
		{
			{
				FunctionName = "ActivateBedroomConditionalItems",
			},
			-- Meg (Bedroom) / Meg in Bedroom / Bedroom Scenes
			-- variant tbd below for Megaera max relationship
			-- alt ids: { 422142 (m), 422255 (t), }
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredNotActivatedThisRun = 390082,
					RequiredFalseTextLinesThisRun = { "Ending01" },
					RequiredAnyKillsThisRun = { "Harpy", "Harpy2" },
					RequiredTextLines = { "MegaeraGift04" },
					RequiredFalseTextLines = { "MegaeraBedroom01" },
					AreIdsNotAlive = { 422255 },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422142, },
					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.85,
									UsePlayerSource = true,

									-- Um, Meg...?
									{ Cue = "/VO/ZagreusHome_0184" },
								},
								{
									PreLineWait = 0.35,
									BreakIfPlayed = true,
									PostLineWait = 0.65,

									-- Hmm.
									{ Cue = "/VO/MegaeraHome_0061" },
								},
							},
							TextLineSet =
							{
								MegaeraBedroom01 =
								{
									-- requirements are above
									{ Cue = "/VO/ZagreusHome_0754", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
										AngleHeroTowardSource = true,
										Text = "Meg. {#DialogueItalicFormat}Oh{#PreviousFormat}. I was not expecting company. Were you, just, casually snooping, or... is there something I can help you with?" },
									{ Cue = "/VO/MegaeraHome_0010",
										PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, TeleportToId = 421563 },
										PortraitExitAnimation = "Portrait_FurySister01_Standoffish_01_Exit",
										PreLineWait = 0.35,
										PreLineAnim = "FuryIdleInHouseFidgetGreeting",
										Text = "...I was just leaving, Zagreus. Happened to be in the area, no thanks to you, and thought I'd go retrieve the last of my possessions. I have to say, you've really let this place go to hell." },
									{ Cue = "/VO/ZagreusHome_0755", PreLineWait = 1.85, Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
										Text = "...She left. Great. Wonderful! I guess we'll just go back to killing each other repeatedly, then." },
								},
							},
						},
					},
				},
			},

			-- Meg (Bedroom) / Meg in Bedroom / Bedroom Scenes
			-- variant below for if you've cleared the game already
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredNotActivatedThisRun = 390082,
					-- RequiredAnyKillsThisRun = { "Harpy", "Harpy2" },
					RequiredTextLines = { "Fury2FirstAppearance", "Fury3FirstAppearance" },
					RequiredAnyTextLines = { "MegaeraBuildingTrust01", "MegaeraBuildingTrust01_B" },
					RequiredFalseTextLinesThisRun = { "Ending01" },
					RequiredFalseTextLinesLastRun = { "MegaeraBuildingTrust01", "MegaeraBuildingTrust01_B" },
					RequiredFalseTextLines = { "MegaeraBedroom02", "MegaeraBedroom02B" },
					RequiredRunsCleared = 0,
					AreIdsNotAlive = { 422255 },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422142, },
					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.85,
									UsePlayerSource = true,

									-- ...Oh.
									{ Cue = "/VO/ZagreusHome_0818" },
								},
								{
									PreLineWait = 0.35,
									BreakIfPlayed = true,
									PostLineWait = 0.65,

									-- Zagreus.
									{ Cue = "/VO/MegaeraHome_0058" },
								},
							},
							TextLineSet =
							{
								MegaeraBedroom02 =
								{
									-- requirements are above
									{ Cue = "/VO/ZagreusHome_0759", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
										AngleHeroTowardSource = true,
										Text = "Forget another something in my bedchambers, there, Meg?" },
									{ Cue = "/VO/MegaeraHome_0090",
										Text = "No. We need to talk, again. My sisters are involved now, in all this. You've really stirred up quite a mess." },
									{ Cue = "/VO/ZagreusHome_0760", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
										Text = "I'm sorry. My mother's out there, somewhere. I won't rest until I can find her. You wouldn't understand." },
									{ Cue = "/VO/MegaeraHome_0091",
										Text = "You wouldn't know. What I'm trying to say is... with my sisters involved, it changes things. Takes some of the pressure off of me." },
									{ Cue = "/VO/ZagreusHome_0761", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
										Text = "What are you saying?" },
									{ Cue = "/VO/MegaeraHome_0092",	PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, TeleportToId = 421563 },
										PortraitExitAnimation = "Portrait_FurySister01_Standoffish_01_Exit",
										Text = "I'm saying... I know you need to find your mother, Zagreus. I have my part to play in all of this, but let me see what I can do, if anything." },
									{ Cue = "/VO/ZagreusHome_1354", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
										Text = "Meg...! She... {#DialogueItalicFormat}ah{#PreviousFormat}." },
								},
							},
						},
					},
				},
			},

			-- Meg (Bedroom) / Meg in Bedroom / Bedroom Scenes
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredNotActivatedThisRun = 390082,
					-- RequiredAnyKillsThisRun = { "Harpy", "Harpy2" },
					RequiredTextLines = { "Fury2FirstAppearance", "Fury3FirstAppearance" },
					RequiredAnyTextLines = { "MegaeraBuildingTrust01", "MegaeraBuildingTrust01_B" },
					RequiredFalseTextLines = { "MegaeraBedroom02", "MegaeraBedroom02B" },
					RequiredFalseTextLinesThisRun = { "Ending01" },
					RequiredMinRunsCleared = 1,
					RequiredFalseTextLinesLastRun = { "MegaeraBuildingTrust01", "MegaeraBuildingTrust01_B" },
					AreIdsNotAlive = { 422255 },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422142, },
					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.85,
									UsePlayerSource = true,

									-- ...Oh.
									{ Cue = "/VO/ZagreusHome_0818" },
								},
								{
									PreLineWait = 0.35,
									BreakIfPlayed = true,
									PostLineWait = 0.65,

									-- Zagreus.
									{ Cue = "/VO/MegaeraHome_0058" },
								},
							},
							TextLineSet =
							{
								MegaeraBedroom02B =
								{
									-- requirements are above
									{ Cue = "/VO/ZagreusHome_0759", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
										AngleHeroTowardSource = true,
										Text = "Forget another something in my bedchambers, there, Meg?" },
									{ Cue = "/VO/MegaeraHome_0090",
										Text = "No. We need to talk, again. My sisters are involved now, in all this. You've really stirred up quite a mess." },
									{ Cue = "/VO/ZagreusHome_1495", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
										Text = "I know. I'm sorry. But this is something that I have to do. You wouldn't understand." },
									{ Cue = "/VO/MegaeraHome_0091",
										Text = "You wouldn't know. What I'm trying to say is... with my sisters involved, it changes things. Takes some of the pressure off of me." },
									{ Cue = "/VO/ZagreusHome_1353", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
										Text = "Some of the pressure... wait, what are you going to do?" },
									{ Cue = "/VO/MegaeraHome_0139",	PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, TeleportToId = 421563 },
										PortraitExitAnimation = "Portrait_FurySister01_Standoffish_01_Exit",
										Text = "I'm saying... I know you're doing what you have to do, here, Zagreus. And, my sisters and I will always try to stop you. But I am only doing it because I have to. Understand?" },
									{ Cue = "/VO/ZagreusHome_1354", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
										Text = "Meg...! She... {#DialogueItalicFormat}ah{#PreviousFormat}." },
								},
							},
						},
					},
				},
			},

			-- Meg (Bedroom) / Meg in Bedroom / Bedroom Scenes / Meg Relationship / max relationship
			-- variant tbd below for Thanatos max relationship
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredNotActivatedThisRun = 390082,
					-- RequiredAnyKillsThisRun = { "Harpy", "Harpy2" },
					RequiredTextLines = { "MegaeraGift10" },
					RequiredFalseTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B", "BecameCloseWithThanatos01Than_GoToHim" },
					AreIdsNotAlive = { 422255 },
					RequiredFalseTextLinesThisRun = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B", "BecameCloseWithDusa01", "Ending01" },
					RequiredFalseSeenRoomThisRun = "A_Boss01",
					RequiredFalseQueuedTextLines = { "BecameCloseWithDusa01", "ThanatosHomeIntermissionChat01", "ThanatosHomeIntermissionChat02", "ThanatosHomeIntermissionChat03", "ThanatosHomeIntermissionChat04", "ThanatosHomeIntermissionChat05", "ThanatosHomeIntermissionChat06" },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422142, },
					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.75,
									BreakIfPlayed = true,
									PostLineWait = 0.15,
									ObjectType = "NPC_FurySister_01",

									-- Come here.
									{ Cue = "/VO/MegaeraHome_0195" },
								},

							},
							TextLineSet =
							{
								BecameCloseWithMegaera01 =
								{
									EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
									-- requirements are above
									{ Cue = "/VO/ZagreusHome_1370", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
										AngleHeroTowardSource = true,
										AngleTowardTargetId = 390058,
										-- Emote = "PortraitEmoteSurprise",
										Text = "Meg... what a surprise. Again. What is it? ...What's the matter? Wait. Why are you looking at me like that?" },

									{ Cue = "/VO/MegaeraHome_0152",
										PreLineAnim = "FuryIdleInHouseFidgetWhipTaunt_Start",
										Text = "Zagreus, would you shut up already with your idiotic questions, and get over here? Right now." },

									{ Cue = "/VO/ZagreusHome_1371", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
										PortraitExitAnimation = "Portrait_Zag_Empathetic_01_Exit",
										PreLineWait = 0.35,
										Emote = "PortraitEmoteSurprise",
										Text = "...I... you really... oh..." },

									{ Text = "Megaera_ChoiceText01",
										Choices =
										{
											{
												ChoiceText = "Meg_GoToHer",
												{ Cue = "/VO/ZagreusHome_2804", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PostLineAnim = "FuryIdleInHouseFidgetWhipTaunt_ReturnToIdle",
													PreLineThreadedFunctionName = "BedroomIntermissionApproach",
													PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
													PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
													PostLineFunctionArgs = { ExtraWaitTime = 1.2 },
													PreLineWait = 0.35,
													Text = "...I thought you'd never ask. But I'm glad you did." },
												-- intermission
												{ Cue = "/VO/ZagreusHome_1372", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
													FadeOutTime = 0.5, FadeOutSound = "/Leftovers/World Sounds/MapText", FullFadeTime = 9.5,
													FadeInTime = 2.5, FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
													PreLineWait = 0.4,
													InterSceneWaitTime = 0.5,
													AngleTowardHero = true,	TeleportHeroToId = 422138,
													TeleportHeroOffsetX = 100, TeleportHeroOffsetY = 170,
													AngleHeroTowardSource = true,
													Text = "Um, Meg, I... what I'm trying to say is, are you... are we good, or...?" },

												{ Cue = "/VO/MegaeraHome_0153", Portrait = "Portrait_FurySister01_Pleased_01",
													PreLineAnim = "FuryIdleInHouseFidgetGreeting",
													Text = "Stop being insecure around me, Zag. You should know better than that by now. Though, yes, if you must know... I think we're good. But if you tell another living soul, or even a dead one, I will kill you, understand?" },

												{ Cue = "/VO/ZagreusHome_1373", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
													Text = "I... loud and clear, Meg, yes, I understand. So then... what happens now?" },

												{ Cue = "/VO/MegaeraHome_0154", Portrait = "Portrait_FurySister01_Pleased_01",
													Text = "What happens now? I'll see you at the edge of Tartarus, I guess. Or maybe here. However long we keep this up." },

												{ Cue = "/VO/ZagreusHome_1374", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
													Text = "However long we keep this up?" },

												{ Cue = "/VO/MegaeraHome_0155", Portrait = "Portrait_FurySister01_Standoffish_01",
													PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, TeleportToId = 421563 },
													PortraitExitAnimation = "Portrait_FurySister01_Standoffish_01_Exit",
													Text = "You ask too many questions, Zag. I don't have the answers, and besides: You know more about living in the moment than I do. See you around." },

												{ Cue = "/VO/ZagreusHome_1375", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathy_Return", PreLineAnimTarget = "Hero",
													PreLineWait = 0.35,
													Text = "...See you around! ...Yes." },
											},
											{
												ChoiceText = "Meg_BackOff",
												{ Cue = "/VO/ZagreusHome_1521", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineAnim = "FuryIdleInHouseFidgetWhipTaunt_ReturnToIdle",
													PreLineWait = 0.35,
													Text = "...I... Meg, I'm deeply flattered, and you're very dear to me, it's just... this isn't what I want from our relationship. I fear I must have led you on. Forgive me. Please say you'll still be my friend?" },
												{ Cue = "/VO/MegaeraHome_0390", Portrait = "Portrait_FurySister01_Pleased_01",
													PortraitExitAnimation = "Portrait_FurySister01_Pleased_01_Exit", PreLineWait = 0.8,
													PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, TeleportToId = 421563 },
													Text = "...That's all you really want...? To be my friend? {#DialogueItalicFormat}Heh. {#PreviousFormat}You're hard to figure out sometimes, Zag. But, you know what, we've tried a lot of things. Why don't we try it like you said? I'll see you out there, then." },
											},
										},
									},
								},
							},
						},
					},
				},
			},

			-- Meg (Bedroom) / Meg in Bedroom / Bedroom Scenes / Meg Relationship / max relationship
			-- Re: Thanatos variant
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredNotActivatedThisRun = 390082,
					-- RequiredAnyKillsThisRun = { "Harpy", "Harpy2" },
					RequiredTextLines = { "MegaeraGift10", "BecameCloseWithThanatos01Than_GoToHim" },
					RequiredFalseTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
					AreIdsNotAlive = { 422255 },
					RequiredFalseTextLinesThisRun = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B", "BecameCloseWithDusa01", "Ending01" },
					RequiredFalseTextLinesLastRun = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
					RequiredFalseSeenRoomThisRun = "A_Boss01",
					RequiredFalseQueuedTextLines = { "BecameCloseWithDusa01", "ThanatosHomeIntermissionChat01", "ThanatosHomeIntermissionChat02", "ThanatosHomeIntermissionChat03", "ThanatosHomeIntermissionChat04", "ThanatosHomeIntermissionChat05", "ThanatosHomeIntermissionChat06" },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422142, },
					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.65,
									BreakIfPlayed = true,
									PostLineWait = 0.15,
									ObjectType = "NPC_FurySister_01",

									-- I need to trouble you for something, Zag.
									{ Cue = "/VO/MegaeraHome_0344" },
								},

							},
							TextLineSet =
							{
								BecameCloseWithMegaera01_B =
								{
									EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
									-- requirements are above
									{ Cue = "/VO/ZagreusHome_1370", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
										AngleHeroTowardSource = true,
										AngleTowardTargetId = 390058,
										-- Emote = "PortraitEmoteSurprise",
										Text = "Meg... what a surprise. Again. What is it? ...What's the matter? Wait. Why are you looking at me like that?" },

									{ Cue = "/VO/MegaeraHome_0156",
										PreLineAnim = "FuryIdleInHouseFidgetWhipTaunt_Start",
										Text = "Shut up already, Zagreus. And come here." },

									{ Cue = "/VO/ZagreusHome_1371", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
										PortraitExitAnimation = "Portrait_Zag_Empathetic_01_Exit",
										PreLineWait = 0.35,
										Emote = "PortraitEmoteSurprise",
										Text = "...I... you really... oh..." },

									{ Text = "Megaera_ChoiceText02",
										Choices =
										{
											{
												ChoiceText = "Meg_GoToHer",
												{ Cue = "/VO/ZagreusHome_2804", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PostLineAnim = "FuryIdleInHouseFidgetWhipTaunt_ReturnToIdle",
													PreLineThreadedFunctionName = "BedroomIntermissionApproach",
													PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
													PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
													PostLineFunctionArgs = { ExtraWaitTime = 1.2 },
													PreLineWait = 0.35,
													Text = "...I thought you'd never ask. But I'm glad you did." },
												-- intermission
												{ Cue = "/VO/ZagreusHome_1372", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
													FadeOutTime = 0.5, FadeOutSound = "/Leftovers/World Sounds/MapText", FullFadeTime = 9.5,
													FadeInTime = 2.5, FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
													PreLineWait = 0.4,
													InterSceneWaitTime = 0.5,
													AngleTowardHero = true,	TeleportHeroToId = 422138,
													TeleportHeroOffsetX = 100, TeleportHeroOffsetY = 170,
													AngleHeroTowardSource = true,
													Text = "Um, Meg, I... what I'm trying to say is, are you... are we good, or...?" },

												{ Cue = "/VO/MegaeraHome_0157", Portrait = "Portrait_FurySister01_Pleased_01",
													PreLineAnim = "FuryIdleInHouseFidgetGreeting",
													Text = "You ask too many questions, Zag. But yes, I'd say we are again, for now. But if you tell another soul, I'll kill you, understand?" },

												{ Cue = "/VO/ZagreusHome_1376", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
													Text = "But... no, wait... not even Than...?" },

												{ Cue = "/VO/MegaeraHome_0158", Portrait = "Portrait_FurySister01_Pleased_01",
													Text = "Than's not an idiot. He wants what's best for you. And he isn't the jealous type. Besides, I have a good working relationship with him, as you well know." },

												{ Cue = "/VO/ZagreusHome_1377", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
													Text = "Yeah, but... what about you, you're the punisher of jealousy. What if I..." },

												{ Cue = "/VO/MegaeraHome_0159", Portrait = "Portrait_FurySister01_Pleased_01",
													PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, TeleportToId = 421563 },
													PortraitExitAnimation = "Portrait_FurySister01_Pleased_01_Exit",
													Text = "We're not mere mortals, Zag. Mortals cling to one another viciously because their lives are short. What do we care? If Nyx has taught me one thing, it's that the heart has no bounds. Now quit your worrying, and get prepared for when we meet again out there. See you around." },

												{ Cue = "/VO/ZagreusHome_1375", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathy_Return", PreLineAnimTarget = "Hero",
													PreLineWait = 0.35,
													Text = "...See you around! ...Yes." },
											},
											{
												ChoiceText = "Meg_BackOff",
												{ Cue = "/VO/ZagreusHome_1521", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineAnim = "FuryIdleInHouseFidgetWhipTaunt_ReturnToIdle",
													PreLineWait = 0.35,
													Text = "...I... Meg, I'm deeply flattered, and you're very dear to me, it's just... this isn't what I want from our relationship. I fear I must have led you on. Forgive me. Please say you'll still be my friend?" },
												{ Cue = "/VO/MegaeraExtra_0001", Portrait = "Portrait_FurySister01_Pleased_01",
													PortraitExitAnimation = "Portrait_FurySister01_Pleased_01_Exit", PreLineWait = 0.8,
													PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, TeleportToId = 421563 },
													Text = "...You're sure? Look, I... it's totally all right. I'll see you out there, then." },
											},
										},
									},
								},
							},
						},
					},
				},
			},

			-- Thanatos (Bedroom) / Thanatos in Bedroom / Bedroom Scenes / Thanatos Relationship / max relationship
			-- variant tbd below for Megaera max relationship
			-- alt ids: { 422142 (m), 422255 (t), }
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredNotActivatedThisRun = 423052,
					RequiredTextLines = { "ThanatosFieldAboutRelationship01", "ThanatosGift10" },
					RequiredFalseTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B", "BecameCloseWithMegaera01Meg_GoToHer" },
					AreIdsNotAlive = { 422142 },
					RequiredFalseTextLinesThisRun = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B", "BecameCloseWithDusa01", "Ending01" },
					RequiredFalseQueuedTextLines = { "BecameCloseWithDusa01", "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422255, },

					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.55,
									BreakIfPlayed = true,
									ObjectType = "NPC_Thanatos_01",

									-- I need to ask something of you.
									{ Cue = "/VO/Thanatos_0534" },
								},

							},
							TextLineSet =
							{
								BecameCloseWithThanatos01 =
								{
									EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
									-- requirements are above
									{ Cue = "/VO/ZagreusHome_1476", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
										-- Emote = "PortraitEmoteSurprise",
										Text = "Thanatos...! I'd ask you to come in, but... you're already here. It's really good to see you." },

									{ Cue = "/VO/Thanatos_0417",
										AngleTowardHero = true,
										Text = "Just tell me one thing, Zagreus. Did you really mean what you told me before, that... maybe we ought to... take our time?" },

									{ Text = "Thanatos_ChoiceText01",
										PortraitExitAnimation = "Portrait_Thanatos_Default_01_Exit",
										Choices =
										{
											{
												ChoiceText = "Than_GoToHim",
												{ Cue = "/VO/ZagreusHome_1477", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineThreadedFunctionName = "BedroomIntermissionApproach",
													PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
													Text = "I just... don't mean to push you, Than. I know all this is kind of a lot. And I wanted you to know... this isn't some impulsive thing for me. I'll wait for you however long it takes." },

												{ Cue = "/VO/Thanatos_0418",
													AngleTowardHero = true,
													PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
													Text = "{#DialogueItalicFormat}Khh! {#PreviousFormat}You have no concept of which impulses to act upon, and which to keep in check. You say you'll wait, well, let me ask you this: What are you waiting for? What are you waiting for, I'm here, already. Right...?" },

												{ Cue = "/VO/ZagreusHome_1478", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineThreadedFunctionName = "StopScriptedMove",
													PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
													PreLineAnim = "ZagreusInteractionComeHither_Start", PreLineAnimTarget = "Hero",
													PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
													PostLineFunctionArgs = { ExtraWaitTime = 1.2, Partner = "Thanatos" },
													Text = "Than...! {#DialogueItalicFormat}Hahaha{#PreviousFormat}, oh, you're right!" },

												-- intermission
												{ Cue = "/VO/ZagreusHome_1479", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
													FadeOutTime = 0.5, FadeOutSound = "/Leftovers/World Sounds/MapText", FullFadeTime = 9.5,
													FadeInTime = 2.5, FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
													PreLineWait = 0.4,
													InterSceneWaitTime = 0.5,
													AngleTowardHero = true,	TeleportHeroToId = 422138,
													TeleportHeroOffsetX = 100, TeleportHeroOffsetY = 170,
													AngleHeroTowardSource = true,
													Text = "Hey, Than, look... speak up, already, I don't like it when you're quiet for too long, what's on your mind?" },

												{ Cue = "/VO/Thanatos_0419", Portrait = "Portrait_Thanatos_Pleased_01",
													Text = "A lot of things. And you will have to grow to like it, Zag. Or, what I mean is... don't take my silence the wrong way, all right? I'd better get going, though, I'm way behind on work, but... see you again. If that's all right." },

												{ Cue = "/VO/ZagreusHome_1480", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PostLineThreadedFunctionName = "ThanatosExit", PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
													Text = "It is. It is." },
											},
											{
												ChoiceText = "Than_BackOff",
												{ Cue = "/VO/ZagreusHome_1520", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero", PreLineWait = 0.8,
													Text = "...I did. Sometimes I need to slow things down. I'm thankful that we've been on better terms, lately. But, I've been coming on too strong. Forgive me. You're my dear friend. I don't want to do anything to hurt you. Or anybody else." },
												{ Cue = "/VO/Thanatos_0627", Portrait = "Portrait_Thanatos_Pleased_01",
													PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit", PreLineWait = 0.5,
													PostLineThreadedFunctionName = "ThanatosExit", PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
													Text = "I... oh. I see. I understand. You're my dear friend, as well. Though we have done an awful lot to jeopardize that lately, haven't we? Look, take care, Zag. Be seeing you." },
												{ Cue = "/VO/ZagreusHome_2531", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineWait = 0.8,
													Text = "...Be seeing you, too." },
											},
										},
									},
								},
							},
						},
					},
				},
			},

			-- Thanatos (Bedroom) / Thanatos in Bedroom / Bedroom Scenes / Thanatos Relationship / max relationship
			-- Re: Meg Variant
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredNotActivatedThisRun = 423052,
					RequiredTextLines = { "ThanatosFieldAboutRelationship01", "ThanatosGift10", "BecameCloseWithMegaera01Meg_GoToHer" },
					RequiredFalseTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B", },
					AreIdsNotAlive = { 422142 },
					RequiredFalseTextLinesThisRun = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B", "BecameCloseWithDusa01", "Ending01" },
					RequiredFalseTextLinesLastRun = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
					RequiredFalseQueuedTextLines = { "BecameCloseWithDusa01", "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422255, },

					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.55,
									BreakIfPlayed = true,
									ObjectType = "NPC_Thanatos_01",

									-- I need to ask something of you.
									{ Cue = "/VO/Thanatos_0534" },
								},

							},
							TextLineSet =
							{
								BecameCloseWithThanatos01_B =
								{
									EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
									-- requirements are above
									{ Cue = "/VO/ZagreusHome_1476", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
										-- Emote = "PortraitEmoteSurprise",
										Text = "Thanatos...! I'd ask you to come in, but... you're already here. It's really good to see you." },

									{ Cue = "/VO/Thanatos_0417",
										AngleTowardHero = true,
										Text = "Just tell me one thing, Zagreus. Did you really mean what you told me before, that... maybe we ought to... take our time?" },

									{ Text = "Thanatos_ChoiceText02",
										PortraitExitAnimation = "Portrait_Thanatos_Default_01_Exit",
										Choices =
										{
											{
												ChoiceText = "Than_GoToHim",
												{ Cue = "/VO/ZagreusHome_1477", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineThreadedFunctionName = "BedroomIntermissionApproach",
													PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
													Text = "I just... don't mean to push you, Than. I know all this is kind of a lot. And I wanted you to know... this isn't some impulsive thing for me. I'll wait for you however long it takes." },

												{ Cue = "/VO/Thanatos_0418",
													AngleTowardHero = true,
													PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
													Text = "{#DialogueItalicFormat}Khh! {#PreviousFormat}You have no concept of which impulses to act upon, and which to keep in check. You say you'll wait, well, let me ask you this: What are you waiting for? What are you waiting for, I'm here, already. Right...?" },

												{ Cue = "/VO/ZagreusHome_1481", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													Text = "Than... {#DialogueItalicFormat}hahaha{#PreviousFormat}, I'm so glad! It's just... you know that Megaera has been here, too...?" },

												{ Cue = "/VO/Thanatos_0420", Portrait = "Portrait_Thanatos_Pleased_01",
													Text = "{#DialogueItalicFormat}Tsch. {#PreviousFormat}I've known Megaera much longer than you. Who do you think talked me into this?" },

												{ Cue = "/VO/ZagreusHome_1482", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineThreadedFunctionName = "StopScriptedMove",
													PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
													PreLineAnim = "ZagreusInteractionComeHither_Start", PreLineAnimTarget = "Hero",
													PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
													PostLineFunctionArgs = { ExtraWaitTime = 1.2, Partner = "Thanatos" },
													Text = "Hah! She did, did she? That's good! That's good." },

												-- intermission
												{ Cue = "/VO/ZagreusHome_1479", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
													FadeOutTime = 0.5, FadeOutSound = "/Leftovers/World Sounds/MapText", FullFadeTime = 9.5,
													FadeInTime = 2.5, FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
													PreLineWait = 0.4,
													InterSceneWaitTime = 0.5,
													AngleTowardHero = true,	TeleportHeroToId = 422138,
													TeleportHeroOffsetX = 100, TeleportHeroOffsetY = 170,
													AngleHeroTowardSource = true,
													Text = "Hey, Than, look... speak up, already, I don't like it when you're quiet for too long, what's on your mind?" },

												{ Cue = "/VO/Thanatos_0419", Portrait = "Portrait_Thanatos_Pleased_01",
													Text = "A lot of things. And you will have to grow to like it, Zag. Or, what I mean is... don't take my silence the wrong way, all right? I'd better get going, though, I'm way behind on work, but... see you again. If that's all right." },

												{ Cue = "/VO/ZagreusHome_1480", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PostLineThreadedFunctionName = "ThanatosExit", PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
													Text = "It is. It is." },
											},
											{
												ChoiceText = "Than_BackOff",
												{ Cue = "/VO/ZagreusHome_1520", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero", PreLineWait = 0.8,
													Text = "...I did. Sometimes I need to slow things down. I'm thankful that we've been on better terms, lately. But, I've been coming on too strong. Forgive me. You're my dear friend. I don't want to do anything to hurt you. Or anybody else." },

												{ Cue = "/VO/ThanatosExtra_0001", Portrait = "Portrait_Thanatos_Pleased_01",
													PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit", PreLineWait = 0.5,
													PostLineThreadedFunctionName = "ThanatosExit", PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
													Text = "You're certain? Well... I understand. I'd best get back to my responsibilities for now." },

												{ Cue = "/VO/ZagreusHome_0822", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PreLineWait = 0.8,
													Text = "...See you, Than." },
											},
										},
									},
								},
							},
						},
					},
				},
			},

			-- Meg + Thanatos (Bedroom) / max relationship
			{
				FunctionName = "ActivatePrePlacedUnits",
				-- mirrored below
				GameStateRequirements =
				{
					RequiredFalseTextLines = { "MegaeraWithThanatosBedroom01" },
					RequiredAnyEncountersThisRun = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro", },
					RequiredIdsNotActivatedThisRun = { 423052, 390082 },
					RequiredTextLines = { "ThanatosAboutMegaera02" },
					RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
					RequiredAnyOtherTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim", },
					RequiredFalseTextLinesThisRun = { "Ending01" },
					MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 8 },
				},
				Args =
				{
					Ids = { 422255 },
					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SetupNPCPresentation",
						Args =
						{
							OffsetX = 150,
							OffsetY = 130,
						},
					}
				},
			},
			{
				FunctionName = "ActivatePrePlacedUnits",
				GameStateRequirements =
				{
					RequiredFalseTextLines = { "MegaeraWithThanatosBedroom01" },
					RequiredAnyEncountersThisRun = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro", },
					RequiredIdsNotActivatedThisRun = { 423052, 390082 },
					RequiredTextLines = { "ThanatosAboutMegaera02" },
					RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
					RequiredAnyOtherTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim", },
					RequiredFalseTextLinesThisRun = { "Ending01" },
					MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 8 },
				},
				BreakIfPlayed = true,
				Args =
				{
					Ids = { 422142 },

					DistanceTrigger =
					{
						WithinDistance = 1000,
						FunctionName = "SurpriseNPCPresentation",
						Args =
						{
							-- ActivateIds = { },
							VoiceLines =
							{
								Queue = "Interrupt",
								{
									PreLineWait = 0.5,
									UsePlayerSource = true,

									-- Hoh...
									{ Cue = "/VO/ZagreusField_0287" },
								},
								{
									PreLineWait = 0.35,
									ObjectType = "NPC_Thanatos_01",
									PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",

									-- Hey Zag.
									{ Cue = "/VO/Thanatos_0426" },
								},
								{
									PreLineWait = 0.05,
									ObjectType = "NPC_FurySister_01",
									PreLineAnim = "FuryIdleInHouseFidgetWhipTaunt_Start",

									-- <Laughter>
									{ Cue = "/VO/MegaeraHome_0227",  },
								},
								{
									PreLineWait = 0.2,
									PostLineWait = 2.0,
									UsePlayerSource = true,

									-- Hi you two.
									{ Cue = "/VO/ZagreusField_2596" },
								},
							},
							TextLineSet =
							{
								MegaeraWithThanatosBedroom01 =
								{
									EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
									-- requirements are above

									{ Cue = "/VO/MegaeraHome_0352",
										Portrait = "Portrait_FurySister01_Pleased_01",
										Text = "Zagreus, you don't have any doors. Why are you always so surprised?" },

									{ Cue = "/VO/ZagreusHome_1517", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
										PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
										PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
										-- Emote = "PortraitEmoteSurprise",
										Text = "{#DialogueItalicFormat}Erm{#PreviousFormat}, Meg, Than, what... what are you two... what's going on? Whatever it is, I can explain, or... wait, you're both smiling. Oh... let me just... take this in a moment here." },

									{ Cue = "/VO/MegaeraHome_0353",
										Portrait = "Portrait_FurySister01_Pleased_01",
										Text = "You give Thanatos and me too little credit, Zag. We've known each other longer than you've been alive." },

									{ Cue = "/VO/Thanatos_0424",
										PreLineAnim = "FuryIdleInHouseFidgetWhipTaunt_ReturnToIdle",
										Portrait = "Portrait_Thanatos_Pleased_01",
										Speaker = "NPC_Thanatos_01",
										Text = "I'd say we know quite a bit by now, all things considered. Isn't that right, Megaera?" },

									{ Cue = "/VO/MegaeraHome_0187",
										PreLineAnim = "FuryIdleInHouseFidgetGreeting",
										Portrait = "Portrait_FurySister01_Pleased_01",
										Text = "Can't you see we're off duty right now, Zagreus?" },

									{ Text = "MegaeraWithThanatos_ChoiceText01",
										Portrait = "Portrait_FurySister01_Pleased_01",
										PortraitExitAnimation = "Portrait_FurySister01_Pleased_01_Exit",
										Choices =
										{
											{
												ChoiceText = "MegThan_GoToThem",
												{ Cue = "/VO/ZagreusHome_1518", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
													PreLineThreadedFunctionName = "BedroomIntermissionApproach",
													PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
													PostLineFunctionArgs = { ExtraWaitTime = 0.8, Partner = "MegThan" },
													PreLineWait = 0.8,
													Text = "{#DialogueItalicFormat}Hah{#PreviousFormat}! Well then... if this turns out to be some sort of dream, I will be very, very mad. Though... I guess there's one good way to find out." },

												-- intermission
												{ Cue = "/VO/ZagreusHome_1519", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
													FadeOutTime = 0.5, FadeOutSound = "/Leftovers/World Sounds/MapText", FullFadeTime = 12.8,
													FadeInTime = 2.5, FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
													PreLineWait = 0.4,
													InterSceneWaitTime = 0.5,
													AngleTowardHero = true,	TeleportHeroToId = 422138,
													TeleportHeroOffsetX = -100, TeleportHeroOffsetY = 170,
													AngleHeroTowardSource = true,
													Text = "Whew, well, now, um, where was I..." },
												{ Cue = "/VO/MegaeraHome_0354", Portrait = "Portrait_FurySister01_Pleased_01",
													PreLineAnim = "FuryIdleInHouseFidgetGreeting",
													PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, AltObjectId = 422255, TeleportToId = 421563, UseThanatosExitSound = true, FullFadeTime = 3.0, },
													PortraitExitAnimation = "Portrait_FurySister01_Pleased_01_Exit",
													Text = "Well! I think we've reached an understanding here. I should be off. Until the next one, Zag. And Thanatos." },
												{ Cue = "/VO/ZagreusHome_1523", PreLineWait = 1.0, Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
													Text = "Whew, well, that was... that was... {#DialogueItalicFormat}ahem{#PreviousFormat}." },
											},
											{
												ChoiceText = "MegThan_BackOff",
												{ Cue = "/VO/ZagreusHome_3118", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
													PreLineWait = 0.8,
													PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
													PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
													Text = "...Hey... look. I care about you. Both of you. A lot. I'm happy we're this close... you're this close, rather than being at each other's throats like before. But, I think it's all a little much for me, right now." },
												{ Cue = "/VO/MegaeraHome_0392", Portrait = "Portrait_FurySister01_Pleased_01",
													PortraitExitAnimation = "Portrait_FurySister01_Pleased_01_Exit", PreLineWait = 0.8,
													Text = "...You're sure? Look... it's totally all right. You've got enough pressure on you as it is. We'll see you out there, then." },
												{ Cue = "/VO/Thanatos_0480",
													Portrait = "Portrait_Thanatos_Pleased_01",
													PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
													Speaker = "NPC_Thanatos_01",
													PreLineWait = 0.4,
													PostLineFunctionName = "ExitNPCPresentation", PostLineFunctionArgs = { ObjectId = 422142, AltObjectId = 422255, TeleportToId = 421563, UseThanatosExitSound = true, FullFadeTime = 3.3, },
													Text = "Catch up with you some other time, all right?" },
											},
										}
									},

								},

							},
						},
					},
				},
			},

		},
		UnthreadedEvents =
		{
			{
				FunctionName = "RemoveLastAwardTrait",
				Args = {},
			},
			{
				FunctionName = "UnequipWeaponUpgrade",
				Args = {},
			},
			{
				FunctionName = "RemoveLastAssistTrait",
				Args = {},
			},
			{
				FunctionName = "DisableWeapons",
				Args = {},
			},
		},
		ObstacleData =
		{
			[420897] =
			{
				OnUsedFunctionName = "DeathAreaSwitchRoom",
				OnUsedFunctionArgs = { Name = "RoomPreRun", HeroStartPoint = 40009, HeroEndPoint = 40012, CheckBinkSetChange = true, },
				InteractDistance = 150,
				AutoActivate = true,
			},
			[420896] =
			{
				OnUsedFunctionName = "DeathAreaSwitchRoom",
				OnUsedFunctionArgs = { Name = "DeathArea", HeroStartPoint = 390004, HeroEndPoint = 390002, CheckBinkSetChange = true },
				InteractDistance = 100,
				AutoActivate = true,
			},

			-- DeathAreaBedroom Cosmetics
			-- Scrying Pool
			[390197] =
			{
				Name = "HouseWaterBowl01",
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "HouseWaterBowl01", },
				},
				UseText = "UseExamineMisc",
				OnUsedFunctionName = "UseWaterBowl",
			},
			-- Lyre
			[426208] =
			{
				Name = "HouseLyre01",
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "HouseLyre01", },
				},
				InteractDistance = 130,
				InteractOffsetX = 20,
				InteractOffsetY = -70,
				UseText = "UseLute01",
				OnUsedFunctionName = "UseLyre",
			},
			-- Gaming Table
			[426222] =
			{
				Name = "HouseGamingTable01",
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "HouseGamingTable01", },
				},
				InteractDistance = 150,
				InteractOffsetX = 0,
				InteractOffsetY = -50,
				UseText = "UseGamingTable01",
				OnUsedFunctionName = "UseGamingTable",
			},
			-- Barbell / Weights
			[426209] =
			{
				Name = "HouseWeights01",
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "HouseWeights01", },
				},
				InteractDistance = 150,
				UseText = "UseWeights01",
				OnUsedFunctionName = "UseBarbell",
			},
			-- Bedroom Couch
			[422261] =
			{
				Name = "HouseCouch02A",
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "HouseCouch02A", },
				},
				InteractDistance = 150,
				UseText = "UseBed",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				ShakeSelf = true,
				OnUsedGlobalVoiceLines = "TakeANapVoiceLines",
			},
			-- Bed
			[310036] =
			{
				InteractDistance = 200,
				UseText = "UseBed",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				ShakeSelf = true,
				ShakeIds = { 426236, },
				OnUsedGlobalVoiceLines = "TakeANapVoiceLines",
				OnUsedTextLineSets =
				{
					Flashback_Mother_01 =
					{
						UseableOffSource = true,
						PlayOnce = true,
						RequiredTrueFlags = { "AllowFlashback" },
						-- Mischief, me? I was just going to have a little look through Father's stuff.
						EndCue = "/VO/ZagreusHome_0175",
						EndWait = 0.35,
						{
							StartSound = "/Leftovers/Menu Sounds/EmoteExcitement",
							PreLineFunctionName = "SetupFlashback", PreLineFunctionArgs = { FlashbackMessage = "FlashbackMessage", SecretMusic = "/Music/MusicExploration3_MC" },
							FadeOutTime = 0.5, FullFadeTime = 1, SetFlagTrue = "InFlashback", PostLineFunctionName = "AdvanceFlashback",
							BlockUseableToggle = true,
							UseableOffIds =
							{
								421158, 390197, 390000, 310036, 370000, 390021, 390446, 390325, 420896, 420897, 420898, 421071, 421070, 421072, 421074, 390197, 422257, 426224, 426229, 426231, 426230, 426228, 426222, 426213, 426209, 426220, 426220, 390197, 390224, 390314, 390227, 422261, 310037, 421320, 310039, 310038, 421296, 421295, 426208, 426236, 555810, 555811,
							},
							FadeOutIds =
							{
								421158, 390000, 390325, 390021, 391715, 391713, 391712, 391714, 420898, 310028, 310038, 310024, 390197, 390224, 390314, 421071, 421070, 421072, 421074, 422257, 426224, 426229, 426231, 426230, 426228,
								426222, 426213, 426209, 426220, 426220, 390197, 390224, 390314, 390227, 422261, 310037, 421320, 310039, 310038, 421296, 421295, 426208, 555810, 555811, 426239
							},
							CollisionOffIds =
							{
								426209, 426222, 422261, 390179, 390197, 426208,
							},
							Cue = "/VO/Storyteller_0162", PreLineWait = 1.5,
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}It is the dead of night, or the approximation of it in the realm of Hades. Prince of the Underworld Zagreus rises from a fitful slumber, with much mischief on his mind."
						},
					},

					-- Flashback 2
					Flashback_DayNightJob_01 =
					{
						UseableOffSource = true,
						PlayOnce = true,
						RequiredTrueFlags = { "AllowFlashback" },
						RequiredTextLines = { "Flashback_Mother_01" },
						-- Ungh, I'm late for work... Father's going to kill me.
						EndCue = "/VO/ZagreusHome_2115",
						EndWait = 0.35,
						{
							StartSound = "/Leftovers/Menu Sounds/EmoteExcitement",
							PreLineFunctionName = "SetupFlashback", PreLineFunctionArgs = { FlashbackMessage = "FlashbackMessage02", SecretMusic = "/Music/MusicExploration1_MC" },
							FadeOutTime = 0.5, FullFadeTime = 1, SetFlagTrue = "InFlashback", PostLineFunctionName = "AdvanceFlashback",
							BlockUseableToggle = true,
							UseableOffIds =
							{
								421158, 390197, 390000, 310036, 370000, 390021, 390446, 390325, 420896, 420897, 420898, 421071, 421070, 421072, 421074, 390197, 422257, 426224, 426229, 426231, 426230, 426228, 426222, 426213, 426209, 426220, 426220, 390197, 390224, 390314, 390227, 422261, 310037, 421320, 310039, 310038, 421296, 421295, 426208, 426236, 555810, 555811
							},
							FadeOutIds =
							{
								421158, 390000, 390325, 390021, 391715, 391713, 391712, 391714, 420898, 310028, 310038, 310024, 390197, 390224, 390314, 421071, 421070, 421072, 421074, 422257, 426224, 426229, 426231, 426230, 426228,
								426222, 426213, 426209, 426220, 426220, 390197, 390224, 390314, 390227, 422261, 310037, 421320, 310039, 310038, 421296, 421295, 426208, 555810, 555811, 426239
							},
							CollisionOffIds =
							{
								426209, 426222, 422261, 390179, 390197, 426208,
							},
							Cue = "/VO/Storyteller_0303", PreLineWait = 1.5,
							UseableOnIds = { 420896 },
							FadeInIds = { 390325 },
							Text = "{#DialogueItalicFormat}The heavy-sleeping Underworld Prince arises, with the feeling that the brief nap he intended as a respite from the rigors of the day or night apparently was none-too-brief, at all..."
						},
					},

				},
			},

			-- Desk Scroll / QuestLog / Fated List
			[421158] =
			{
				Name = "QuestLog",
				InteractDistance = 200,
				AnimOffsetZ = 150,
				UseableWhilePending = true,
				UseText = "UseQuestLog",
				UseSound = "/Leftovers/World Sounds/CaravanCreak",
				OnUsedFunctionName = "UseQuestLog",
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "QuestLog", },
				},
				SetupFunctions =
				{
					{
						Name = "PlayStatusAnimation",
						Args = { Animation = "StatusIconWantsToTalkImportant", },
						GameStateRequirements =
						{
							RequiredScreenViewedFalse = "QuestLog",
							RequiredFalseFlags = { "InFlashback", },
						},
					},
					{
						Name = "PlayStatusAnimation",
						Args = { Animation = "StatusIconWantsToTalkImportant", },
						GameStateRequirements =
						{
							AnyQuestWithStatus = "Complete",
							RequiredFalseFlags = { "InFlashback", },
						},
					},
				},
				DestroyIfNotSetup = true,
				DistanceTrigger =
				{
					WithinDistance = 500,
					TriggerOnceThisRun = true,
					VoiceLines =
					{
						PlayOnce = true,
						AreIdsNotAlive = { 422142, 422255, 426227, },
						Cooldowns =
						{
							{ Name = "ZagreusMiscHouseSpeech", Time = 10 },
						},

						-- Hey that must be the Fated List...
						{ Cue = "/VO/ZagreusHome_1337", PreLineWait = 0.6, Queue = "Always" },
						-- What's that on my desk?
						-- { Cue = "/VO/ZagreusHome_0588", PreLineWait = 0.4, Queue = "Always" },
					},
				},
			},

			-- @when adding new InspectPoints, remember to add their data to Flashback_Mother_01 & any other flasbacks

		},

		InspectPoints =
		{
			-- renovate / cosmetic interact point
			[420898] =
			{
				UseText = "UseCosmetic",
				RequiredFalseFlags = { "InFlashback" },
				RequiresPendingCosmeticItems = true,
				OnUsedFunctionName = "RevealPendingItems",
			},
			[390000] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom01 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							RequiredMinElapsedTime = 3,
							UsePlayerSource = true,
							-- Oh come on, it's not that bad, is it?
							{ Cue = "/VO/ZagreusHome_0066" },
						},
						{ Cue = "/VO/Storyteller_0114",
							Text = "{#DialogueItalicFormat}The bedchambers of Prince Zagreus lie in a perpetual state of utter disarray, despite his Lord and master of the House repeatedly insisting that he pick everything up." },
					},
				},
			},

			-- trojan arms
			[421072] =
			{
				RequiredCosmeticItemVisible = "HouseDagger01",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom_TrojanArms =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0191",
							Text = "{#DialogueItalicFormat}The shattered weapons of the siege of Ilion are now reduced to window-dressings in the Prince's ever-cluttered lair." },
						-- Bronze weapons... made crudely, but they had the right idea.
						EndCue = "/VO/ZagreusHome_0420",
						EndWait = 0.3,
					}
				}
			},

			-- achilles poster
			[421071] =
			{
				RequiredCosmeticItemVisible = "HousePoster01",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom_AchillesPoster =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0189",
							Text = "{#DialogueItalicFormat}The valor of the great-hearted Achilles is immortalized upon the Prince's wall, as though it might stir up more courage from within." },
						-- Achilles must have been incredible back when he was alive.
						EndCue = "/VO/ZagreusHome_0418",
						EndWait = 0.3,
					}
				}
			},

			-- aphrodite poster
			[421070] =
			{
				RequiredCosmeticItemVisible = "HousePoster02",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom_AphroditePoster =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0190",
							Text = "{#DialogueItalicFormat}The visage of the goddess Aphrodite now adorns the Prince's bedchambers, perhaps to provide consolation after when next he dies." },
						-- Aphrodite herself. Wonder if I could get this signed.
						EndCue = "/VO/ZagreusHome_0419",
						EndWait = 0.3,
					}
				}
			},

			-- dionysus poster
			[555811] =
			{
				RequiredCosmeticItemVisible = "HousePoster05",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom_DionysusPoster =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							PreLineWait = 0.35,
							RequiredMinElapsedTime = 3,
							UsePlayerSource = true,
							-- It's like we share a bond, man!
							{ Cue = "/VO/ZagreusHome_2854" },
						},
						{ Cue = "/VO/Storyteller_0362",
							Text = "{#DialogueItalicFormat}The ever-smiling, wine-washed countenance of the great Lord Dionysus now adorns the Prince's chamber-wall, thus radiating questionable influence." },
					}
				}
			},

			-- scrying pool
			[421074] =
			{
				RequiredCosmeticItemVisible = "HouseWaterBowl01",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom_ScryingPool =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0203",
							Text = "{#DialogueItalicFormat}A beautifully decorated, subtly enchanted bowl containing traces of the hapless Prince's past attempts to flee the Underworld now accents a particularly cluttered corner of his room." },
						-- Always wanted my own scrying pool.
						EndCue = "/VO/ZagreusHome_0421",
						EndWait = 0.3,
					}
				}
			},

			-- lyre
			[426224] =
			{
				RequiredCosmeticItemVisible = "HouseLyre01",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom_Lyre =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0291",
							Text = "{#DialogueItalicFormat}A delicately crafted instrument of music-making now resides within the clamor-causing Prince's chambers, doubtless fearing, if it could, his heavy-handed touch." },
						-- Can't be that hard to play can it?
						EndCue = "/VO/ZagreusHome_1901",
						EndWait = 0.35,
					}
				}
			},

			-- gaming table
			[426229] =
			{
				RequiredCosmeticItemVisible = "HouseGamingTable01",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroomGamingTable01 =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0289",
							Text = "{#DialogueItalicFormat}An object intricately carven solely for the purposes of recreation now resides within the pleasure-seeking Prince's chambers, although his lack for an opponent limits its appeal." },
						-- Face me yourself, old man.
						EndCue = "/VO/ZagreusHome_1899",
						EndWait = 0.35,
					}
				}
			},

			-- bedroom rug
			[426231] =
			{
				RequiredCosmeticItemVisible = "HouseRug03B",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroomRug01 =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0292",
							Text = "{#DialogueItalicFormat}Much of the softness of the richly woven rug the Prince procured cannot be fully felt beneath his flame-licked feet." },
						-- I guess it's soft?
						EndCue = "/VO/ZagreusHome_1902",
						EndWait = 0.35,
					}
				}
			},

			-- fancy bed
			[555810] =
			{
				RequiredCosmeticItemVisible = "HouseBed01a",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredTextLines = { "InspectBedroom01" },
				InteractTextLineSets =
				{
					InspectBedroom_FancyBed =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							PreLineWait = 0.35,
							RequiredMinElapsedTime = 3,
							UsePlayerSource = true,
							-- Already bought it, no need to sell me on it, old man.
							{ Cue = "/VO/ZagreusHome_2855" },
						},
						{ Cue = "/VO/Storyteller_0363",
							Text = "{#DialogueItalicFormat}With its just-right softness and death-themed embroidery, the new bedding of Prince Zagreus is the envy of all those who wish to rest in peace." },
					}
				}
			},

			-- bedroom couch
			[426230] =
			{
				RequiredCosmeticItemVisible = "HouseCouch02A",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroomCouch01 =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0287",
							Text = "{#DialogueItalicFormat}The ever-energetic Prince alas remains incapable of sitting still, even with such a supple, comfortable seating arrangement nestled in his chambers now." },
						-- I just prefer to stand, all right?
						EndCue = "/VO/ZagreusHome_1897",
						EndWait = 0.35,
					}
				}
			},

			-- bedroom barbell / weights
			[426228] =
			{
				RequiredCosmeticItemVisible = "HouseWeights01",
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroomWeights01 =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0288",
							Text = "{#DialogueItalicFormat}A massive set of weights positioned carefully in line of sight of any visitors shall doubtless make them think the Prince is stronger and in better shape than in reality." },
						-- I get lots of exercise, OK?
						EndCue = "/VO/ZagreusHome_1898",
						EndWait = 0.35,
					}
				}
			},

			-- questLog / fated list
			[422257] =
			{
				RequiredCosmetics = { "QuestLog", },
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					InspectBedroom_QuestLog =
					{
						PlayOnce = true,
						{ Cue = "/VO/Storyteller_0282",
							Text = "{#DialogueItalicFormat}The fate-abetting Prince perhaps believes it was through his own choice that he procured the Fated List of Minor Prophecies, but it was preordained." },
						-- Oh no, not this determinism thing again...
						EndCue = "/VO/ZagreusHome_1510",
						EndWait = 0.4,
					}
				}
			},

			-- @when adding new InspectPoints, remember to add their data to Flashback_Mother_01 & any other flasbacks

			-- Flashback 1
			[390511] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_Mother_01" },
				RequiredFalseTextLines = { "Flashback06" },
				InteractTextLineSets =
				{
					Flashback01 =
					{
						PlayOnce = true,
						-- Lower your voice, old man, I'm trying to be sneaky here...!
						EndCue = "/VO/ZagreusHome_0176",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0131", PostLineFunctionName = "AdvanceFlashback",
							UseableOnIds = { 420896 },
							FadeInIds = { 390325 },
							Text = "{#DialogueItalicFormat}All is quiet at this time; ever-dreaming Hypnos put a spell upon the House, as willful Zagreus had asked of him. All are fast asleep, save for the Prince. It is exactly as he planned." },
					},
				},
			},

		},

		EnteredVoiceLines =
		{
			-- Should turn around. My escape route's in the courtyard I just left.
			{ Cue = "/VO/ZagreusHome_1522", RequiredCompletedRuns = 0, RequiredPlayed = { "/VO/ZagreusHome_0458" }, PreLineWait = 0.35, BreakIfPlayed = true, PlayOnce = true, },
			-- My escape route's back the other way.
			{ Cue = "/VO/ZagreusHome_0461", RequiredCompletedRuns = 0, RequiredPlayed = { "/VO/ZagreusHome_0458", "/VO/ZagreusHome_1522" }, PreLineWait = 0.35, BreakIfPlayed = true, PlayOnce = true, RequiredFalsePrevRooms = { "DeathArea" }, },
			-- Hey Room, I'm back.
			{ Cue = "/VO/ZagreusHome_0042b", PreLineWait = 0.85, PlayOnceThisRun = true, RequiredCompletedRuns = 0 },
			-- I'm back, Room, did you miss me?
			-- { Cue = "/VO/ZagreusHome_0045", PreLineWait = 0.85, PlayOnceThisRun = true, RequiredCompletedRuns = 0 },
			-- I want to go lie down.
			{ Cue = "/VO/ZagreusHome_0266", PreLineWait = 0.85, PlayOnceThisRun = true, BreakIfPlayed = true, RequiredTextLines = { "HadesFirstMeeting" }, RequiredFalseTextLines = { "Flashback_Mother_01" }, RequiredTrueFlags = { "AllowFlashback" }, ChanceToPlayAgain = 0.1, AreIdsNotAlive = { 422255, 422142, }, },
			-- Could maybe use some rest...
			{ Cue = "/VO/ZagreusHome_2113", PreLineWait = 0.85, PlayOnceThisRun = true, BreakIfPlayed = true, RequiredTextLines = { "Flashback_Mother_01" }, RequiredTrueFlags = { "AllowFlashback" }, ChanceToPlayAgain = 0.1, AreIdsNotAlive = { 422255, 422142, }, },
			-- Hey what happened to the Pact of Punishment?
			{ Cue = "/VO/ZagreusHome_1055", PlayOnce = true, BreakIfPlayed = true, PreLineWait = 0.65, RequiredMinShrinePointThresholdClear = 0, RequiredPlayed = { "/VO/ZagreusHome_0588" }, RequiredFalsePlayed = { "/VO/ZagreusHome_1056", "/VO/ZagreusHome_1057", "/VO/ZagreusHome_1126" }, RequiredFalseCosmetics = { "QuestLog" }, AreIdsNotAlive = { 422255, 422142, }, },
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PlayOnceFromTableThisRun = true,
				RequiredMinCompletedRuns = 1,
				PreLineWait = 0.65,
				RequiredFalseFlags = { "InFlashback" },
				RequiredFalseTextLinesThisRun = { "Flashback_Mother_01", "Ending01" },
				RequiredFalsePlayedThisRoom = { "/VO/ZagreusHome_0588" },
				AreIdsNotAlive = { 422255, 422142, },
				SuccessiveChanceToPlay = 0.2,
				Cooldowns =
				{
					{ Name = "ZagreusMiscHouseSpeech", Time = 10 },
				},

				-- Hey Room, I'm back.
				{ Cue = "/VO/ZagreusHome_0042b", RequiredMinCompletedRuns = 8 },
				-- Hey Room, I'm back.
				{ Cue = "/VO/ZagreusHome_0042a", RequiredMinCompletedRuns = 12 },
				-- <Sigh.>
				{ Cue = "/VO/ZagreusHome_0043", RequiredFalseTextLines = { "Ending01" }, },
				-- <Sigh...>
				{ Cue = "/VO/ZagreusHome_0104", RequiredFalseTextLines = { "Ending01" }, },
				-- Hey, Room.
				{ Cue = "/VO/ZagreusHome_0044" },
				-- I'm back, Room, did you miss me?
				{ Cue = "/VO/ZagreusHome_0045", RequiredMinCompletedRuns = 4, ChanceToPlay = 0.5 },
				-- Gods...
				{ Cue = "/VO/ZagreusHome_0046", RequiredFalseTextLines = { "Ending01" }, },
				-- Hey Room, I'm back.
				{ Cue = "/VO/ZagreusHome_3743", RequiredTextLines = { "Ending01" }, },
				-- Greetings, Room.
				{ Cue = "/VO/ZagreusHome_3744", RequiredTextLines = { "Ending01" }, },
				-- Hey Room.
				{ Cue = "/VO/ZagreusHome_3745", RequiredTextLines = { "Ending01" }, },
				-- Whew.
				{ Cue = "/VO/ZagreusHome_3746", RequiredTextLines = { "Ending01" }, },
				-- I'm back, Room.
				{ Cue = "/VO/ZagreusHome_3747", RequiredTextLines = { "Ending01" }, },
				-- I missed you, Room.
				{ Cue = "/VO/ZagreusHome_3748", RequiredTextLines = { "Ending01" }, },
				-- Miss me, Room?
				{ Cue = "/VO/ZagreusHome_3749", RequiredTextLines = { "Ending01" }, },
				-- It's me, Room.
				{ Cue = "/VO/ZagreusHome_3750", RequiredTextLines = { "Ending01" }, },
			},
		},
	},

	-- ending
	-- Hades Bedroom
	DeathAreaBedroomHades =
	{
		ZoomFraction = 1.0,
		SoftClamp = 0.75,

		AmbientMusicParams =
		{
			LowPass = 1.0,
			Vocals = 1.0,
		},
		AmbientMusicVolume = 1.0,
		Ambience = "/Ambience/MusicExploration4Ambience",

		NextRoomEntranceFunctionName = "LeavingBedroomHadesPresentation",

		RemoveDashFireFx = true,
		IgnoreStemMixer = true,
		IntroSequenceDuration = 0.2,
		DebugOnly = true,
		NoAutoEquip = true,
		ShowResourceUIOnly = true,
		ShowResourceUIRequirements =
		{
			RequiredTextLines = { "HadesRevealsBadgeSeller01" },
		},
		FullscreenEffectGroup = "Foreground_01",
		SkipWeaponBinkPreLoading = true,
		RichPresence = "#RichPresence_House",

		LegalEncounters = { "Empty", },

		ReverbValue = 2.0,

		FailedToFireFunctionName = "DeathAreaAttackFailPresentation",

		CheckObjectives = { "MetaPrompt", "BedPrompt" },

		UnthreadedEvents =
		{
			{
				FunctionName = "DisableWeapons",
				Args = {},
			},
			-- Persephone's Bag
			{
				FunctionName = "ActivatePrePlacedObstacles",
				GameStateRequirements =
				{
					RequiredTextLines = { "PersephoneReturnsHome01" },
				},
				Args =
				{
					Groups = { "TravelBags" },
				},
			},
			-- Updated Bed
			{
				FunctionName = "ActivatePrePlacedObstacles",
				GameStateRequirements =
				{
					RequiredTextLines = { "PersephoneReturnsHome01" },
				},
				Args =
				{
					Groups = { "Bedding" },
				},
			},
			-- BadgeSeller / Badge Seller / Resources Director
			{
				FunctionName = "ActivatePrePlaced",
				GameStateRequirements =
				{
					RequiredTextLines = { "HadesRevealsBadgeSeller01" },
					CurrentRunValueFalse = "BadgePurchased",
				},
				Args =
				{
					Types = { "BadgeSellerGhost01", },
				},
			},
		},
		ObstacleData =
		{
			-- room exit
			[488298] =
			{
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredAnyTextLines = { "Inspect_DeathAreaBedroomHades_Portrait_01", "Ending01" },
				},
				OnUsedFunctionName = "DeathAreaSwitchRoom",
				OnUsedFunctionArgs = { Name = "DeathArea", HeroStartPoint = 555684, HeroEndPoint = 555685 },
				InteractDistance = 140,
				AutoActivate = true,
			},

			-- BadgeSeller / Badge Seller / Resources Director
			[555853] =
			{
				Name = "BadgeSeller",
				UseText = "UseGreetNPC",
				UseTextInitial = "UseGreetNPC",
				OnUsedFunctionName = "UseBadgeSeller",
				NoSaleEmote = "StatusIconEyeRoll",
				MadeSaleEmote = "StatusIconSmile",
				InteractDistance = 140,
				AnimOffsetZ = 150,
				EmoteOffsetZ = 200,
				DestroyIfNotSetup = true,
				SetupFunctions =
				{
					{
						Name = "ShowNextBadgeForPurchase",
						Args = {},
						GameStateRequirements =
						{
							RequiredTextLines = { "BadgeSellerInfo01" },
							RequiredFalseFlags = { "InFlashback", },
						},
					},
				},
				DistanceTriggers =
				{
					{
						WithinDistance = 300,
						Emote = "StatusIconSmile",
						RequiredMinValues = { BadgeRank = 50 },
						TriggerOnceThisRun = true,
						VoiceLines =
						{
							BreakIfPlayed = true,
							RandomRemaining = true,
							SuccessiveChanceToPlayAll = 0.33,

							-- I can still rank up within my heart, I guess.
							{ Cue = "/VO/ZagreusHome_3651" },
							-- I'm at the highest rank achievable!
							{ Cue = "/VO/ZagreusHome_3652", RequiredPlayed = { "/VO/ZagreusHome_3651" }, },
							-- Suppose I'm overdue to take a break...
							{ Cue = "/VO/ZagreusHome_3653", RequiredPlayed = { "/VO/ZagreusHome_3651" }, },
							-- Keeping busy, Resources Director?
							{ Cue = "/VO/ZagreusHome_3654", RequiredPlayed = { "/VO/ZagreusHome_3651" }, },
							-- Just checking in, Resources Director.
							{ Cue = "/VO/ZagreusHome_3655", RequiredPlayed = { "/VO/ZagreusHome_3651" }, },
							-- Hey, Resources Director.
							{ Cue = "/VO/ZagreusHome_3656", RequiredPlayed = { "/VO/ZagreusHome_3651" }, },
						},
					},
					{
						WithinDistance = 400,
						Emote = "StatusIconDisgruntled",
						RequiredMaxValues = { BadgeRank = 49 },
						TriggerOnceThisRun = true,
					},
				},

				OnUsedTextLineSets =
				{
					BadgeSellerInfo01 =
					{
						PlayOnce = true,
						{ Cue = "/VO/ZagreusHome_3551", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
							PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
							PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
							PreLineFunctionName = "ShowNextBadgeForPurchase",
							PostLineFunctionName = "DisplayEndingMessage",
							PostLineFunctionArgs = { Delay = 0.5, MessageId = "BadgeSystem_Message01" },
							Text = "It's been a while, Resources Director. I'll be sure to pay you a visit whenever I'm swimming in Underworld valuables and want to feel better about myself in my new role." },
					},
				},
			},

		},
		EnterVoiceLines =
		{
			{
				PlayOnce = true,
				PlayOnceContext = "HadesBedroomFirstEntry",
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				UsePlayerSource = true,
				RequiredTextLinesThisRun = { "AchillesAboutHadesBedroom01" },

				-- Must be something worth a damn in here.
				{ Cue = "/VO/ZagreusHome_0336" },
			},
			{
				PlayOnce = true,
				PlayOnceContext = "BadgeSellerFirstMeeting",
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				UsePlayerSource = true,
				AreIdsAlive = { 555853 },

				-- Keeping busy, Resources Director?
				{ Cue = "/VO/ZagreusHome_3654" },
			},
			{
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				UsePlayerSource = true,
				RequiredTextLines = { "Ending01" },
				-- RequiredFalseTextLinesThisRun = { "Ending01" },
				SuccessiveChanceToPlay = 0.2,

				-- Father keeps things orderly I guess...
				{ Cue = "/VO/ZagreusHome_3729", PlayOnce = true },
				-- The master chambers...
				{ Cue = "/VO/ZagreusHome_3730" },
				-- Mother didn't change the decor much.
				{ Cue = "/VO/ZagreusHome_3731", PlayOnce = true },
				-- Resources Director!
				{ Cue = "/VO/ZagreusHome_3732",	AreIdsAlive = { 555853 }, },
				-- Hello, Director.
				{ Cue = "/VO/ZagreusHome_3733",	AreIdsAlive = { 555853 }, },
				-- Just me, Director.
				{ Cue = "/VO/ZagreusHome_3734",	AreIdsAlive = { 555853 }, },
				-- I'm back, Director.
				{ Cue = "/VO/ZagreusHome_3735",	AreIdsAlive = { 555853 }, },
				-- Director.
				{ Cue = "/VO/ZagreusHome_3736",	AreIdsAlive = { 555853 }, },
				-- Director?
				{ Cue = "/VO/ZagreusHome_3737",	AreIdsAlive = { 555853 }, },
			},
		},

		InspectPoints =
		{
			-- portrait
			[555700] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				RequiredFalseTextLinesThisRun = { "Ending01" },
				InteractTextLineSets =
				{
					Inspect_DeathAreaBedroomHades_Portrait_01 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							UsePlayerSource = true,
							PreLineWait = 0.45,
							-- He's never stopped thinking of her. Ugh, what a fool.
							{ Cue = "/VO/ZagreusHome_3281" },
						},
						{ Cue = "/VO/Storyteller_0350",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							SetFlagFalse = "ZagSpecialEventInProgress",
							Text = "{#DialogueItalicFormat}In his Lord Father's very private chambers, Zagreus, the lock-removing prince, discovers a most delicately painted likeness of none other than Persephone, herself. A coat of dust suggests it has remained here for some time." },
					},
				},
			},

			-- capes
			[555701] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback" },
				InteractTextLineSets =
				{
					Inspect_DeathAreaBedroomHades_Capes_01 =
					{
						EndVoiceLines =
						{
							{
								UsePlayerSource = true,
								PreLineWait = 0.35,
								RequiredTextLines = { "LordHadesMiscEncounter05" },
								-- I knew it. It's just capes!
								{ Cue = "/VO/ZagreusHome_3282" },
							},
							{
								UsePlayerSource = true,
								PreLineWait = 0.45,
								RequiredFalseTextLines = { "LordHadesMiscEncounter05" },
								-- Tsch.
								{ Cue = "/VO/ZagreusHome_0976" },
							},
						},
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0351",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}The stoic Lord and Master of the House possesses wealth beyond imagining, a portion of which he has used for a crisp set of attire for every passing day." },
					},
				},
			},

		},

	},

	-- Office / Administrative Room
	DeathAreaOffice =
	{
		ZoomFraction = 1.0,
		SoftClamp = 0.75,

		AmbientMusicParams =
		{
			LowPass = 1.0,
			Vocals = 1.0,
		},
		AmbientMusicVolume = 1.0,
		Ambience = "/Ambience/AdministrativeOfficeAmbience",

		RemoveDashFireFx = true,
		IgnoreStemMixer = true,
		IntroSequenceDuration = 0.5,
		DebugOnly = true,
		LinkedRoom = "RoomOpening",
		NoAutoEquip = true,
		ShowResourceUIOnly = true,
		FullscreenEffectGroup = "Foreground_01",
		SkipWeaponBinkPreLoading = true,
		RichPresence = "#RichPresence_Office",

		LegalEncounters = { "Empty", },

		ReverbValue = 1.3,

		NextRoomEntranceFunctionName = "LeavingOfficePresentation",

		FailedToFireFunctionName = "DeathAreaAttackFailPresentation",

		CheckObjectives = { "MetaPrompt", "BedPrompt" },

		StartUnthreadedEvents =
		{
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "InFlashback", },
				},
				Args =
				{
					Types =
					{
						"NPC_Hades_Story_01",
					},
					ActivationCapMin = 1,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			},
			{
				FunctionName = "FadeOutIds",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "InFlashback", },
				},
				Args =
				{
					Ids = { 488651, 488692 },
				},
			},
			{
				FunctionName = "ActivatePrePlacedObstacles",
				GameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
					RequiredCosmetics = { "NyxQuestItem", },
				},
				Args =
				{
					Ids = { 488608, 488637, 488639, 488635, },
				},
			},
		},

		UnthreadedEvents =
		{
			{
				FunctionName = "DisableWeapons",
				Args = {},
			},
		},

		PostUnthreadedEvents =
		{
			{
				FunctionName = "CheckConversations",
				Args = {},
			},
		},

		ObstacleData =
		{
			[487886] =
			{
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
				},
				OnUsedFunctionName = "DeathAreaSwitchRoom",
				OnUsedFunctionArgs = { Name = "DeathArea", HeroStartPoint = 427202, HeroEndPoint = 427201 },
				InteractDistance = 140,
				AutoActivate = true,
			},

			-- RunHistory / Run History / Security Log
			[488633] =
			{
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
				},
				DisableIfUnuseable = true,
				UseText = "UseRunHistory",
				OnUsedFunctionName = "ShowRunHistoryScreen",
				OnUsedFunctionArgs = { },
				InteractDistance = 125,
				InteractOffsetX = -50,
				InteractOffsetY = -30,
			},
			-- GameStats / Game Stats / Permanent Record
			[488699] =
			{
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback", },
				},
				DisableIfUnuseable = true,
				UseText = "UseWeaponKit_LockedNoKey",
				OnUsedFunctionName = "ShowGameStatsScreen",
				OnUsedFunctionArgs = { },
				InteractDistance = 125,
				InteractOffsetX = -50,
				InteractOffsetY = -30,
			},

			-- teleporter / eldest sigil
			[487882] =
			{
				Name = "Teleporter",
				DistanceTriggers =
				{
					{
						WithinDistance = 580,
						VoiceLines =
						{
							BreakIfPlayed = true,
							RandomRemaining = true,
							CooldownTime = 8,
							PlayOnce  = true,
							UsePlayerSource = true,
							SuccessiveChanceToPlay = 0.33,

							-- The Eldest Sigil. Nyx needs it upgraded, huh.
							{ Cue = "/VO/ZagreusHome_2302", RequiredTextLines = { "NyxAboutChaos06" }, RequiredFalseCosmetics = { "NyxQuestItem" }, },
							-- The Eldest Sigil should be fully powered up for Nyx.
							{ Cue = "/VO/ZagreusHome_2303", RequiredCosmetics = { "NyxQuestItem" }, RequiredFalseTextLines = { "ChaosAboutNyx06" }, },
						},
					}
				},

			},

			-- water cooler
			[488624] =
			{
				UseText = "UseWaterCooler01",
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback" },
					RequiredTextLines = { "Inspect_DeathAreaOffice_Poster_01" },
				},
				DisableIfUnuseable = true,
				OnUsedFunctionName = "UseWaterCooler",
				OnUsedFunctionArgs = { },
				InteractDistance = 140,
			},

			-- motivational poster / office poster (thanatos)
			[488611] =
			{
				UseText = "UseOfficePoster01",
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback" },
					RequiredTextLines = { "Inspect_DeathAreaOffice_Poster_01" },
				},
				DisableIfUnuseable = true,
				OnUsedFunctionName = "UseOfficePoster",
				OnUsedFunctionArgs = { },
				InteractDistance = 130,
				InteractOffsetY = 60,
				InteractOffsetX = 25,
			},
			-- motivational poster / office poster (rope)
			[488047] =
			{
				UseText = "UseOfficePoster01",
				OnUsedGameStateRequirements =
				{
					RequiredFalseFlags = { "InFlashback" },
					RequiredTextLines = { "Inspect_DeathAreaOffice_Poster_01" },
				},
				DisableIfUnuseable = true,
				OnUsedFunctionName = "UseOfficePoster",
				OnUsedFunctionArgs = { },
				InteractDistance = 125,
				InteractOffsetY = 120,
				InteractOffsetX = 25,
			},

		},

		InspectPoints =
		{
			-- teleporter / eldest sigil
			[487903] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				RequiredAnyTextLines = { "Inspect_DeathAreaOffice_WaterCooler01", "Inspect_DeathAreaOffice_Poster_01" },
				InteractTextLineSets =
				{
					Inspect_DeathAreaOffice_Teleporter_01 =
					{
						PlayOnce = true,
						-- Could never get the blasted thing to work for me...
						EndCue = "/VO/ZagreusHome_2073",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0330",
							Text = "{#DialogueItalicFormat}Within the recesses of the administrative chamber lies the Eldest Sigil of the Master's House: a symbol of the Fate-given authority to rule beneath the earth, and means by which to travel the entirety of all that dark domain." },
					},
				},
			},
			-- water cooler
			[488662] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_01" },
				InteractTextLineSets =
				{
					Inspect_DeathAreaOffice_WaterCooler01 =
					{
						PlayOnce = true,
						-- The job's number one perk... no thanks.
						EndCue = "/VO/ZagreusHome_2389",
						RequiredMinElapsedTime = 6,
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0337",
							Text = "{#DialogueItalicFormat}The cool, purified waters of the Styx are available in limitless supply to all servants of the god of the dead authorized to work endlessly within the House administrative chamber." },
					},
				},
			},
			-- motivational poster / office poster
			[488661] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_01" },
				-- Hidden = true,
				InteractTextLineSets =
				{
					Inspect_DeathAreaOffice_Poster_01 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							UsePlayerSource = true,
							PreLineWait = 0.45,
							-- Everybody hang in there!
							{ Cue = "/VO/ZagreusHome_2400", PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.66 } },
						},
						{ Cue = "/VO/Storyteller_0336",
							Text = "{#DialogueItalicFormat}The administrative chamber's ever-working shades remain utterly dedicated to their thankless toil all because of an inspiring rendition of how dedicated they ideally should be." },
					},
				},
			},

			-- contract 1
			[488045] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				RequiredTextLines = { "NyxAboutSisyphusLiberationQuest01" },
				InteractTextLineSets =
				{
					Inspect_DeathAreaOffice_SealedContract_01 =
					{
						PlayOnce = true,
						-- I'll just patch this through to the House Contractor, then.
						EndCue = "/VO/ZagreusHome_2074",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0331",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Amongst the parchment-records of the dead and punished are the sealed documents known as the Knave-King's Sentence, forcing said king to endlessly toil with a boulder till the end of time." },
					},
				},
			},

			-- contract 2
			[488044] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				RequiredTextLines = { "NyxAboutSingersReunionQuest01" },
				InteractTextLineSets =
				{
					Inspect_DeathAreaOffice_SealedContract_02 =
					{
						PlayOnce = true,
						-- OK, it should be dispatched over to the House Contractor now.
						EndCue = "/VO/ZagreusHome_2075",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0332",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Nestled among the towering administrative parchmentwork of the long-since-deceased lies an old document concerning a special pact signed by a once-living court musician, who attempted vainly to rescue his wife from death." },
					},
				},
			},

			-- contract 3
			[488043] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredFalseFlags = { "InFlashback", },
				RequiredTextLines = { "NyxAboutMyrmidonReunionQuest01" },
				InteractTextLineSets =
				{
					Inspect_DeathAreaOffice_SealedContract_03 =
					{
						PlayOnce = true,
						-- Should be able to approve a few revisions to that one with the House Contractor I think.
						EndCue = "/VO/ZagreusHome_2570",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0339",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Buried deep within the archives, holding many binding pacts between Lord Hades and the dead, resides an old agreement; an exchange for services from an extraordinary warrior, for eternity within Elysium for his dear partner." },
					},
				},
			},

			-- Flashback 2
			[487892] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_03" },
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_01 =
					{
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.666,
								-- Oh, gods....
								{ Cue = "/VO/ZagreusHome_2119" },
							},
							[3] =
							{
								PreLineWait = 0.5,
								ObjectType = "NPC_Hades_Story_01",

								-- Get on with your responsibilities.
								{ Cue = "/VO/Hades_0807" },
							},
						},
						{ Cue = "/VO/Storyteller_0306", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							EndSecretMusic = true, PostLineSecretMusic = "/Music/MusicPlayer/HadesThemeMusicPlayer",
							Text = "{#DialogueItalicFormat}The day or night's duties are sheer simplicity itself; at least at first, as when the prince simply signs in to signal the commencement of his shift." },
					},
				},
			},

			[487904] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_02 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Damn it...
								{ Cue = "/VO/ZagreusHome_2120" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0307", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}The often-failing prince attempts to sort the ledgers in the fashion necessary for the proper keeping of his father's realm." },
					},
				},
			},
			[487902] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_03 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Ungh...
								{ Cue = "/VO/ZagreusHome_2121" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0308", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}The training-lacking prince's efforts to administer approvals to the judgment terms ultimately leave a lot to be desired." },
					},
				},
			},
			[487905] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_04 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Oh come on.
								{ Cue = "/VO/ZagreusHome_2122" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0309", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}The hard-laboring shades responsible for the administration of the prince's father's realm merely look on at the prince's ill-fated attempts." },
					},
				},
			},
			[487906] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_05 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Doesn't make any sense.
								{ Cue = "/VO/ZagreusHome_2123" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0310", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}The relaxation-loving prince never paid suitably enough attention to learn properly how to arrange the record-bookings of the regions of his father's realm." },
					},
				},
			},
			[487896] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_06 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- What...
								{ Cue = "/VO/ZagreusHome_2124" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0311", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}This set of delicate responsibilities is easily achieved, at least by someone capable and trained to do the work, unlike the oft-distracted Underworld Prince." },
					},
				},
			},
			[487893] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_07 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- I... ungh.
								{ Cue = "/VO/ZagreusHome_2125" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0312", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}A careful record must be kept of all expenses paid within the House; a delicately-handled tabulation process which the prince is ill-equipped to fully undertake." },
					},
				},
			},
			[487894] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_08 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- I'll do it later.
								{ Cue = "/VO/ZagreusHome_2126" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0313", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}A steadily-updated ledger of the House's income in the form of brilliant gemstones, diamonds, Darkness, and the like, is merely one among the prince's least-liked aspects of his work." },
					},
				},
			},
			[487895] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_09 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								RequiredMinElapsedTime = 8,
								-- None whatsoever, yes.
								{ Cue = "/VO/ZagreusHome_2127" },
							},
							-- [3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0314", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Records of expired House Contractor renovations line a desk in the administrative chamber, though the prince has absolutely no desire now to organize them alphabetically, by date." },
					},
				},
			},
			[487907] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_10 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								RequiredMinElapsedTime = 8,
								-- I haven't forgotten, no one told me!
								{ Cue = "/VO/ZagreusHome_2128" },
							},
							-- [3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0315", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Attendance records of the working-shades who toil for the House need to be verified; the shades' due compensation, rapidly approved; and yet the prince cannot remember all the necessary steps." },
					},
				},
			},
			[487897] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_11 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								RequiredMinElapsedTime = 8,
								-- Oh it's faded...
								{ Cue = "/VO/ZagreusHome_2129" },
							},
							-- [3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0316", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Disorderly Prince Zagreus gazes upon the endless stacks of parchment-paper, each containing work-details to be registered and neatly organized, and starts to feel his optimism fade." },
					},
				},
			},
			[487898] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_12 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								RequiredMinElapsedTime = 8,
								-- Correct...
								{ Cue = "/VO/ZagreusHome_2130" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0317", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Prince Zagreus must have some favored tasks in the administrative chamber of the House; but surely none of them include the tasks demanding his attention, here." },
					},
				},
			},
			[487899] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_13 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Can't understand any of this.
								{ Cue = "/VO/ZagreusHome_2131" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0318", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Reviewing lists of claims from shades with grievances is a very important service of the House, or so Lord Hades once attempted to impress upon his willful son." },
					},
				},
			},
			[487901] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_14 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Can't understand any of this.
								{ Cue = "/VO/ZagreusHome_2131" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0333", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}A litany of complaints submitted by restless shades across the Underworld must be evaluated, organized, and processed, but Prince Zagreus does not even know where to begin." },
					},
				},
			},
			[487900] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_15 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Eugh...
								{ Cue = "/VO/ZagreusField_1139" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0334", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Supplies on all the desks in the administrative chamber must be carefully maintained and neatly placed in a specific way, which the forgetful prince has not yet memorized in full." },
					},
				},
			},
			[488698] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback" },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMaxAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 6 },
				DeactivateIfIneligible = true,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_16 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.25,
								-- Eh...
								{ Cue = "/VO/ZagreusField_1142" },
							},
							[3] = GlobalVoiceLines.HadesFeedbackVoiceLines,
						},
						{ Cue = "/VO/Storyteller_0335", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}Security reports concerning failed escape attempts from Tartarus require timely verification and official response, neither of which Prince Zagreus is fit to give." },
					},
				},
			},

			[487908] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTrueFlags = { "InFlashback", },
				RequiredTextLines = { "Flashback_DayNightJob_Office_01" },
				RequiredMinAnyTextLines = { TextLines = GameData.Flashback2WorkLines, Count = 7 },
				DeactivateIfIneligible = true,
				ClearNextInteractLinesOnActivate = 487891,
				InteractTextLineSets =
				{
					Flashback_DayNightJob_Office_Conclusion_01 =
					{
						PlayOnce = true,
						EndVoiceLines =
						{
							[1] = GlobalVoiceLines.RushedStorytellerVoiceLines,
							[2] =
							{
								UsePlayerSource = true,
								PreLineWait = 0.5,
								-- OK, I'm done, so... can I go yet, Father?
								{ Cue = "/VO/ZagreusHome_2132" },
							},
							[3] =
							{
								PreLineWait = 0.6,
								ObjectType = "NPC_Hades_Story_01",
								-- <Scoffing>
								{ Cue = "/VO/Hades_0079" },
							},
						},
						{ Cue = "/VO/Storyteller_0319", PostLineFunctionName = "AdvanceFlashback",
							PreLineAnim = "ZagreusInteractEquip", PreLineAnimTarget = "Hero",
							Text = "{#DialogueItalicFormat}At last, the work-disliking prince records a summary of the results of his attempts to be of any use to the administrative needs of his grim father's House." },
					},
				},
			},

		},

		EnteredVoiceLines =
		{
			{
				PlayOnce = true,
				RequiredFalseFlags = { "InFlashback" },
				PreLineWait = 1.0,
				BreakIfPlayed = true,
				RequiredFalseCosmetics = { "SisyphusQuestItem" },
				RequiredTextLines = { "NyxAboutSisyphusLiberationQuest01" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },

				-- Should check that stack of contracts back there.
				{ Cue = "/VO/ZagreusHome_2084" },
			},
			{
				PlayOnce = true,
				RequiredFalseFlags = { "InFlashback" },
				PreLineWait = 1.0,
				BreakIfPlayed = true,
				RequiredFalseCosmetics = { "OrpheusEurydiceQuestItem" },
				RequiredTextLines = { "NyxAboutSingersReunionQuest01" },

				-- Contract I'm looking for should be back there.
				{ Cue = "/VO/ZagreusHome_2085" },
			},
			{
				PlayOnce = true,
				RequiredFalseFlags = { "InFlashback" },
				PreLineWait = 1.0,
				BreakIfPlayed = true,
				RequiredFalseCosmetics = { "AchillesPatroclusQuestItem" },
				RequiredTextLines = { "NyxAboutMyrmidonReunionQuest01" },

				-- Should check the admin chamber for the pact Nyx mentioned...
				{ Cue = "/VO/ZagreusHome_2569" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				RequiredFalseFlags = { "InFlashback" },
				PreLineWait = 1.0,
				SuccessiveChanceToPlay = 0.5,
				PlayOnceFromTableThisRun = true,

				-- Never thought I'd come back here again...
				{ Cue = "/VO/ZagreusHome_2076", PlayOnce = true },
				-- Greetings everyone! Just visiting...
				{ Cue = "/VO/ZagreusHome_2077", RequiredPlayed = { "/VO/ZagreusHome_2076" }, PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.5 } },
				-- How's everybody doing?
				{ Cue = "/VO/ZagreusHome_2078", PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.5 } },
				-- Hello, I'll only be a moment!
				{ Cue = "/VO/ZagreusHome_2079", RequiredPlayed = { "/VO/ZagreusHome_2076" }, PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.4 } },
				-- Just checking up on things!
				{ Cue = "/VO/ZagreusHome_2080", RequiredPlayed = { "/VO/ZagreusHome_2076" }, PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.4 } },
				-- Just thought I'd say hello!
				{ Cue = "/VO/ZagreusHome_2081", RequiredPlayed = { "/VO/ZagreusHome_2076" }, PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.5 } },
				-- Oh don't mind me!
				{ Cue = "/VO/ZagreusHome_2082", RequiredPlayed = { "/VO/ZagreusHome_2076" }, PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.3 } },
				-- Just me, pretend I'm not even here.
				{ Cue = "/VO/ZagreusHome_2083", RequiredPlayed = { "/VO/ZagreusHome_2076" }, PostLineFunctionName = "CrowdReactionPresentationEventSource", PostLineFunctionArgs = { AnimationName = "StatusIconDisgruntled", ReactionChance = 0.3 } },
			},
			{
				{
					-- Sorry...!
					{ Cue = "/VO/ZagreusHome_2118", RequiredTrueFlags = { "InFlashback" }, PreLineWait = 0.6 },
				},
				{
					PreLineWait = 0.7,
					ObjectType = "NPC_Hades_Story_01",

					-- You're late, boy! Again.
					{ Cue = "/VO/Hades_0806" },
				},
			},
		},

	},

	-- RoomPreRun / Courtyard
	RoomPreRun =
	{
		InheritFrom = { "BaseTartarus" },
		SkipLastKillPresentation = true,
		CheckWeaponHistory = true,
		UseBiomeMap = true,
		BiomeMapArea = "Home",
		RichPresence = "#RichPresence_RoomPreRun",
		ZoomFraction = 0.95,
		IgnoreStemMixer = true,
		Ambience = "/Ambience/MusicExploration4Ambience",
		KeepsakeFreeSwap = true,
		ShowShrinePoints = true,
		AllowAssistFailedPresentation = true,
		IntroSequenceDuration = 0.80,
		CameraZoomWeights =
		{
			[420907] = 1.0,
			[420906] = 0.75,
		},
		SoftClamp = 0.75,
		LowSpeedThreshold = 0.0,

		BinkSet = "Weapons",

		AmbientMusicParams =
		{
			LowPass = 1.0,
			Vocals = 0.0,
		},
		AmbientMusicVolume = 0.0,

		SkipWeaponBinkPreLoading = true,

		StartUnthreadedEvents =
		{
			{
				FunctionName = "AssignWeaponKits",
				Args =
				{
					PreLoadBinks = true,
					BinkCacheOverrides =
					{
						SpearWeapon = "WeaponCache",
					}
				},
			},
			-- skelly activation requirements
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "SkellyUnlocked", },
					RequiredRunsCleared = 0,
				},
				Args =
				{
					Types =
					{
						"TrainingMelee",
					},
					ActivationCapMin = 0,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			},
			-- skelly: always spawn after first clear
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTextLinesThisRun = "PersephoneFirstMeeting",
				},
				Args =
				{
					Types =
					{
						"TrainingMelee",
					},
					ActivationCapMin = 0,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			},
			-- skelly: always spawn on returns to PreRun if already spawned that run
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					CurrentRunValueTrue = "SkellySpawned",
				},
				Args =
				{
					Types =
					{
						"TrainingMelee",
					},
					ActivationCapMin = 1,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			},
			-- skelly: once trophy quest is available/started, he is always present
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "SkellyUnlocked", },
					RequiredMinRunsCleared = 5,
				},
				Args =
				{
					Types =
					{
						"TrainingMelee",
					},
					ActivationCapMin = 1,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			},
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "SkellyUnlocked", },
					RequiredTextLines = { "TrophyQuest_Beginning_01" },
					RequiredFalseTextLines = { "TrophyQuest_GoldUnlocked_01" },
				},
				Args =
				{
					Types =
					{
						"TrainingMelee",
					},
					ActivationCapMin = 1,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			},
			-- skelly: if trophy quest is completed, he may resume not spawning in again
			{
				FunctionName = "ActivateRotatingNPCs",
				GameStateRequirements =
				{
					RequiredTrueFlags = { "SkellyUnlocked", },
					RequiredTextLines = { "TrophyQuest_GoldUnlocked_01" },
				},
				Args =
				{
					Types =
					{
						"TrainingMelee",
					},
					ActivationCapMin = 0,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			},
			{
				FunctionName = "CheckConversations",
				Args = {},
			},
			{
				FunctionName = "EquipLastAwardTrait",
				Args = {},
			},
			{
				FunctionName = "EquipLastAssistTrait",
				Args = {},
			},
			{
				FunctionName = "EquipLastWeaponUpgrade",
				Args = {},
			},
			{
				FunctionName = "UpdateGiftRackShineStatus"
			},
			{
				FunctionName = "SetupExitDoor"
			},
		},

		ThreadedEvents =
		{
			{
				FunctionName = "HandleWeaponAspectsRevealObjective",
			},
		},

		ObstacleData =
		{
			-- Bronze ShrinePoint Clear / Statue
			[487422] =
			{
				UseText = "UseShrinePointClear_Available",
				InProgressUseText = "UseShrinePointClear_InProgress",
				CompleteUseText = "UseShrinePointClear_Complete",
				AllCompleteUseText = "UseShrinePointClear_QuestCleared",
				InteractDistance = 300,
				SetupFunctionName = "SetupShrinePointClearObject",
				OnUsedFunctionName = "UseShrinePointClearObject",
				OnHitFunctionName = "StatueHitPresentation",
				GoalShrinePointClear = 8,
				AttractAnimation = "TrophySparkleEmitter",
				CompleteAnimation = "HouseStatueSkelly01",
				NextGoalId = 487421,
				SetupGameStateRequirements =
				{
					RequiredTrueFlags = { "ShrineUnlocked", "SkellyUnlocked", },
					RequiredMinRunsCleared = 5,
				},
				DestroyIfNotSetup = true,

				OnTrophyRevealedTextLineSets =
				{
					TrophyQuest_Beginning_01 =
					{
						PlayOnce = true,

						-- Yes, a little bit, if you must know.
						EndCue = "/VO/ZagreusHome_0676",
						EndWait = 0.55,
						{ Cue = "/VO/Skelly_0178", Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							Text = "I'll level with you, pal. You have impressed somebody well above my pay grade here, and so... they have a little proposition for you, you listening?" },
						{ Cue = "/VO/ZagreusHome_1054", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
							Text = "Let me guess... they want me to fight all the way through the Underworld, having used the Pact of Punishment over there to make the going even more treacherous than it already is, and if I succeed, they'll reward me with some sort of useless trinket?" },
						{ Cue = "/VO/Skelly_0179", Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							SetFlagTrue = "TrophyQuestActive",
							Emote = "PortraitEmoteFiredUp",
							Text = "Wrong! We're talking something really big, here, pal, you see that thing back there? Trinket. Come on, what are you, scared?" },
					},
				},

				SourceName = "TrainingMelee",
				OnTrophyUnlockedTextLineSets =
				{
					TrophyQuest_BronzeUnlocked_01 =
					{
						PlayOnce = true,

						-- I'll temper my expectations just in case.
						EndCue = "/VO/ZagreusHome_0679",
						EndWait = 0.5,
						{ Cue = "/VO/Skelly_0183", Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							Emote = "PortraitEmoteSparkly",
							Text = "I just knew you had it in you, pal, enjoying your new prize? Pact of Punishment, {#DialogueItalicFormat}Shmact {#PreviousFormat}of Punishment, no problem, know what I mean? 'Course, that was just the easy one you got there, pretty sure I could've got that one, myself." },
						{ Cue = "/VO/ZagreusHome_0678", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
							PreLineAnim = "ZagreusInteractionThoughtful", PreLineAnimTarget = "Hero",
							Text = "Wait, just so I understand. I literally toiled through hell and back, and my reward is just... a statue of you? Don't get me wrong, it's lovely, it's just... I don't know what I expected." },
						{ Cue = "/VO/Skelly_0184",
							Emote = "PortraitEmoteNervous",	
							Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							PostLineThreadedFunctionName = "StatueUnlockedPresentation", PostLineFunctionArgs = { Subtitle = "ShrinePointStatue_Unlocked_Subtitle_01" },
							Text = "Look, boyo, there was a little mix-up when we put in the request for that thing, see? I told 'em to make something that'll make me look good with my sources, and anyway that's how it all turned out. The other ones turned out much better, though, you'll see!" },
					},
				},

			},
			-- Silver ShrinePoint Clear / Statue
			[487421] =
			{
				UseText = "UseShrinePointClear_Available",
				InProgressUseText = "UseShrinePointClear_InProgress",
				CompleteUseText = "UseShrinePointClear_Complete",
				AllCompleteUseText = "UseShrinePointClear_QuestCleared",
				InteractDistance = 300,
				SetupFunctionName = "SetupShrinePointClearObject",
				OnUsedFunctionName = "UseShrinePointClearObject",
				OnHitFunctionName = "StatueHitPresentation",
				GoalShrinePointClear = 16,
				AttractAnimation = "TrophySparkleEmitter",
				CompleteAnimation = "HouseStatueSkelly02",
				FlipHorizontalOnComplete = true,
				PrevGoalId = 487422,
				NextGoalId = 487120,
				SetupGameStateRequirements =
				{
					RequiredTrueFlags = { "ShrineUnlocked", "SkellyUnlocked", },
					RequiredMinRunsCleared = 5,
				},
				DestroyIfNotSetup = true,

				SourceName = "TrainingMelee",
				OnTrophyUnlockedTextLineSets =
				{
					TrophyQuest_SilverUnlocked_01 =
					{
						PlayOnce = true,
						-- I guess they're stuck here then just like we are.
						EndCue = "/VO/ZagreusHome_0683",
						EndWait = 0.5,
						{ Cue = "/VO/ZagreusHome_0681", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
							Text = "Skelly, let me ask you something. Did you really commission three nearly-identical statues of yourself to goad me into using the Pact of Punishment?" },
						{ Cue = "/VO/Skelly_0188", Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							Emote = "PortraitEmoteFiredUp",
							Text = "I am offended, pal! You haven't even seen the third one yet, so how can you insinuate a thing like that?! Maybe I was wrong about you. I thought you really were the one!" },
						{ Cue = "/VO/ZagreusHome_0682", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
							PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
							PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
							Text = "You're only saying that to get me to apologize and try and unlock the last of your three identical statues, aren't you." },
						{ Cue = "/VO/Skelly_0189", Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							Emote = "PortraitEmoteSurprise",
							PostLineThreadedFunctionName = "StatueUnlockedPresentation", PostLineFunctionArgs = { Subtitle = "ShrinePointStatue_Unlocked_Subtitle_02" },
							Text = "{#DialogueItalicFormat}How could you{#PreviousFormat}--? I would return those statues for a full refund right here and now, if I could move! And if there was a refund policy on them." },
					},
				}
			},
			-- Gold ShrinePoint Clear / Statue
			[487120] =
			{
				UseText = "UseShrinePointClear_Available",
				InProgressUseText = "UseShrinePointClear_InProgress",
				CompleteUseText = "UseShrinePointClear_Complete",
				AllCompleteUseText = "UseShrinePointClear_QuestCleared",
				InteractDistance = 300,
				SetupFunctionName = "SetupShrinePointClearObject",
				OnUsedFunctionName = "UseShrinePointClearObject",
				OnHitFunctionName = "StatueHitPresentation",
				GoalShrinePointClear = 32,
				AttractAnimation = "TrophySparkleEmitter",
				CompleteAnimation = "HouseStatueSkelly04",
				PrevGoalId = 487421,
				SetupGameStateRequirements =
				{
					RequiredTrueFlags = { "ShrineUnlocked", "SkellyUnlocked", },
					RequiredMinRunsCleared = 5,
				},
				DestroyIfNotSetup = true,

				SourceName = "TrainingMelee",
				OnTrophyUnlockedTextLineSets =
				{
					TrophyQuest_GoldUnlocked_01 =
					{
						PlayOnce = true,

						-- We certainly have, Mate. And we certainly do.
						EndCue = "/VO/ZagreusHome_0687",
						EndWait = 0.5,
						{ Cue = "/VO/Skelly_0193", Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							SetFlagFalse = "TrophyQuestActive",
							Emote = "PortraitEmoteDepressed",
							Text = "Look I'm sorry I messed up your statues, boyo. Really. When I saw them, I just kind of freaked. But then I figured there's no way he's going to see how they turned out, so, I just rolled with it, you know?" },
						{ Cue = "/VO/ZagreusHome_0686", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
							PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
							PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
							Text = "You shouldn't have underestimated me, mate. But... I shouldn't have said such awful things about your statues. You must have really gone out of your way to get them here." },
						{ Cue = "/VO/Skelly_0194", Portrait = "Portrait_Skelly_Default_01", Speaker = "NPC_Skelly_01",
							PostLineThreadedFunctionName = "StatueUnlockedPresentation", PostLineFunctionArgs = { Subtitle = "ShrinePointStatue_Unlocked_Subtitle_03" },
							Emote = "PortraitEmoteFiredUp",
							Text = "Oh you better believe it, pal! So how about we call it even. We've been through a lot. Both of us! Really learned from this experience, and now, we share a deeper understanding, yeah?" },
					},
				}
			},

			-- Run Start Door / New Run Door / Pact Door
			[420947] =
			{
				UseText = "UseReviveDoors",
				ShrineUseText = "UsePactDoors",
				OnUsedFunctionName = "UseEscapeDoor",
			},
			-- SeedController
			[487568] =
			{
				UseText = "UseSeedController",
				AvailableAnimation = "ShrinePointDoor_Revealed",
				OnUsedFunctionName = "UseSeedController",
				SetupGameStateRequirements =
				{
					RequiredCosmetics = { "SeedController" },
				},
				Activate = true,
				--DestroyIfNotSetup = true,
			},
			--[[
			-- Onslaught Door1
			[487567] =
			{
				UseText = "UseOnslaughtDoor",
				UseTextLocked = "UseOnslaughtDoor_Recharging",
				AvailableAnimation = "ShrinePointDoor_Revealed",
				SetupFunctionName = "SetupOnslaught",
				OnUsedFunctionName = "StartOnslaught",
				Slot = 1,
				SetupGameStateRequirements =
				{
					RequiredSeenRooms = { "B_Boss01" },
				},
				DestroyIfNotSetup = true,
			},
			-- Onslaught Door3
			[487569] =
			{
				UseText = "UseOnslaughtDoor",
				UseTextLocked = "UseOnslaughtDoor_Recharging",
				AvailableAnimation = "ShrinePointDoor_Revealed",
				SetupFunctionName = "SetupOnslaught",
				OnUsedFunctionName = "StartOnslaught",
				Slot = 3,
				SetupGameStateRequirements =
				{
					RequiredSeenRooms = { "B_Boss01" },
				},
				DestroyIfNotSetup = true,
			},
			--]]
			[421119] =
			{
				SetupGameStateRequirements =
				{
					RequiredFalseConfigOptions = { "KioskMode" },
				},
				DestroyIfNotSetup = true,

				OnUsedFunctionName = "DeathAreaSwitchRoom",
				OnUsedFunctionArgs = { Name = "DeathAreaBedroom", HeroStartPoint = 390514, HeroEndPoint = 390515 },
				InteractDistance = 140,
				AutoActivate = true,
				OnUsedVoiceLines =
				{
					PlayOnceFromTableThisRun = true,
					BreakIfPlayed = true,
					RandomRemaining = true,
					PreLineWait = 2.5,

					-- My escape route's back the other way.
					{ Cue = "/VO/ZagreusHome_0461", RequiredCompletedRuns = 0 },
					-- I can escape from the courtyard back there.
					-- { Cue = "/VO/ZagreusHome_0462", RequiredCompletedRuns = 0 },
				},
			},
		},

		EnterVoiceLines =
		{
			-- Trophy Quest
			{
				{
					PlayOnce = true,
					PreLineWait = 1.0,
					RequiredTrueFlags = { "ShrineUnlocked", "SkellyUnlocked", },
					RequiredMinRunsCleared = 5,
 					ObjectType = "TrainingMelee",
					CooldownName = "SkellySpeechCooldown",
					CooldownTime = 12,

					-- Good, just the boyo I wanted to see, c'mere!
					-- { Cue = "/VO/Skelly_0175" },
					-- Get a load of them prizes over there.
					{ Cue = "/VO/Skelly_0177", PlayOnce = true, },
				},
				{
					PreLineWait = 0.3,
					PlayOnce = true,
					BreakIfPlayed = true,
					RequiredTrueFlags = { "ShrineUnlocked", "SkellyUnlocked", },
					RequiredMinRunsCleared = 5,
					Cooldowns =
					{
						{ Name = "ZagreusMiscHouseSpeech", Time = 10 },
					},

					-- What's all this...?
					{ Cue = "/VO/ZagreusHome_0674" },
				}
			},
			{
				PlayOnceFromTableThisRun = true,
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.65,
				ChanceToPlayAgain = 0.1,
				AreIdsNotAlive = { 420928 },

				-- OK...
				{ Cue = "/VO/ZagreusField_0258",
					Cooldowns =
					{
						{ Name = "ZagreusMiscHouseSpeech", Time = 10 },
					},
				},
				-- I should go.
				{ Cue = "/VO/ZagreusScratch_0024", RequiredPlayed = { "/VO/ZagreusField_0258" },
					Cooldowns =
					{
						{ Name = "ZagreusMiscHouseSpeech", Time = 10 },
						{ Name = "SaidGoRecently", Time = 40 },
					},
				},
			},
		},

		DistanceTriggers =
		{
			-- Overlook
			{
				TriggerGroup = "OverlookOut", WithinDistance = 300, FunctionName = "PreRunOverlook", Repeat = true,
			},
			{
				TriggerGroup = "OverlookIn", WithinDistance = 150, FunctionName = "PreRunBackToRoom", Repeat = true,
			},
			-- NewRunDoor / Exit Door
			{
				TriggerObjectType = "NewRunDoor", WithinDistance = 1050,
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					Queue = "Always",
					Cooldowns =
					{
						{ Name = "ZagreusPreRunExitHintVoiceLines", Time = 8 },
					},
					{
						-- I can escape through that pink window there.
						{ Cue = "/VO/ZagreusHome_0458", PreLineWait = 0.5, RequiredCompletedRuns = 0, RequiredFalseFlags = { "HardMode" } },
						-- I can escape through that sinister window there.
						{ Cue = "/VO/ZagreusHome_1434", PreLineWait = 0.5, RequiredCompletedRuns = 0, RequiredTrueFlags = { "HardMode" } },
						-- That's my way out.
						-- { Cue = "/VO/ZagreusHome_0459", PreLineWait = 0.5, RequiredCompletedRuns = 0 },
						-- There's my escape.
						-- { Cue = "/VO/ZagreusHome_0460", PreLineWait = 0.5, RequiredCompletedRuns = 0 },
						-- The exit... that's a Pact of Punishment on it.
						{ Cue = "/VO/ZagreusHome_1056", RequiredMinRunsCleared = 1, PlayOnce = true, RequiredScreenViewedFalse = "ShrineUpgrade", RequiredFalsePlayed = { "/VO/ZagreusHome_1055", "/VO/ZagreusHome_1057", "/VO/Skelly_0273", "/VO/ZagreusHome_1126" }, AreIdsNotAlive = { 420928 } },
						-- Is that the Pact of Punishment...?
						{ Cue = "/VO/ZagreusHome_1057", RequiredMinRunsCleared = 1, PlayOnce = true, RequiredScreenViewedFalse = "ShrineUpgrade", RequiredPlayed = { "/VO/ZagreusHome_1055", "/VO/Skelly_0273" }, RequiredFalsePlayed = { "/VO/ZagreusHome_1056", "/VO/ZagreusHome_1126" }, AreIdsNotAlive = { 420928 } },
					},
				},
			},
			-- Onslaught Doors
			{
				TriggerObjectType = "ShrinePointDoor", WithinDistance = 500,
				VoiceLines =
				{
					-- Hey look at that.
					-- { Cue = "/VO/ZagreusField_0707" },
				},
			},

			-- Fists / FistWeapon
			{
				TriggerObjectType = "WeaponKit01", WithinDistance = 325,
				TriggerOnceThisRun = true,
				RequiredTrueFlags = { "FistUnlocked" },
				RequiredFalseWeaponsUnlocked = { "FistWeapon" },
				VoiceLines =
				{
					-- Another weapon...
					{ Cue = "/VO/ZagreusHome_2033", RequiredPlayedThisRoom = { "/VO/Skelly_0458" } },
					-- It's the Twin Fists...
					-- { Cue = "/VO/ZagreusHome_2032", RequiredPlayedThisRoom = { "/VO/Skelly_0458" } },
				},
			},
			-- Rail
			{
				TriggerObjectType = "WeaponKit01", WithinDistance = 325,
				TriggerOnceThisRun = true,
				RequiredTrueFlags = { "GunUnlocked" },
				RequiredFalseWeaponsUnlocked = { "GunWeapon" },
				VoiceLines =
				{
					-- Hey look at that.
					{ Cue = "/VO/ZagreusField_0707", RequiredPlayedThisRoom = { "/VO/Skelly_0243" } },
				},
			},

			-- Skelly
			{
				TriggerObjectType = "TrainingMelee", WithinDistance = 700,
				TriggerOnceThisRun = true,
				VoiceLines =
				{
					-- True Death Quest
					{
						BreakIfPlayed = true,
						CooldownName = "SkellySpeechCooldown",
						CooldownTime = 12,
						RequiredQueuedTextLines = "SkellyTrueDeathQuest_Beginning_01",
						RequiredFalseTextLines = { "SkellyTrueDeathQuest_Beginning_01" },

						-- Hey, pal, wanted to talk to you...
						{ Cue = "/VO/Skelly_0306" },
					},
					{
						BreakIfPlayed = true,
						CooldownName = "SkellySpeechCooldown",
						CooldownTime = 12,
						RequiredQueuedTextLines = "SkellyTrueDeathQuest_Beginning_01B",
						RequiredFalseTextLines = { "SkellyTrueDeathQuest_Beginning_01B" },

						-- Hey, pal, wanted to talk to you...
						{ Cue = "/VO/Skelly_0306" },
					},
					-- FistWeapon
					{
						BreakIfPlayed = true,
						RequiredTrueFlags = { "FistUnlocked" },
						RequiredFalseWeaponsUnlocked = { "FistWeapon" },

						-- Hey, uh, something back there for you, pal!
						{ Cue = "/VO/Skelly_0458", PlayOnce = true, },
					},
					-- GunWeapon
					{
						BreakIfPlayed = true,
						RequiredTrueFlags = { "GunUnlocked" },
						RequiredFalseWeaponsUnlocked = { "GunWeapon" },

						-- Special delivery for you back there, boyo!
						{ Cue = "/VO/Skelly_0243", PlayOnce = true, },
					},
					-- Easy Mode
					{
						PlayOnce = true,
						PlayOnceContext = "SkellyEasyMode",
						BreakIfPlayed = true,
						RequiredQueuedTextLines = { "SkellyHintMeeting_EasyMode01" },

						-- Hey, may I have your attention for a sec?
						{ Cue = "/VO/Skelly_0401" },
					},
					-- New Pact
					{
						RequiredMinRunsCleared = 1,
						CooldownName = "SkellySpeechCooldown",
						CooldownTime = 12,
						RequiredScreenViewedFalse = "ShrineUpgrade",
						-- Uh, might want to see this, boyo, over to my left?
						-- { Cue = "/VO/Skelly_0272", PlayOnce = true, },
						-- Look what they did to your pink window, pal!!
						{ Cue = "/VO/Skelly_0273", RequiredQueuedTextLines = "SkellyAboutPact01", PlayOnce = true, RequiredFalsePlayed = { "/VO/ZagreusHome_1056", "/VO/ZagreusHome_1057", "/VO/ZagreusHome_1126" } },
						{
							BreakIfPlayed = true,
							PreLineWait = 0.35,
							UsePlayerSource = true,
							-- The exit... that's a Pact of Punishment on it.
							{ Cue = "/VO/ZagreusHome_1056", PlayOnce = true, RequiredFalsePlayed = { "/VO/ZagreusHome_1055", "/VO/ZagreusHome_1057" } },
							-- Is that the Pact of Punishment...?
							{ Cue = "/VO/ZagreusHome_1057", PlayOnce = true, RequiredPlayed = { "/VO/ZagreusHome_1055" }, RequiredFalsePlayed = { "/VO/ZagreusHome_1056" } },
						}
					},
					{
						BreakIfPlayed = true,
						RequiresRunCleared = true,
						RequiredActiveShrinePointsMin = 1,
						RequiredMinShrinePointThresholdClear = 1,
						RequiredMinCompletedRuns = 1,
						RequiredScreenViewed = "ShrineUpgrade",
						CooldownName = "SkellySpeechCooldown",
						CooldownTime = 12,
						-- Hey, the Pact lit up, you must have done something!
						{ Cue = "/VO/Skelly_0275", PlayOnce = true, },
					},
					-- Weapon Enchantments / Weapon Aspects
					{
						BreakIfPlayed = true,
						RequiredQueuedTextLines = "SkellyAboutWeaponEnchantments01",

						-- Might want to check your stash of weapons over there...
						{ Cue = "/VO/Skelly_0249", PlayOnce = true, },
					},
					-- Trophy Quest
					{
						BreakIfPlayed = true,
						RequiredTrueFlags = { "TrophyQuestActive" },

						-- Hah you did it, boyo! Reward's right over there!
						{ Cue = "/VO/Skelly_0180", RequiredMinShrinePointThresholdClear = 8, RequiredFalseTextLines = { "TrophyQuest_BronzeUnlocked_01" }, PlayOnce = true, },
						-- Whoa-hoh you earned yourself another one, congrats!
						{ Cue = "/VO/Skelly_0185", RequiredMinShrinePointThresholdClear = 16, RequiredFalseTextLines = { "TrophyQuest_BronzeUnlocked_01", "TrophyQuest_SilverUnlocked_01" }, PlayOnce = true, },
						-- Well I'll be a hellhound's hindquarters, you really pulled it off.
						{ Cue = "/VO/Skelly_0186", RequiredMinShrinePointThresholdClear = 32, RequiredFalseTextLines = { "TrophyQuest_BronzeUnlocked_01", "TrophyQuest_SilverUnlocked_01", "TrophyQuest_GoldUnlocked_01" }, PlayOnce = true, },
					},

					-- Relationship Improved
					{
						RandomRemaining = true,
						UsePlayerSource = true,
						SuccessiveChanceToPlay =  0.25,
						RequiredPlayed = { "/VO/ZagreusField_0258" },
						RequiredFalseTextLinesThisRun = { "PersephoneMeeting05_A", "PersephoneMeeting05_B" },

						-- Hey mate.
						{ Cue = "/VO/ZagreusField_0340", RequiredTextLines = { "SkellyGift02" }, },
						-- Hey Skelly.
						{ Cue = "/VO/ZagreusField_0345", RequiredTextLines = { "SkellyGift05" }, },
						-- Hey, I'm back.
						{ Cue = "/VO/ZagreusHome_1398", RequiredTextLines = { "SkellyGift02" }, },
						-- Skelly!
						{ Cue = "/VO/ZagreusHome_1399", RequiredTextLines = { "SkellyGift03" }, },
						-- What's going on, Skelly?
						{ Cue = "/VO/ZagreusHome_1400", RequiredTextLines = { "SkellyGift06" }, },
						-- How's it going, Skelly?
						{ Cue = "/VO/ZagreusHome_1401", RequiredTextLines = { "SkellyGift05" }, },
						-- What's new, Skelly?
						{ Cue = "/VO/ZagreusHome_1402", RequiredTextLines = { "SkellyGift06" }, },
						-- Schelemeus.
						{ Cue = "/VO/ZagreusHome_3524", RequiredTextLines = { "SkellyBackstory03" }, },
						-- Captain.
						{ Cue = "/VO/ZagreusHome_3525", RequiredTextLines = { "SkellyBackstory05" }, },
						-- Skelly.
						{ Cue = "/VO/ZagreusHome_3526", RequiredTextLines = { "SkellyFirstMeeting" }, },
						-- What's going on, Skelly.
						{ Cue = "/VO/ZagreusHome_3527", RequiredTextLines = { "SkellyGift01" }, },
						-- Hey.
						{ Cue = "/VO/ZagreusHome_3528", RequiredTextLines = { "SkellyFirstMeeting" }, },
						-- How's it going.
						{ Cue = "/VO/ZagreusHome_3529", RequiredTextLines = { "SkellyFirstMeeting" }, },
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						PreLineWait = 0.3,
						SuccessiveChanceToPlay =  0.33,
						RequiredFalseTextLinesThisRun = { "PersephoneMeeting05_A", "PersephoneMeeting05_B" },

						-- What's up, boyo.
						{ Cue = "/VO/Skelly_0048" },
						-- 'Bout time you showed up!
						{ Cue = "/VO/Skelly_0122" },
						-- They always come back.
						{ Cue = "/VO/Skelly_0123" },
						-- Been waiting over here!
						{ Cue = "/VO/Skelly_0124" },
						-- Right on schedule!
						{ Cue = "/VO/Skelly_0125" },
						-- Hey!
						{ Cue = "/VO/Skelly_0126" },
						-- Been here the whole time!
						{ Cue = "/VO/Skelly_0127" },
						-- Haven't moved a muscle!
						{ Cue = "/VO/Skelly_0128" },
						-- There he is!
						{ Cue = "/VO/Skelly_0133" },
						-- Oh hey.
						{ Cue = "/VO/Skelly_0134" },
						-- What's the good word?
						{ Cue = "/VO/Skelly_0135" },
						-- Any luck last time?
						{ Cue = "/VO/Skelly_0136" },
						-- Looking good!
						{ Cue = "/VO/Skelly_0137" },
						-- Who's this handsome fellow?
						{ Cue = "/VO/Skelly_0148", RequiredTextLines = { "SkellyGift09" } },
						-- Hey I know that guy.
						{ Cue = "/VO/Skelly_0150", RequiredTextLines = { "SkellyGift06" } },
						-- Look at this guy over here.
						{ Cue = "/VO/Skelly_0151", RequiredTextLines = { "SkellyGift05" } },
						-- Hey how's it going?
						{ Cue = "/VO/Skelly_0152", RequiredTextLines = { "SkellyGift05" } },
						-- Heya.
						{ Cue = "/VO/Skelly_0506" },
						-- Hey, pal.
						{ Cue = "/VO/Skelly_0507" },
						-- Boyo.
						{ Cue = "/VO/Skelly_0508" },
						-- Boyo!
						{ Cue = "/VO/Skelly_0509" },
						-- Hey.
						{ Cue = "/VO/Skelly_0510" },
						-- There you are.
						{ Cue = "/VO/Skelly_0511" },
						-- I knew it.
						{ Cue = "/VO/Skelly_0512" },
						-- Back, huh.
						{ Cue = "/VO/Skelly_0513" },
						-- Need some practicing?
						{ Cue = "/VO/Skelly_0514" },
						-- Finally!
						{ Cue = "/VO/Skelly_0515" },
					}
				},
			},
		},

		ReverbValue = 1.5,

		InspectPoints =
		{
			[390005] =
			{
				PlayOnce = true,
				RequiredMinCompletedRuns = 2,
				UseText = "UseExamineMisc",
				InteractTextLineSets =
				{
					InspectPreRun01 =
					{
						-- It's not that orderly really.
						EndCue = "/VO/ZagreusHome_0340",
						EndWait = 0.3,
						{ Cue = "/VO/Storyteller_0117",
							Text = "{#DialogueItalicFormat}The courtyard of the House of Hades is kept neat and orderly, in contrast to the terrifying sprawl that lies beyond." },
					},
				},
			},
		},
	},
}

GlobalVoiceLines = GlobalVoiceLines or {}
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