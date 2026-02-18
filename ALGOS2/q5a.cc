// Jin Zhao 251138547
// recursive fcn to compute Fn using defn of Fib numbers, print F_i*5, where i = 0, 1, ..., 10
#include <iostream>
#include <iterator>
#include <ostream>
#include <sstream>
#include <string>
#include <tuple>
#include <list>

using namespace std;

long long compute_fib(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return compute_fib(n - 1) + compute_fib(n - 2);
}

int main() {
    for (int i = 0; i <= 10; i++) {
        cout << "F_" << i * 5 << " = " << compute_fib(i * 5) << endl;
    }
    return 0;
}