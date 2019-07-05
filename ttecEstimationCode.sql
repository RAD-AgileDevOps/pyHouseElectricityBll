use `glove_crescent`;
DELIMITER $$
DROP FUNCTION if exists`ttec_estimator_` ;
CREATE FUNCTION `ttec_estimator_` (ttec_reading DOUBLE) RETURNS double


BEGIN
 
DECLARE ttec_estimate DOUBLE;
DECLARE Prev_ttec_read DOUBLE;
Declare TTEC_Working_Read DOUBLE ;
Declare VAT_ADD_on  Double;

set  Prev_ttec_read = 21976;     -- actual reading from TTEC bill at 10 Jun 2019

-- set  Prev_ttec_read = 21892.6829;  -- 2019-06-11 @ 07:00 Estimated Opening Bal 10 Jun 2019  I used SQL code to do the calculation

-- 2019-06-11 
-- select 21875 + (timediff('2019-06-10 15:27:00','2019-06-10 00:00:00') /  timediff('2019-06-10 15:27:00','2019-06-07 06:56:00')) * (21968 - 21875)  as Jun_Jul2019OpBalEstimate



-- set  Prev_ttec_read = 16779;  -- 09 dec2018  [ estimaed used Python datetime function '']  

--  (17046-16645)*4/12
/* Out[8]: 133.66666666666666
In[9]: 16645+134
Out[9]: 16779
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/* 
def days_comp():
     import datetime as d
     d0 = d.date(2018,10,9)
     d1 = d.date(2018,12,12)

     return (d1 - d0)

days_comp()
 */
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- set  Prev_ttec_read = 14991;  -- 09 Aug 2018
-- 18 Feb 2018
-- 7265.71428571429 is a calcualted estimate that I did to fcilitate more accurate budgeting

set TTEC_Working_Read = ttec_reading - Prev_ttec_read ;

set VAT_ADD_on = 1.125 ;

IF TTEC_Working_Read <= 400 then
	set ttec_estimate = (TTEC_Working_Read * 0.26) * VAT_ADD_on ;
    
-- Elseif ((TTEC_Working_Read  > 400)  and (TTEC_Working_Read <= 600)) then

Elseif  (TTEC_Working_Read <= 1000) then

	set ttec_estimate =( (400 * 0.26) + ((TTEC_Working_Read - 400) * 0.32))  * VAT_ADD_on  ;
    
Elseif TTEC_Working_Read  > 1000 then
	
    set ttec_estimate = ((400 * 0.26) + (600 * 0.32) + ((TTEC_Working_Read - 1000) * 0.37))  * VAT_ADD_on ;
    
End if;
 
RETURN Round(ttec_estimate,4);

END