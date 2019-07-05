# date: 2019-04-21
#developer: Roger De Four
# souce: C:\Finances\ttecEstimationCode.sql
# I had created this function to assist me in the computation of the period end of TTEC readings date.
# This is to facilitate more accurate calculation of the expenditure on electicity use, for budgeting purposes



def days_comp ( ):
    import datetime as d
    d0 = d.datetime (2019, 3, 10 , 18,10 )
    d1 = d.datetime (2019,4, 9,11, 37)
    d2_period_end = d.datetime (2019,4, 8 , 11, 37)
    relevant_period = (d2_period_end - d0)
    base_period = d1 - d0



    start_readings = 19323 # 2019-03-10 18:10:00
    end_readings = 20154  # 2019-04-09 11:37:00
    units_used = end_readings - start_readings


    print("Units used at period end = " , (start_readings + ((relevant_period / base_period) *units_used)))
    return (relevant_period / base_period) *units_used

print(days_comp ())