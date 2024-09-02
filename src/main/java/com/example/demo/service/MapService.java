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
	
	int mob3 = 3; // 몬스터
	int mob3XCood = (int) (Math.random() * ((15 - 10) + 1)) + 10; // 몬스터 x축 좌표
	int mob3YCood = (int) (Math.random() * ((44 - 10) + 1)) + 10; // 몬스터 y축 좌표
	int mob3Height = 5; // 몬스터 높이
	int mob3Width = 5; // 몬스터 넓이
	
	int mob4 = 4; // 몬스터
	int mob4XCood = (int) (Math.random() * ((15 - 10) + 1)) + 10; // 몬스터 x축 좌표
	int mob4YCood = (int) (Math.random() * ((44 - 10) + 1)) + 10; // 몬스터 y축 좌표
	int mob4Height = 5; // 몬스터 높이
	int mob4Width = 5; // 몬스터 넓이
	
	int mob5 = 5; // 몬스터
	int mob5XCood = (int) (Math.random() * ((15 - 10) + 1)) + 10; // 몬스터 x축 좌표
	int mob5YCood = (int) (Math.random() * ((44 - 10) + 1)) + 10; // 몬스터 y축 좌표
	int mob5Height = 5; // 몬스터 높이
	int mob5Width = 5; // 몬스터 넓이
	
	int mob6 = 6; // 보스 몬스터
	int mob6XCood = (int) (Math.random() * ((15 - 10) + 1)) + 10; // 보스 몬스터 x축 좌표
	int mob6YCood = (int) (Math.random() * ((39 - 10) + 1)) + 10; // 보스 몬스터 y축 좌표
	int mob6Height = 10; // 보스 몬스터 높이
	int mob6Width = 10; // 보스 몬스터 넓이

	public int[][] mapCreation(int mapHeight, int mapWidth, int characXCood, int characYCood, int floor, int room) {
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

		// 몬스터 위치 부여
		if (room > 0 && room < 5) {
			for (int x = mob2XCood; x < mob2XCood + mob2Height; x++) {
				for (int y = mob2YCood; y < mob2YCood + mob2Width; y++) {
					map[x][y] = mob2;
				}
			}
		}
		if (room > 1 && room < 5) {
			for (int x = mob3XCood; x < mob3XCood + mob3Height; x++) {
				for (int y = mob3YCood; y < mob3YCood + mob3Width; y++) {
					map[x][y] = mob3;
				}
			}
		}
		if (room > 2 && room < 5) {
			for (int x = mob4XCood; x < mob4XCood + mob4Height; x++) {
				for (int y = mob4YCood; y < mob4YCood + mob4Width; y++) {
					map[x][y] = mob4;
				}
			}
		}
		if (room > 3 && room < 5) {
			for (int x = mob5XCood; x < mob5XCood + mob5Height; x++) {
				for (int y = mob2YCood; y < mob2YCood + mob2Width; y++) {
					map[x][y] = mob5;
				}
			}
		}
		if (room == 5) {
			for (int x = mob6XCood; x < mob6XCood + mob6Height; x++) {
				for (int y = mob6YCood; y < mob6YCood + mob6Width; y++) {
					map[x][y] = mob6;
				}
			}
		}

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
			 * if (something == charac) { characXCood--; } else if (something == mob2) {
			 * mob2XCood--; }
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
			 * if (something == charac) { characXCood--; } else if (something == mob2) {
			 * mob2XCood--; }
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
			 * if (something == charac) { characXCood--; } else if (something == mob2) {
			 * mob2XCood--; }
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
			 * if (something == charac) { characXCood--; } else if (something == mob2) {
			 * mob2XCood--; }
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