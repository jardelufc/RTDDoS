/*******************************************************************************
Vendor: Xilinx 
Associated Filename: fxp_sqrt_test.cpp
Purpose:Vivado HLSfxp_sqrt example project
Revision History: Feb 21, 2012 - initial release
                                                
*******************************************************************************
#-  (c) Copyright 2011-2016 Xilinx, Inc. All rights reserved.
#-
#-  This file contains confidential and proprietary information
#-  of Xilinx, Inc. and is protected under U.S. and
#-  international copyright and other intellectual property
#-  laws.
#-
#-  DISCLAIMER
#-  This disclaimer is not a license and does not grant any
#-  rights to the materials distributed herewith. Except as
#-  otherwise provided in a valid license issued to you by
#-  Xilinx, and to the maximum extent permitted by applicable
#-  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#-  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#-  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#-  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#-  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#-  (2) Xilinx shall not be liable (whether in contract or tort,
#-  including negligence, or under any other theory of
#-  liability) for any loss or damage of any kind or nature
#-  related to, arising under or in connection with these
#-  materials, including for any direct, or any indirect,
#-  special, incidental, or consequential loss or damage
#-  (including loss of data, profits, goodwill, or any type of
#-  loss or damage suffered as a result of any action brought
#-  by a third party) even if such damage or loss was
#-  reasonably foreseeable or Xilinx had been advised of the
#-  possibility of the same.
#-
#-  CRITICAL APPLICATIONS
#-  Xilinx products are not designed or intended to be fail-
#-  safe, or for use in any application requiring fail-safe
#-  performance, such as life-support or safety devices or
#-  systems, Class III medical devices, nuclear facilities,
#-  applications related to the deployment of airbags, or any
#-  other applications that could lead to death, personal
#-  injury, or severe property or environmental damage
#-  (individually and collectively, "Critical
#-  Applications"). Customer assumes the sole risk and
#-  liability of any use of Xilinx products in Critical
#-  Applications, subject only to applicable laws and
#-  regulations governing limitations on product liability.
#-
#-  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#-  PART OF THIS FILE AT ALL TIMES. 
#- ************************************************************************


This file contains confidential and proprietary information of Xilinx, Inc. and 
is protected under U.S. and international copyright and other intellectual 
property laws.

DISCLAIMER
This disclaimer is not a license and does not grant any rights to the materials 
distributed herewith. Except as otherwise provided in a valid license issued to 
you by Xilinx, and to the maximum extent permitted by applicable law: 
(1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX 
HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether 
in contract or tort, including negligence, or under any other theory of 
liability) for any loss or damage of any kind or nature related to, arising under 
or in connection with these materials, including for any direct, or any indirect, 
special, incidental, or consequential loss or damage (including loss of data, 
profits, goodwill, or any type of loss or damage suffered as a result of any 
action brought by a third party) even if such damage or loss was reasonably 
foreseeable or Xilinx had been advised of the possibility of the same.

CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-safe, or for use in any 
application requiring fail-safe performance, such as life-support or safety 
devices or systems, Class III medical devices, nuclear facilities, applications 
related to the deployment of airbags, or any other applications that could lead 
to death, personal injury, or severe property or environmental damage 
(individually and collectively, "Critical Applications"). Customer assumes the 
sole risk and liability of any use of Xilinx products in Critical Applications, 
subject only to applicable laws and regulations governing limitations on product 
liability. 

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT 
ALL TIMES.

*******************************************************************************/

#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <cmath>
#include <ap_fixed.h>
#include <stdlib.h>
using namespace std;

#include "fxp_sqrt_top.h"

#define NUM_TEST_ITERS 100//0000
#define MIN_ITER_IDX 0
#define MAX_ITER_IDX (MIN_ITER_IDX + NUM_TEST_ITERS)

#define MY_DRAND() (rand() * rand() / (double)(RAND_MAX * RAND_MAX + 1))

#define ABS_ERR_THRESH (0.0 / (double)(1ll << (OUT_BW - OUT_IW)))


#define NAHID_BW   20
#define NAHID_IW    12

typedef ap_ufixed<NAHID_BW,NAHID_IW>   nahid_data_t;



nahid_data_t fxp_nahid_top(unsigned short x1,unsigned short x2,unsigned short x3,unsigned short y1, unsigned short y2, unsigned short y3);

// Test program for validating C-model functionality and RTL co-simulation
int main(int argc, char *argv[])
{
	unsigned short myx1,myx2,myx3,myy1,myy2,myy3;
	nahid_data_t myz;

	/*myx1=0x15c;
	myx2=0x515;
	myx3=0x5e;
	myy1=0xa4;
	myy2=0x7e;
	myy3=0x62;*/

	myx1=365;
	myx2=252;
	myx3=953;
	myy1=140;
	myy2=200;
	myy3=970;

	/*
	   x1=357663.0;
	   x2=12.79;
	   x3=0.94;
	   y1=379.0;
	   y2=2.55;
	   y3=0.9709;*/


	myz = fxp_nahid_top(myx1,myx2,myx3,myy1, myy2, myy3);
    printf("\nO Resultado em bits eh  %x\n", myz.bits_to_uint64());
    printf("O Resultado em ponto fixo eh %f\n", myz.to_float());

	/*
   in_data_t test_val;
   in_data_t min_test_val, max_test_val;
   unsigned err_cnt = 0;

   min_test_val.range(IN_BW - 1, 0) = ap_uint<IN_BW>(-1LL);
   max_test_val = 0.0;

   for (uint32_t i = MIN_ITER_IDX; i < MAX_ITER_IDX; i++) {
      if ( 0 )//NUM_TEST_ITERS <= 100)
         test_val = i;
      else
         test_val = double(1LL << IN_IW) * MY_DRAND();
      if (min_test_val > test_val) min_test_val = test_val;
      if (max_test_val < test_val) max_test_val = test_val;

      // Run theVivado HLStop-level function
      out_data_t hw_outval = fxp_sqrt_top(test_val);

      // Check value against floating point reference value rounded to input format
      ap_ufixed<OUT_BW,OUT_IW,AP_RND> sw_outval = sqrt(test_val.to_double());

      if (NUM_TEST_ITERS <= 100) {
         cout << "sqrt(" << test_val <<") = " << sw_outval << ";\t";
         cout << "sqrt_fxp(" << test_val << ") = " << hw_outval << endl;
      } else {
         if (i == 0)
            cout << "Running test.";
         else if (!(i % (NUM_TEST_ITERS / 100))) {
            cout << ".";
            fflush(stdout);
         }
      }
      if (fabs(hw_outval.to_double() - sw_outval.to_double()) > ABS_ERR_THRESH) {
         cout << "MISMATCH (" << i << "): \t";
         cout << "fxp_sqrt(" << test_val << ") = " << hw_outval;
         cout << "\tDelta = " << (hw_outval.to_double() - sw_outval.to_double());
         cout << "\thw_outval/sw_outval = " << (hw_outval.to_double() / sw_outval.to_double());
         cout << endl << endl;
         err_cnt++;
      }
   }

   cout << endl;
   cout << "Min tested val: " << min_test_val;
   cout << "\tMax tested val: " << max_test_val << endl;
   if (err_cnt) {
      cout << "!!! ERROR: " << err_cnt << " mismatches detected !!!";
      cout << endl << endl;
   } else {
      cout << "*** Test passes ***" << endl << endl;
   }
   if (err_cnt)
       return 1;
   else*/

   return 0;
}


// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
