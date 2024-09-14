from math import ceil

def baris_berbaris(is_right, n, b):

    hor = ceil(n/b)

    if is_right:
        if hor % 2 == 0:
            ver = b-((n-1)%b)
        else:
            ver = 1+((n-1)%b)
    else:
        if hor % 2 == 0:
            ver = 1+((n-1)%b)
        else:
            ver = b-((n-1)%b)
    
    return (ver, hor)

def visualisasi(is_right, b, total):
    list_hor = []
    barisan = []

    for i in range(1, total + 1):
        list_hor.append(i)
        if len(list_hor) == b:
            if is_right and (len(barisan) % 2) == 0:
                list_hor.reverse()
            elif not is_right and (len(barisan) % 2) == 1:
                list_hor.reverse()
            barisan.append(list_hor)
            list_hor = []
    
    if list_hor:
        while len(list_hor) < b:
            list_hor.append(" ")
            
        if is_right and (len(barisan) % 2) == 0:
            list_hor.reverse()
        elif not is_right and (len(barisan) % 2) == 1:
            list_hor.reverse()
        barisan.append(list_hor)

    for i in barisan:
        for j in i:
            print(j, end=" "*(len(str(total))-len(str(j))+1))
        print()
 
jumlah_banjar = int(input("Jumlah banjar yang diminta danlap: "))
nim = int(input("NIM: "))
kanan = input("NIM 1 dimulai dari kanan barisan (Y/n): ")

if kanan.upper() == 'Y':
    kanan = True
else:
    kanan = False

posisi = baris_berbaris(kanan, nim, jumlah_banjar)

print("Kamu berada pada posisi")
print("Banjar:", posisi[0])
print("Saf:", posisi[1])

visual = input("Apakah ingin ditampilkan secara visual (Y/n): ")

if visual.upper() == 'Y':
    nim_akhir = int(input("NIM terakhir di angkatan: "))
    visualisasi(kanan, jumlah_banjar, nim_akhir)