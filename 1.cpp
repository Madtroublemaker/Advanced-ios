#include <iostream>

using namespace std;

int main() {
    int answer, correctAnswer, mistakes = 0;

    // Проверка умножения чисел от 2 до 5
    for (int num = 2; num <= 5; num++) {
        for (int i = 1; i <= 10; i++) {
            cout << "Сколько будет " << num << " * " << i << "? ";
            cin >> answer;
            correctAnswer = num * i;
            if (answer != correctAnswer) {
                cout << "Неправильно. Правильный ответ: " << correctAnswer << endl;
                mistakes++;
            }
        }
    }

    // Оценка по количеству ошибок
    cout << "Количество ошибок: " << mistakes << endl;

    if (mistakes == 0) {
        cout << "Оценка: 5" << endl;
    } else if (mistakes <= 3) {
        cout << "Оценка: 4" << endl;
    } else if (mistakes <= 10) {
        cout << "Оценка: 3" << endl;
    } else {
        cout << "Оценка: 2" << endl;
    }

    return 0;
}
