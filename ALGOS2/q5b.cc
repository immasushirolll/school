// Jin Zhao 251138547
#include <iostream>
#include <iterator>
#include <ostream>
#include <sstream>
#include <string>
#include <tuple>
#include <list>

class big_int {
    std::list<int> digits;

public:
    big_int() {
        digits = std::list<int>(1, 0);
    }

    big_int(int value) {
        digits = std::list<int>();
        std::string value_str = std::to_string(value);
        for (int digit_index = value_str.length() - 1; digit_index >= 0; digit_index--) {
            digits.push_back(value_str[digit_index] - '0');
        }
    }

    std::list<int>::iterator begin() {
        return digits.begin();
    }

    std::list<int>::iterator end() {
        return digits.end();
    }

    std::list<int> get_digits() {
        return digits;
    }

    void add(big_int right_operand) {
        std::list<int>::iterator left_it = digits.begin();
        std::list<int>::iterator right_it = right_operand.begin();

        int carry = 0;

        while (left_it != digits.end() && right_it != right_operand.end()) {
            *left_it += *right_it + carry;
            carry = 0;

            if (*left_it > 9) {
                carry = *left_it / 10;
                *left_it -= carry * 10;
            }

            ++left_it;
            ++right_it;
        }

        if (right_it != right_operand.end()) {
            left_it--;
            digits.splice(digits.end(), right_operand.get_digits(), right_it, right_operand.end());
            left_it++;
        }

        while (carry != 0 && left_it != digits.end()) {
            *left_it += carry;
            carry = 0;

            if (*left_it > 9) {
                carry = *left_it / 10;
                *left_it -= carry * 10;
            }

            ++left_it;
        }

        if (carry != 0) {
            digits.push_back(carry);
        }
    }

    std::string to_string() {
        std::stringstream result;
        for (std::list<int>::reverse_iterator it = digits.rbegin(); it != digits.rend(); ++it) {
            result << *it;
        }
        return result.str();
    }
};

std::tuple<big_int, big_int> compute_fib_better(int n)
{
    if (n < 0)
        return std::make_tuple(big_int(0), big_int(0));
    else if (n == 0)
        return std::make_tuple(big_int(2), big_int(0));
    else if (n == 1)
        return std::make_tuple(big_int(2), big_int(2));

    std::tuple<big_int, big_int> prev_pair = compute_fib_better(n - 1);

    big_int previous = std::get<0>(prev_pair);
    big_int current = std::get<1>(prev_pair);

    current.add(previous);

    return std::make_tuple(current, previous);
}

int main()
{
    for (int i = 0; i <= 25; i++) {
        std::cout << std::get<0>(compute_fib_better(i * 20)).to_string() << std::endl;
    }
}

// Output:
// 2
// 21892
// 331160282
// 5009461563922
// 75778124746287812
// 1146295688027634168202
// 17340014797015897316103842
// 262302402688163790673068649732
// 3967848428123838864495612148392122
// 60021642909926907815061334295658979762
// 907947388330615906394593939394821238467652
// 13734520083255583906104114706164126578641192042
// 207762084391459829417021036765550803360284073551682
// 3142817036855092756335693317048372296266890601975101572
// 47541393108744903733630203389969690960078450775793287927962
// 719158650413167121923531330344378198104734428618534464511179602
// 10878712857258585944592354700489205612760626741634120068867325911492
// 164562288672591979170681427630768882959851802615964905663221574551959882
// 2489333729871586011656312011178286192044472605411074386333432689380171223522
// 37656151167205192925733052622412507596287854142201519626100930629032275546257412
// 569624596216979223515977875362921991230760177564609781972954391291938542808064647802
// 8616711229318093546921004394881868338935201609731998029703361450972223708025318381043442
// 130344990196270204867294809965400147000150803519655756630712966695902436739360448341979499332
// 1971728658082268159709475043425603628789412865906631020820797017505554709584081794043805505351722
// 29826339280465480255655024114604296127297301422418803932300439853093559395975968559140197537475999362
// 451183032323872661745025390072144144092022649827516381177277732836949255477373766810031974105593936997252