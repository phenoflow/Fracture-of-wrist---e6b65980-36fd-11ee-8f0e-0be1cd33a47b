# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"S234911","system":"readv2"},{"code":"S234A11","system":"readv2"},{"code":"S4C..00","system":"readv2"},{"code":"S4C0.00","system":"readv2"},{"code":"S4C0000","system":"readv2"},{"code":"S4C0100","system":"readv2"},{"code":"S4C1.00","system":"readv2"},{"code":"S4C1000","system":"readv2"},{"code":"S4C1100","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('fracture-of-wrist-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["fracture-of-wrist-dislocation---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["fracture-of-wrist-dislocation---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["fracture-of-wrist-dislocation---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
