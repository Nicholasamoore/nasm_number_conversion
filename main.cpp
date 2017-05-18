// Nicholas Moore
// Lab 6 - number conversions
// COSC 2325

#include <iostream>
using namespace std;
#include "numbers.h"

char buffer[100];
int ival;
bool found = false;
bool flag = true;
char try_again = 'Y';

int main(int argc, char * argv[]) {

    cout << "\nLab 6 - Number Conversion\n\n";

    while (try_again == 'Y')
    {
    	    // Decimal to unsigned integer
	    while (flag == true){
	    	cout << "Enter a +/- decimal number in the format 'xx.xx+' to convert: ";
	    	cin >> buffer;
	    	cout << "\tYou entered : " << buffer << endl;
	    	// Check if + exists in the string
	    	for (int i = 0; i < 100; i++)
	    	{
	    		if (buffer[i] == '+')
	    		{
	    			found = true;
	    		}
	    	}
	    	if(found)
	    	{
	    		ival = n_dtoi(buffer);
	    		cout << "\tAfter converting, this gave: " << ival << endl;
	    		ival = n_len(buffer);
	    		cout << "\tThe input string was " << ival << " characters long\n" << endl;
	    		flag = false;
	    	}
	    	else
	    	{
	    		cout << "Error: please enter a decimal number in the correct format.\n";
	    	}
	    }

	    // Binary to unsigned integer
	    flag = true;
	    while (flag == true){
	    	cout << "Enter a binary number in the format '0b_xxxx' to convert: ";
	    	cin >> buffer;
	    	cout << "\tYou entered : " << buffer << endl;
	    	// Check if 0b_ exists at beginning of string
	    	if (buffer[0] == '0' && buffer[1] == 'b' && buffer[2] == '_')
	    	{
	    		ival = n_btoi(buffer);
	    		cout << "\tAfter converting, this gave: " << ival << endl;    
	    		ival = n_len(buffer);
	    		cout << "\tThe input string was " << ival << " characters long" << endl;
	    		flag = false;
	    	}
	    	else
	    	{
	    		cout << "Error: please enter a binary number in the correct format.\n";
	    	}
	    }
	    cout << "\nWould you like to convert again? [Y/N]: ";
	    cin >> try_again; try_again = toupper(try_again); flag = true;
	    cout << "\n";
    }

    return 0;
}
