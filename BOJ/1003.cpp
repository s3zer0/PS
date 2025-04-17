#include <iostream>

void solution(int n) {
    int arr[41][2] = {{1, 0}, {0, 1}, };

    for(int i = 2; i <= n; i++) {
        arr[i][0] = arr[i - 1][0] + arr[i - 2][0];
        arr[i][1] = arr[i - 1][1] + arr[i - 2][1];
    }

    printf("%d %d\n", arr[n][0], arr[n][1]);
}

int main() {
    int a;
    scanf("%d", &a);

    int n;
    for(int i = 0; i < a; i++) {
        scanf("%d", &n);
        solution(n);
    }
}
