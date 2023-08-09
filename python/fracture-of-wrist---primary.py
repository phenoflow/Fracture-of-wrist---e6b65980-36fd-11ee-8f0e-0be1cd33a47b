# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"S235.11","system":"readv2"},{"code":"SC3C000","system":"readv2"},{"code":"10022.0","system":"med"},{"code":"10033.0","system":"med"},{"code":"104070.0","system":"med"},{"code":"107741.0","system":"med"},{"code":"11066.0","system":"med"},{"code":"11262.0","system":"med"},{"code":"1742.0","system":"med"},{"code":"17921.0","system":"med"},{"code":"17922.0","system":"med"},{"code":"18299.0","system":"med"},{"code":"18301.0","system":"med"},{"code":"18389.0","system":"med"},{"code":"18614.0","system":"med"},{"code":"19058.0","system":"med"},{"code":"199.0","system":"med"},{"code":"203.0","system":"med"},{"code":"27590.0","system":"med"},{"code":"27591.0","system":"med"},{"code":"28293.0","system":"med"},{"code":"2862.0","system":"med"},{"code":"28708.0","system":"med"},{"code":"30418.0","system":"med"},{"code":"343.0","system":"med"},{"code":"34429.0","system":"med"},{"code":"34730.0","system":"med"},{"code":"38398.0","system":"med"},{"code":"38408.0","system":"med"},{"code":"40268.0","system":"med"},{"code":"40476.0","system":"med"},{"code":"42076.0","system":"med"},{"code":"42844.0","system":"med"},{"code":"44652.0","system":"med"},{"code":"44844.0","system":"med"},{"code":"44924.0","system":"med"},{"code":"46798.0","system":"med"},{"code":"49256.0","system":"med"},{"code":"49796.0","system":"med"},{"code":"50053.0","system":"med"},{"code":"50148.0","system":"med"},{"code":"52389.0","system":"med"},{"code":"53689.0","system":"med"},{"code":"53698.0","system":"med"},{"code":"57736.0","system":"med"},{"code":"59219.0","system":"med"},{"code":"5951.0","system":"med"},{"code":"60343.0","system":"med"},{"code":"60630.0","system":"med"},{"code":"6074.0","system":"med"},{"code":"61675.0","system":"med"},{"code":"6213.0","system":"med"},{"code":"63588.0","system":"med"},{"code":"6380.0","system":"med"},{"code":"6455.0","system":"med"},{"code":"65636.0","system":"med"},{"code":"66774.0","system":"med"},{"code":"6915.0","system":"med"},{"code":"9165.0","system":"med"},{"code":"9261.0","system":"med"},{"code":"96691.0","system":"med"},{"code":"98681.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('fracture-of-wrist-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["fracture-of-wrist---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["fracture-of-wrist---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["fracture-of-wrist---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
