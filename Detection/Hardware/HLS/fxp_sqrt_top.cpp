/*******************************************************************************
Vendor: Xilinx 
Associated Filename: fxp_sqrt_top.cpp
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

#include "fxp_sqrt_top.h"
#include <ap_fixed.h>
#include <stdlib.h>
#include <cmath>

#define NAHID_BW   20
#define NAHID_IW    12

typedef ap_ufixed<NAHID_BW,NAHID_IW>   nahid_data_t;


nahid_data_t fxpnahid(unsigned short x1,unsigned short x2,unsigned short x3,unsigned short y1, unsigned short y2, unsigned short y3);

/*out_data_t fxp_sqrt_top(in_data_t& in_val)
{
   out_data_t result;
   fxp_sqrt(result, in_val);
   return result;
}*/

nahid_data_t fxp_nahid_top(unsigned short x1,unsigned short x2,unsigned short x3,unsigned short y1, unsigned short y2, unsigned short y3)
{
	nahid_data_t result;
   //fxp_sqrt(result, in_val);
   result=fxpnahid(x1,x2,x3,y1, y2, y3);
   return result;
}


nahid_data_t fxpnahid(unsigned short x1,unsigned short x2,unsigned short x3,unsigned short y1, unsigned short y2, unsigned short y3)
{

	unsigned short ax1,ay1,Mx,My,SDx,SDy,MSDx,MSDy,DX1,DX2,DX3,DY1,DY2,DY3,D1,D2,D3,N1,N2,N3;

	nahid_data_t Q1,Q2,Q3,aQ1,aQ2,NaHiDverc;
	unsigned long mx1,mx2,mx3,my1,my2,my3,Mx2,My2,amx1,amy1,M2x,M2y,Vx,Vy;

	//out_data_t raizVx;
	//in_data_t VxFxp;
	ap_ufixed<22,22> VxFxp;
	ap_ufixed<12,12> raizVx;

	ap_ufixed<22,22> VyFxp;
	ap_ufixed<12,12> raizVy;


//	out_data_t raizVy;
//	in_data_t VyFxp;

	ax1=x1+x2;
	ay1=y1+y2;
 	Mx=(ax1+x3)/4;
	My=(ay1+y3)/4;
	mx1=(unsigned long)x1*(unsigned long) x1;
	mx2=(unsigned long)x2*(unsigned long)x2;
	mx3=(unsigned long)x3*(unsigned long)x3;
	my1=(unsigned long)y1*(unsigned long)y1;
	my2=(unsigned long)y2*(unsigned long)y2;
	my3=(unsigned long)y3*(unsigned long)y3;
	Mx2=(unsigned long)Mx*(unsigned long)Mx;
	My2=(unsigned long)My*(unsigned long)My;
	amx1=mx1+mx2;
	amy1=my1+my2;
	M2x=(amx1+mx3)/4;
	M2y=(amy1+my3)/4;
	Vx=abs((long)Mx2-(long)M2x);
	Vy=abs((long)My2-(long)M2y);


	VxFxp = ap_ufixed<22,22>(Vx);
	fxp_sqrt(raizVx, VxFxp);
	SDx = raizVx.to_uint();

	VyFxp = ap_ufixed<22,22>(Vy);
	fxp_sqrt(raizVy, VyFxp);
	SDy = raizVy.to_uint();

	/*VxFxp = (in_data_t)Vx;
	raizVx=fxp_sqrt_top(VxFxp);
	SDx=(short) raizVx;*/

	/*VyFxp = (in_data_t)Vy;
	raizVy=fxp_sqrt_top(VyFxp);
	//fxp_sqrt(raizVy,VyFxp);
	SDy=(short) raizVy;*/


	MSDx=abs((short)Mx-(short)SDx);
	MSDy=abs((short)My-(short)SDy);
	DX1=abs((short)MSDx-(short)x1);
	DX2=abs((short)MSDx-(short)x2);
	DX3=abs((short)MSDx-(short)x3);
	DY1=abs((short)MSDy-(short)y1);
	DY2=abs((short)MSDy-(short)y2);
	DY3=abs((short)MSDy-(short)y3);
	D1=DX1+DY1;
	D2=DX2+DY2;
	D3=DX3+DY3;
	N1=abs((short)x1-(short)y1);
	N2=abs((short)x2-(short)y2);
	N3=abs((short)x3-(short)y3);

    /*N1=33;
	Q1 = (nahid_data_t) N1;
    N1=35;
    N1=Q1.to_uint();*/

	Q1=((nahid_data_t)N1)/((nahid_data_t)D1);
	Q2=((nahid_data_t)N2)/((nahid_data_t)D2);
	Q3=((nahid_data_t)N3)/((nahid_data_t)D3);
	aQ1=Q1+Q2;
	aQ2=(aQ1+Q3)/((nahid_data_t)4);
	//if(aQ2>1.0)
	//	NaHiDverc=aQ2-((nahid_data_t)1.0);
	//else
		NaHiDverc=((nahid_data_t)1.0)-aQ2;

	return NaHiDverc;
}

// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
