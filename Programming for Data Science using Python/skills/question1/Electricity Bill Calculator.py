print("\t\tElectricity Bill Calculator")

units_consumed=float(input("\nEnter electricity units (kWh) consumed in a month: "))

#using slab logic to calculate electricity bill
#rates per kWh between Rs.5 to Rs.15
'''
First 100 units      → Rs.5/kWh
Next 100 units       → Rs.7.50/kWh
Next 100 units       → Rs.12/kWh
Above 300 units      → Rs.15/kWh
'''

if units_consumed<=100:
    bill_amount=units_consumed*5 #first slab
elif units_consumed<=200:
    bill_amount=(100*5)+((units_consumed-100)*7.5) #second slab
elif units_consumed<=300:
    bill_amount=(100*5)+(100*7.5)+((units_consumed-200)*12) #third slab
else:
    bill_amount=(100*5)+(100*7.5)+(100*12)+((units_consumed-300)*15) #fourth slab

print("\nTotal electricity units consumed:", units_consumed, "kWh")
print("Total bill amount: Rs.", round(bill_amount, 2))