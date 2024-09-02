package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CharacRepository;
import com.example.demo.vo.Charac;

@Service
public class MapService {

	// 맵 생성
	int[][] map;
	int mapHeight; // 맵 높이
	int mapWidth; // 맵 넓이

	// 캐릭터
	int charac = 1; // 캐릭터
	int characXCood; // 몬스터 x축 좌표
	int characYCood; // 몬스터 y축 좌표
	int characHeight = 5; // 캐릭터 높이
	int characWidth = 5; // 캐릭터 넓이

	int road = 0; // 빈공간
	int wall = 9; // 벽

	int mob2 = 2; // 몬스터
	int mob2XCood = (int) (Math.random() * ((15 - 10) + 1)) + 10; // 몬스터 x축 좌표
	int mob2YCood = (int) (Math.random() * ((44 - 10) + 1)) + 10; // 몬스터 y축 좌표
	int mob2Height = 5; // 몬스터 높이
	int mob2Width = 5; // 몬스터 넓이

	public int[][] mapCreation(int mapHeight, int mapWidth, int characXCood, int characYCood) {
		this.characXCood = characXCood;
		this.characYCood = characYCood;
		this.mapHeight = mapHeight;
		this.mapWidth = mapWidth;

		map = new int[mapHeight][mapWidth];

		// 맵 주위를 벽으로 변경
		for (int X = 0; X < mapHeight; X++) {
			for (int Y = 0; Y < mapWidth; Y++) {
				if (X == 0 || X == mapHeight - 1 || Y == 0 || Y == mapWidth - 1)
					map[X][Y] = wall;
			}
		}

		// 캐릭터 위치 부여
		for (int x = characXCood; x < characXCood + characHeight; x++) {
			for (int y = characYCood; y < characYCood + characWidth; y++) {
				map[x][y] = charac;
			}
		}

		/*
		 * // 몬스터 위치 부여 for (int x = mob2XCood; x < mob2XCood + mob2Height; x++) { for
		 * (int y = mob2YCood; y < mob2YCood + mob2Width; y++) { map[x][y] = 2; } }
		 */

		// 맵 상황 확인
		for (int X = 0; X < mapHeight; X++) {
			for (int Y = 0; Y < mapWidth; Y++) {
				System.err.print(map[X][Y]);
			}
			System.err.println();
		}

		return map;
	}

	public String keyUp(int something) {		
		if (map[characXCood - 1][characYCood] <= 1 && map[characXCood - 1][characYCood + 1] <= 1
				&& map[characXCood - 1][characYCood + 2] <= 1 && map[characXCood - 1][characYCood + 3] <= 1
				&& map[characXCood - 1][characYCood + 4] <= 1) {

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = road;
				}
			}

			characXCood--;

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = something;
				}
			}

			/*
			 * if (something == charac) { characXCood--; } 
			 * else if (something == mob2) {
			 * mob2XCood--; 
			 * }
			 */
		} else {
			return "Lost";
		}
		// 맵 상황 확인
		for (int X = 0; X < mapHeight; X++) {
			for (int Y = 0; Y < mapWidth; Y++) {
				System.err.print(map[X][Y]);
			}
			System.err.println();
		}
		return "success";
	}

	public String keyDown(int something) {
		if (map[characXCood + 5][characYCood] <= 1 && map[characXCood + 5][characYCood + 1] <= 1
				&& map[characXCood + 5][characYCood + 2] <= 1 && map[characXCood + 5][characYCood + 3] <= 1
				&& map[characXCood + 5][characYCood + 4] <= 1) {

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = road;
				}
			}

			characXCood++;

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = something;
				}
			}

			/*
			 * if (something == charac) { characXCood--; } 
			 * else if (something == mob2) {
			 * mob2XCood--; 
			 * }
			 */
		} else {
			return "Lost";
		}
		// 맵 상황 확인
		for (int X = 0; X < mapHeight; X++) {
			for (int Y = 0; Y < mapWidth; Y++) {
				System.err.print(map[X][Y]);
			}
			System.err.println();
		}
		return "success";
	}

	public String keyLeft(int something) {
		if (map[characXCood][characYCood - 1] <= 1 && map[characXCood + 1][characYCood - 1] <= 1
				&& map[characXCood + 2][characYCood - 1] <= 1 && map[characXCood + 3][characYCood - 1] <= 1
				&& map[characXCood + 4][characYCood - 1] <= 1) {

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = road;
				}
			}

			characYCood--;

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = something;
				}
			}

			/*
			 * if (something == charac) { characXCood--; } 
			 * else if (something == mob2) {
			 * mob2XCood--; 
			 * }
			 */
		} else {
			return "Lost";
		}
		// 맵 상황 확인
		for (int X = 0; X < mapHeight; X++) {
			for (int Y = 0; Y < mapWidth; Y++) {
				System.err.print(map[X][Y]);
			}
			System.err.println();
		}
		return "success";
	}

	public String keyRight(int something) {
		if (map[characXCood][characYCood + 5] <= 1 && map[characXCood + 1][characYCood + 5] <= 1
				&& map[characXCood + 2][characYCood + 5] <= 1 && map[characXCood + 3][characYCood + 5] <= 1
				&& map[characXCood + 4][characYCood + 5] <= 1) {

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = road;
				}
			}

			characYCood++;

			for (int x = characXCood; x < characXCood + characHeight; x++) {
				for (int y = characYCood; y < characYCood + characWidth; y++) {
					map[x][y] = something;
				}
			}

			/*
			 * if (something == charac) { characXCood--; } 
			 * else if (something == mob2) {
			 * mob2XCood--; 
			 * }
			 */
		} else {
			return "Lost";
		}
		// 맵 상황 확인
		for (int X = 0; X < mapHeight; X++) {
			for (int Y = 0; Y < mapWidth; Y++) {
				System.err.print(map[X][Y]);
			}
			System.err.println();
		}
		return "success";
	}

}