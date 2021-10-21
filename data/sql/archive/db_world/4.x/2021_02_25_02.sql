-- DB update 2021_02_25_01 -> 2021_02_25_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_02_25_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_02_25_01 2021_02_25_02 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1614022899539097500'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1614022899539097500');

UPDATE `creature_template` SET `unit_flags` = 4608, `type` = 6 WHERE `entry` IN (1735,5725,3547,2314,1743,1515,2114,1518,10055,1745,2309,4773,4731,2311,2137,33996,1746,1652,2135,2136,2118,2134,1738,1742,10665,10666);
UPDATE `creature_template` SET `unit_flags` = 4608, `type` = 7 WHERE `entry` = 727;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;