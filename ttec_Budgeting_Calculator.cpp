#include <iostream>

using namespace std;

double  ttec_costing(int intStartReading,  int intEndReading);

double dblLevel1 = 0.26 ;  //the first band rate - TTEC units used
double dblLevel2 = 0.32; //the second band rate - TTEC units used
double dblLevel3 = 0.37; //the second band rate - TTEC units used
double dblVATRate = 1.125;// the Vat rate applied to the total cost

int intBand1 = 400; // the first tier used by TTEC
int intBand2 = 600;  // the second tier used by TTEC
int intBand3 = 1000;  // the third tier used by TTEC
// Declare the function for rate calculation



int main ()
{

double dblCostofElectrityUsed = ttec_costing(14969, 15970);

cout<< "The expected cost of the TTEC bill is :" <<  dblCostofElectrityUsed << endl;

	return 0;
}

double  ttec_costing(int intStartReading, int intEndReading)
{
	int intUnitsUsedInPeriod;
	double dblTotalCost_L1;
	double dblTotalCost_L2;
	double dblTotalCost_L3;

	intUnitsUsedInPeriod = (intEndReading - intStartReading);

	if (intUnitsUsedInPeriod <= intBand1)
		{
			dblTotalCost_L1 =  (intUnitsUsedInPeriod * dblLevel1) * dblVATRate;
			return  dblTotalCost_L1;


		}

	else if (intUnitsUsedInPeriod > intBand1 && intUnitsUsedInPeriod <= intBand3)

		{
			dblTotalCost_L2 = ((intBand1 * dblLevel1) + (intUnitsUsedInPeriod - intBand1 ) * dblLevel2)  * dblVATRate ;
			return  dblTotalCost_L2 ;
		}

	else if (intUnitsUsedInPeriod > intBand3 )
		{

			dblTotalCost_L3 = ((intBand1 * dblLevel1) + (intBand2 * dblLevel2)  +
			((intUnitsUsedInPeriod - intBand3) * dblLevel3)) * dblVATRate ;
			return dblTotalCost_L3 ;
		}


}
