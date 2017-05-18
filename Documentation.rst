4/20/2017
=========

I began this lab several days ago, but did not want to push anything to the repo until I had some working code. Decimal to unsigned integer has been completed.

Next I'll need to think about how to convert binary to unsigned integer.

4/22/2017
=========

It was a long and tedious process but I think I figured out the binary to integer conversion. I had to implement several labels to complete this:

* n_btoi - call n_len and prepare registers
* btoi_loop - grab the correct character and branch to the next location
* exponent - Loop the appropriate number of times to carry out 2^n
* zeropow - This takes care of 2^0 power on its own
* ex_done - After the exponent loop is done, add the exponent result into rax, inc/dec registers, and loop back to btoi_loop
* skip - Skip the 0 values. inc/dec without doing any math and return to btoi_loop again.

4/11/2017 evening
=================

n_btoi finished. Added more comments. Now I just need to ensure that '0b_' is in the string before doing the conversion.

* Added '+' and '0b_' checks in main.cpp
* All comments in numbers.asm completed
* Added the option to choose whether or not to convert again

Assignment completed.

