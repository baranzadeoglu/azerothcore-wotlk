INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1634824422202732820');

-- *** Quest "Abduction" ***
-- Condition for source Spell condition type Object entry guid
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=45611 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17, 0, 45611, 0, 0, 31, 1, 3, 25316, 0, 0, 12, 0, '', 'Spell Arcane Chains will hit the explicit target of the spell if target is unit Beryl Sorcerer.'),
(17, 0, 45611, 0, 0, 38, 1, 25, 4, 0, 0, 12, 0, '', 'Spell Arcane Chains will hit the explicit target of the spell if target health percentage must be equal or lower than 25% of max Health.');

DELETE FROM `spell_script_names` WHERE `spell_id`= 45625;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45625, 'spell_arcane_chains_character_force_cast');

-- Update creatures
UPDATE `creature_template` SET `minlevel`=69, `maxlevel`=70, `unit_flags`=32768, `unit_class`=8, `ScriptName`='npc_captured_beryl_sorcerer' WHERE `entry`=25474;

-- Condition for source Spell implicit target condition type Object entry guid
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=45735 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 45735, 0, 0, 31, 0, 3, 25474, 0, 0, 0, 0, '', 'Spell Arcane Chains: Chain Channel II (effect 0) will hit the target of the spell if target is unit Captured Beryl Sorcerer.');