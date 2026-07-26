print("\t\tBSc and MSc Eligibility Checker")

bsc_required_cutoff=60
msc_required_cutoff=6
while True:
    print("1. Bsc\n2. Msc\n3. exit") 
    course=int(input("Enter option: "))
    match course:
        case 1:
            percentage=float(input("Input 12th percentage: "))
            if percentage>=bsc_required_cutoff:
                print("Eligible for Bsc\n")
            else:
                print("Not eligible for Bsc\n")
        case 2:
            cgpa=float(input("Input graduation cgpa: "))
            if cgpa>=msc_required_cutoff:
                print("Eligible for Msc\n")
            else:
                print("Not eligible for Msc\n")
        case 3:
            print("exiting...")
            exit()
        case _:
            print("Invalid choice")
