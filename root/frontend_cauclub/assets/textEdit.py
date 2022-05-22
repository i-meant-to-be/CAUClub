inPath = "./ClubList.txt"
outPath = "./ClubListEdited.txt"

inFile = open(inPath, "r", encoding = "utf-8")
outFile = open(outPath, "w")
inDataList = list()

while True:
    temp = inFile.readline().strip().split("/")
    if len(temp) < 2: break
    else: outFile.write(f"'{temp[0]}': '{temp[1]}',\n'")

inFile.close()
outFile.close()