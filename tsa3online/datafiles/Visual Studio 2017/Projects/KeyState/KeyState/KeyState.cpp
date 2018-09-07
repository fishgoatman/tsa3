// KeyState.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "Windows.h"

int main()
{
	while (true) {
		for (int i = 0; i < 256; ++i) {
			if (GetAsyncKeyState(i) & 0x8000) {
				printf("%d ", i);
			}
		}
		printf("                             \r");
		if (GetAsyncKeyState(0x58) & 0x8000) {
			printf("\nX\n");
			break;
		}

		Sleep(200);
	}
    return 0;
}

