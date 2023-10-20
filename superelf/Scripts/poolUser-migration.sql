-- UPDATE POOLUSER
update poolUsers set poolId = 15, admin = 0 where id = 127;

-- CREATE COMPETITION COMPETITOR
insert into competitors (categoryNr, pouleNr, placeNr, registered, info, poolUserId, competitionId) values(1,1,16,0,null, 127, 40);

-- CREATE COMPETITION PLACE
INSERT INTO places (placeNr, name, extraPoints, qualifiedPlaceId, pouleId) VALUES(16, NULL, 0, NULL, 97); --418


-- CREATE COMPETITION TOGETHERGAMEPLACES
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(3, 418, 207);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(5, 418, 208);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(6, 418, 209);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(7, 418, 210);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(8, 418, 211);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(9, 418, 212);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(10, 418, 213);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(11, 418, 214);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(12, 418, 215);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(13, 418, 216);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(14, 418, 217);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(15, 418, 218);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(16, 418, 219);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(17, 418, 220);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(18, 418, 221);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(19, 418, 222);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(20, 418, 223);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(21, 418, 224);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(22, 418, 225);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(23, 418, 226);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(24, 418, 227);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(25, 418, 228);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(26, 418, 229);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(27, 418, 230);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(28, 418, 231);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(29, 418, 232);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(30, 418, 233);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(31, 418, 234);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(32, 418, 235);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(33, 418, 236);
INSERT INTO togetherGamePlaces (gameRoundNumber, placeId, gameId) VALUES(34, 418, 237); 


-- CREATE CUP COMPETITOR
insert into competitors (categoryNr, pouleNr, placeNr, registered, info, poolUserId, competitionId) values(1,8,2,0,null, 127, 41);

-- CREATE COMPETITION PLACE
INSERT INTO places (placeNr, name, extraPoints, qualifiedPlaceId, pouleId) VALUES(2, NULL, 0, NULL, 98); -- 417

-- CREATE CUP GAMES
INSERT INTO againstGames (resourcebatch, state, startDateTime, gameRoundNumber, homeExtraPoints, awayExtraPoints, refereeId, placerefereeId, fieldId, competitionSportId, pouleId) VALUES(22, 1, '2023-09-16 14:00:00.000', 9, 0, 0, NULL, NULL, NULL, 41, 106);
INSERT INTO againstGames (resourcebatch, state, startDateTime, gameRoundNumber, homeExtraPoints, awayExtraPoints, refereeId, placerefereeId, fieldId, competitionSportId, pouleId) VALUES(23, 1, '2023-09-16 14:00:00.000', 10, 0, 0, NULL, NULL, NULL, 41, 106);
INSERT INTO againstGames (resourcebatch, state, startDateTime, gameRoundNumber, homeExtraPoints, awayExtraPoints, refereeId, placerefereeId, fieldId, competitionSportId, pouleId) VALUES(24, 1, '2023-09-16 14:00:00.000', 11, 0, 0, NULL, NULL, NULL, 41, 106);

-- CREATE CUP GAMEPLACES
INSERT INTO againstGamePlaces (side, placeId, gameId) VALUES(1, 322, 1283);
INSERT INTO againstGamePlaces (side, placeId, gameId) VALUES(2, 417, 1283);
INSERT INTO againstGamePlaces (side, placeId, gameId) VALUES(1, 322, 1284);
INSERT INTO againstGamePlaces (side, placeId, gameId) VALUES(2, 417, 1284);
INSERT INTO againstGamePlaces (side, placeId, gameId) VALUES(1, 322, 1285);
INSERT INTO againstGamePlaces (side, placeId, gameId) VALUES(2, 417, 1285);