package com.example.demo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class MapService {

	// 맵 생성
	// int[][] map;
	int mapHeight; // 맵 높이
	int mapWidth; // 맵 넓이

	// 스테이지 정보
	int floor;
	int room;

	// 캐릭터
	int charac = 1; // 캐릭터
	int characXCode; // 몬스터 x축 좌표
	int characYCode; // 몬스터 y축 좌표
	int characHeight = 5; // 캐릭터 높이
	int characWidth = 5; // 캐릭터 넓이

	int road = 0; // 빈공간
	int wall = 9; // 벽

	int mob2 = 2; // 몬스터
	int mob2XCode; // 몬스터 x축 좌표
	int mob2YCode; // 몬스터 y축 좌표
	int mob2Height = 5; // 몬스터 높이
	int mob2Width = 5; // 몬스터 넓이
	boolean mob2life; // 몬스터가 죽었는지 살았는지 여부

	int mob3 = 3; // 몬스터
	int mob3XCode; // 몬스터 x축 좌표
	int mob3YCode; // 몬스터 y축 좌표
	int mob3Height = 5; // 몬스터 높이
	int mob3Width = 5; // 몬스터 넓이
	boolean mob3life; // 몬스터가 죽었는지 살았는지 여부

	int mob4 = 4; // 몬스터
	int mob4XCode; // 몬스터 x축 좌표
	int mob4YCode; // 몬스터 y축 좌표
	int mob4Height = 5; // 몬스터 높이
	int mob4Width = 5; // 몬스터 넓이
	boolean mob4life; // 몬스터가 죽었는지 살았는지 여부

	int mob5 = 5; // 몬스터
	int mob5XCode; // 몬스터 x축 좌표
	int mob5YCode; // 몬스터 y축 좌표
	int mob5Height = 5; // 몬스터 높이
	int mob5Width = 5; // 몬스터 넓이
	boolean mob5life; // 몬스터가 죽었는지 살았는지 여부

	int mob6 = 6; // 보스 몬스터
	int mob6XCode; // 몬스터 x축 좌표
	int mob6YCode; // 몬스터 y축 좌표
	int mob6Height = 10; // 보스 몬스터 높이
	int mob6Width = 10; // 보스 몬스터 넓이
	boolean mob6life; // 몬스터가 죽었는지 살았는지 여부

	public Map<String, Integer> mapCreation(int mapHeight, int mapWidth, int characXCode, int characYCode, int floor,
			int room) {
		this.characXCode = characXCode;
		this.characYCode = characYCode;
		this.mapHeight = mapHeight;
		this.mapWidth = mapWidth;
		this.floor = floor;
		this.room = room;

		// 몬스터 위치 부여
		if (room > 0 && room < 5) {
			int mob2XCode = (int) (Math.random() * 36 + 1); // 좌표 랜덤 지정
			int mob2YCode = (int) (Math.random() * ((36 - 10) + 1)) + 10; // 좌표 랜덤 지정
			this.mob2XCode = mob2XCode;
			this.mob2YCode = mob2YCode;
			mob2life = true;
		}
		if (room > 1 && room < 5) {
			int mob3XCode = (int) (Math.random() * 36 + 1); // 좌표 랜덤 지정
			int mob3YCode = (int) (Math.random() * ((36 - 10) + 1)) + 10; // 좌표 랜덤 지정
			this.mob3XCode = mob3XCode;
			this.mob3YCode = mob3YCode;
			mob3life = true;
		}
		if (room > 2 && room < 5) {
			int mob4XCode = (int) (Math.random() * 36 + 1); // 좌표 랜덤 지정
			int mob4YCode = (int) (Math.random() * ((36 - 10) + 1)) + 10; // 좌표 랜덤 지정
			this.mob4XCode = mob4XCode;
			this.mob4YCode = mob4YCode;
			mob4life = true;
		}
		if (room > 3 && room < 5) {
			int mob5XCode = (int) (Math.random() * 36 + 1); // 좌표 랜덤 지정
			int mob5YCode = (int) (Math.random() * ((36 - 10) + 1)) + 10; // 좌표 랜덤 지정
			this.mob5XCode = mob5XCode;
			this.mob5YCode = mob5YCode;
			mob5life = true;
		}
		if (floor > 1 && room == 0) {
			int mob6XCode = (int) (Math.random() * 31 + 1); // 좌표 랜덤 지정
			int mob6YCode = (int) (Math.random() * ((31 - 10) + 1)) + 10; // 좌표 랜덤 지정
			this.mob6XCode = mob6XCode;
			this.mob6YCode = mob6YCode;
			mob6life = true;
		}

		// 몹의 좌표들 저장할 맵 생성
		Map<String, Integer> codes = new HashMap<String, Integer>();

		// 몹의 좌표들 넘겨주기
		codes.put("mob2XCode", mob2XCode);
		codes.put("mob2YCode", mob2YCode);
		codes.put("mob3XCode", mob3XCode);
		codes.put("mob3YCode", mob3YCode);
		codes.put("mob4XCode", mob4XCode);
		codes.put("mob4YCode", mob4YCode);
		codes.put("mob5XCode", mob5XCode);
		codes.put("mob5YCode", mob5YCode);
		codes.put("mob6XCode", mob6XCode);
		codes.put("mob6YCode", mob6YCode);

		return codes;
	}

	public String keyUp(int something) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);

		// 맵 생성
		int[][] map = mapChack(something);

		// something 주위 공간 확인
		for (int y = Ycode; y < Ycode + width; y++) {
			if (map[Xcode - 1][y] == charac) {
				return "charac";
			} else if (map[Xcode - 1][y] != road) {
				return "Lost";
			}
		}

		if (something == charac) {
			characXCode--;
		} else if (something == mob2) {
			mob2XCode--;
		} else if (something == mob3) {
			mob3XCode--;
		} else if (something == mob4) {
			mob4XCode--;
		} else if (something == mob5) {
			mob5XCode--;
		} else if (something == mob6) {
			mob6XCode--;
		}

		// 맵 상황 확인

		Xcode--;

		for (int x = Xcode; x < Xcode + height; x++) {
			for (int y = Ycode; y < Ycode + width; y++) {
				map[x][y] = something;
			}
		}

		/*
		 * if (something == charac) {
		 * System.out.println("=========================================="); 
		 * for (int X *= 0; X < mapHeight; X++) {
		 *     for (int Y = 0; Y < mapWidth; Y++) {
		 *         System.err.print(map[X][Y]); 
		 *         } System.err.println(); 
		 *     } 
		 * }
		 */
		return "success";
	}

	private int[][] mapChack(int something) {

		// 맵 생성
		int[][] map = new int[mapHeight][mapWidth];

		// 벽 위치 부여
		for (int X = 0; X < mapHeight; X++) {
			for (int Y = 0; Y < mapWidth; Y++) {
				if (X == 0 || X == mapHeight - 1 || Y == 0 || Y == mapWidth - 1)
					map[X][Y] = wall;
			}
		}

		// 캐릭터 위치 부여
		if (something != charac) {
			for (int x = characXCode; x < characXCode + characHeight; x++) {
				for (int y = characYCode; y < characYCode + characWidth; y++) {
					map[x][y] = charac;
				}
			}
		}

		// 몬스터 위치 부여
		if (room > 0 && room < 5 && mob2life && something != mob2) {
			for (int x = mob2XCode; x < mob2XCode + mob2Height; x++) {
				for (int y = mob2YCode; y < mob2YCode + mob2Width; y++) {
					map[x][y] = mob2;
				}
			}
		}
		if (room > 1 && room < 5 && mob3life && something != mob3) {
			for (int x = mob3XCode; x < mob3XCode + mob3Height; x++) {
				for (int y = mob3YCode; y < mob3YCode + mob3Width; y++) {
					map[x][y] = mob3;
				}
			}
		}
		if (room > 2 && room < 5 && mob4life && something != mob4) {
			for (int x = mob4XCode; x < mob4XCode + mob4Height; x++) {
				for (int y = mob4YCode; y < mob4YCode + mob4Width; y++) {
					map[x][y] = mob4;
				}
			}
		}
		if (room > 3 && room < 5 && mob5life && something != mob5) {
			for (int x = mob5XCode; x < mob5XCode + mob5Height; x++) {
				for (int y = mob5YCode; y < mob5YCode + mob5Width; y++) {
					map[x][y] = mob5;
				}
			}
		}
		if (floor > 1 && room == 0 && mob6life && something != mob6) {
			for (int x = mob6XCode; x < mob6XCode + mob6Height; x++) {
				for (int y = mob6YCode; y < mob6YCode + mob6Width; y++) {
					map[x][y] = mob6;
				}
			}
		}
		return map;
	}

	// 어떤 캐릭터가 실행했는지 확인 후 변수에 옮겨담기
	private int somethingXcode(int something) {
		if (something == charac) { // 캐릭터 이동시
			return characXCode;
		} else if (something == mob2) { // 첫번째 몬스터 이동시
			return mob2XCode;
		} else if (something == mob3) { // 두번째 몬스터 이동시
			return mob3XCode;
		} else if (something == mob4) { // 세번째 몬스터 이동시
			return mob4XCode;
		} else if (something == mob5) { // 네번째 몬스터 이동시
			return mob5XCode;
		} else if (something == mob6) { // 보스 몬스터 이동시
			return mob6XCode;
		}
		return 0;
	}

	private int somethingYcode(int something) {
		if (something == charac) { // 캐릭터 이동시
			return characYCode;
		} else if (something == mob2) { // 첫번째 몬스터 이동시
			return mob2YCode;
		} else if (something == mob3) { // 두번째 몬스터 이동시
			return mob3YCode;
		} else if (something == mob4) { // 세번째 몬스터 이동시
			return mob4YCode;
		} else if (something == mob5) { // 네번째 몬스터 이동시
			return mob5YCode;
		} else if (something == mob6) { // 보스 몬스터 이동시
			return mob6YCode;
		}
		return 0;
	}

	private int somethingHeight(int something) {
		if (something == charac) { // 캐릭터 이동시
			return characHeight;
		} else if (something == mob2) { // 첫번째 몬스터 이동시
			return mob2Height;
		} else if (something == mob3) { // 두번째 몬스터 이동시
			return mob3Height;
		} else if (something == mob4) { // 세번째 몬스터 이동시
			return mob4Height;
		} else if (something == mob5) { // 네번째 몬스터 이동시
			return mob5Height;
		} else if (something == mob6) { // 보스 몬스터 이동시
			return mob6Height;
		}
		return 0;
	}

	private int somethingWidth(int something) {
		if (something == charac) { // 캐릭터 이동시
			return characWidth;
		} else if (something == mob2) { // 첫번째 몬스터 이동시
			return mob2Width;
		} else if (something == mob3) { // 두번째 몬스터 이동시
			return mob3Width;
		} else if (something == mob4) { // 세번째 몬스터 이동시
			return mob4Width;
		} else if (something == mob5) { // 네번째 몬스터 이동시
			return mob5Width;
		} else if (something == mob6) { // 보스 몬스터 이동시
			return mob6Width;
		}
		return 0;
	}

	public String keyDown(int something) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);

		// 맵 생성
		int[][] map = mapChack(something);

		// something 주위 공간 확인
		for (int y = Ycode; y < Ycode + width; y++) {
			if (map[Xcode + height][y] == charac) {
				return "charac";
			} else if (map[Xcode + height][y] != road) {
				return "Lost";
			}
		}

		if (something == charac) {
			characXCode++;
		} else if (something == mob2) {
			mob2XCode++;
		} else if (something == mob3) {
			mob3XCode++;
		} else if (something == mob4) {
			mob4XCode++;
		} else if (something == mob5) {
			mob5XCode++;
		} else if (something == mob6) {
			mob6XCode++;
		}

		// 맵 상황 확인

		Xcode++;

		for (int x = Xcode; x < Xcode + height; x++) {
			for (int y = Ycode; y < Ycode + width; y++) {
				map[x][y] = something;
			}
		}

		/*
		 * if (something == charac) {
		 * System.out.println("=========================================="); 
		 * for (int X *= 0; X < mapHeight; X++) {
		 *     for (int Y = 0; Y < mapWidth; Y++) {
		 *         System.err.print(map[X][Y]); 
		 *         } System.err.println(); 
		 *     } 
		 * }
		 */
		return "success";
	}

	public String keyLeft(int something) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);

		// 맵 생성
		int[][] map = mapChack(something);

		// something 주위 공간 확인
		for (int x = Xcode; x < Xcode + height; x++) {
			if (map[x][Ycode - 1] == charac) {
				return "charac";
			} else if (map[x][Ycode - 1] != road) {
				return "Lost";
			}
		}

		if (something == charac) {
			characYCode--;
		} else if (something == mob2) {
			mob2YCode--;
		} else if (something == mob3) {
			mob3YCode--;
		} else if (something == mob4) {
			mob4YCode--;
		} else if (something == mob5) {
			mob5YCode--;
		} else if (something == mob6) {
			mob6YCode--;
		}

		// 맵 상황 확인

		Ycode--;

		for (int x = Xcode; x < Xcode + height; x++) {
			for (int y = Ycode; y < Ycode + width; y++) {
				map[x][y] = something;
			}
		}

		/*
		 * if (something == charac) {
		 * System.out.println("=========================================="); 
		 * for (int X *= 0; X < mapHeight; X++) {
		 *     for (int Y = 0; Y < mapWidth; Y++) {
		 *         System.err.print(map[X][Y]); 
		 *         } System.err.println(); 
		 *     } 
		 * }
		 */
		return "success";
	}

	public String keyRight(int something) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);

		// 맵 생성
		int[][] map = mapChack(something);

		// something 주위 공간 확인
		for (int x = Xcode; x < Xcode + height; x++) {
			if (map[x][Ycode + width] == charac) {
				return "charac";
			} else if (map[x][Ycode + width] != road) {
				/*
				 * if (something == charac) {
				 * System.out.println("=========================================="); 
				 * for (int X *= 0; X < mapHeight; X++) {
				 *     for (int Y = 0; Y < mapWidth; Y++) {
				 *         System.err.print(map[X][Y]); 
				 *         } System.err.println(); 
				 *     } 
				 * }
				 */
				return "Lost";
			}
		}

		if (something == charac) {
			characYCode++;
		} else if (something == mob2) {
			mob2YCode++;
		} else if (something == mob3) {
			mob3YCode++;
		} else if (something == mob4) {
			mob4YCode++;
		} else if (something == mob5) {
			mob5YCode++;
		} else if (something == mob6) {
			mob6YCode++;
		}

		// 맵 상황 확인

		Ycode++;

		for (int x = Xcode; x < Xcode + height; x++) {
			for (int y = Ycode; y < Ycode + width; y++) {
				map[x][y] = something;
			}
		}

		/*
		 * if (something == charac) {
		 * System.out.println("=========================================="); 
		 * for (int X *= 0; X < mapHeight; X++) {
		 *     for (int Y = 0; Y < mapWidth; Y++) {
		 *         System.err.print(map[X][Y]); 
		 *         } System.err.println(); 
		 *     } 
		 * }
		 */
		return "success";
	}

	public int Aattack(int something, int weaponId) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);
		
		int distance = 3;
		if (something == charac) {
			distance = somethingdistance(weaponId);
		}

		// 맵 생성
		int[][] map = mapChack(something);

		int x = Xcode + ((height - 1) / 2);
		int y = -1;
		if (Ycode - distance >= 0)
			y = Ycode - distance;
		if (y == -1)
			return -1;
		return map[x][y];
	}

	public int Wattack(int something, int weaponId) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);
		
		int distance = 3;
		if (something == charac) {
			distance = somethingdistance(weaponId);
		}

		// 맵 생성
		int[][] map = mapChack(something);

		int x = -1;
		int y = Ycode + ((width - 1) / 2);
		if (Xcode - distance >= 0)
			x = Xcode - distance;
		if (x == -1)
			return -1;
		return map[x][y];
	}

	public int Dattack(int something, int weaponId) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);
		
		int distance = 3;
		if (something == charac) {
			distance = somethingdistance(weaponId);
		}

		// 맵 생성
		int[][] map = mapChack(something);

		int x = Xcode + ((height - 1) / 2);
		int y = -1;
		if (Ycode + width + distance < mapWidth)
			y = Ycode + width + distance;
		if (y == -1)
			return -1;
		return map[x][y];
	}

	public int Sattack(int something, int weaponId) {
		int Xcode = somethingXcode(something);
		int Ycode = somethingYcode(something);
		int height = somethingHeight(something);
		int width = somethingWidth(something);
		
		int distance = 3;
		if (something == charac) {
			distance = somethingdistance(weaponId);
		}

		// 맵 생성
		int[][] map = mapChack(something);

		int x = -1;
		int y = Ycode + ((width - 1) / 2);
		if (Xcode + height + distance < mapHeight) {
			x = Xcode + height + distance;
		}
		if (x == -1)
			return -1;
		return map[x][y];
	}

	private int somethingdistance(int weaponId) {
		if (weaponId%10 == 1) {
			return 3;
		} else if (weaponId%10 == 2) {
			return 4;
		} else if (weaponId%10 == 3) {
			return 5;
		} else if (weaponId%10 == 4) {
			return 6;
		} else if (weaponId%10 == 5) {
			return 7;
		} else if (weaponId%10 == 6) {
			return 8;
		} else if (weaponId%10 == 7) {
			return 9;
		} else if (weaponId%10 == 8) {
			return 10;
		} else if (weaponId%10 == 9) {
			return 11;
		} else if (weaponId%10 == 0) {
			return 12;
		}
		return 0;
	}

	public void doDelete(int something) {
		if (something == mob2) {
			mob2life = false;
		} else if (something == mob3) {
			mob3life = false;
		} else if (something == mob4) {
			mob4life = false;
		} else if (something == mob5) {
			mob5life = false;
		} else if (something == mob6) {
			mob6life = false;
		}
	}

}