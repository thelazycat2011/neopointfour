bpm = int(input())
offset = float(input())
beatinsec = 1 / bpm * 60
data = []
for i in range(0, 1200):
    data.append(str(offset + (beatinsec * i)))
    data.append("0.9")
print(";".join(data))