def ttecCompute (intReading: object, intPrevBillReading: object = 16960) -> object:
    # ttecEstimate = 0
    # TtecWorkingRead = 0.00
    
    # import HelloWordPartDeux
    
    # HelloWordPartDeux.commOneOhOne()
    
    
    
    intUsedUnits = 0
    
    curr = intReading  # the current reading as whem observed at the meter - i.e its a real time variable
    prev = intPrevBillReading  # the prev variable is the antithesis of the curr variable
    vatAddOn = 1.125  # this is the local(T&T) Vale Added Tax Rate
    ttecBand1 = 0.26
    ttecBand2 = 0.32
    ttecBand3 = 0.37
    ttec_level1 = 400
    ttec_level2 = 600
    
    ttec_level3 = 1000
    
    
    
    
    
    
    intUsedUnits = (curr - prev)
    
    if intUsedUnits <= ttec_level1:
        ttecEstimate = (intUsedUnits * ttecBand1) * vatAddOn
        return ttecEstimate
    elif (intUsedUnits <= ttec_level3):
        ttecEstimate = (
            # TODO
            ((ttec_level1 * ttecBand1) + ((intUsedUnits - ttec_level1) * ttecBand2)) * vatAddOn
        
        )
        return ttecEstimate
    elif intUsedUnits > ttec_level3:
        
        tmpVar = (ttec_level1 * ttecBand1) + (ttec_level2 * ttecBand2) + ((intUsedUnits - ttec_level3) * ttecBand3)
        
        ttecEstimate = tmpVar * vatAddOn
        
        return ttecEstimate


print ("My Electricity Bill Estimate is :", ttecCompute (17789))
#
# def days_comp():
#      import datetime as d
#      d0 = d.date(2018,10,9)
#      d1 = d.date(2018,12,12)
#
#      return (d1 - d0)
#
# days_comp()
#
#
# ttec_oct2018 = 825.93
# print(ttec_oct2018/2)
#



