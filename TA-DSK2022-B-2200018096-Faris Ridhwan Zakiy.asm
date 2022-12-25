.model small
.code
org 100h
start:
  jmp mulai
nama db 13,10,'Nama Anda  :$'
hp db 13,10,'No. HP/Telp  :$'
lanjut db 13,10,'Lanjut Tekan  y untuk melanjutkan>>>>>>>>>>>>>>>>>>>>$'
tampung_nama db 30,?,30 dup(?)
tampung_hp db 13,?,13 dup(?)
a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j dw 15
daftar  db 13,10,'+-------------------------------------------------------------------------+'
        db 13,10,'|			   YOGYAKARTA INTERNATIONAL AIRPORT                     |'
	  db 13,10,'+-------------------------------------------------------------------------+'
	  db 13,10,'|			Rute Penerbangan Yogyakarta-pekanbaru                   |'
	  db 13,10,'+-------------------------------------------------------------------------+'
	  db 13,10,'|No | Maskapai     | Flight No |  Jam  |  Tanggal   |     Harga Tiket     |'
	  db 13,10,'+---+--------------+-----------+-------+---------+------------------------+'
	  db 13,10,'|01 | Lion Air     | JT-925    | 13.30 | 04/06/2022 | Rp. 1.200.000       +'
	  db 13,10,'+---+--------------+-----------+-------+------------+---------------------+'
	  db 13,10,'|02 | Citilink     | QG-601    | 10.05 | 04/06/2022 | Rp. 1.355.100       |'
	  db 13,10,'+---+--------------+-----------+-------+------------+---------------------+'
	  db 13,10,'|03 | Lion Air     | JT-695    | 11.05 | 04/06/2022 | Rp. 1.050.000       |'
	  db 13,10,'+---+--------------+-----------+-------+------------+---------------------+'
	  db 13,10,'|04 | Super Air Jet| IN-661    | 13.55 | 04/06/2022 | Rp. 1.810.200       |'
	  db 13,10,'+---+--------------+-----------+-------+---------+------------------------+'
	  db 13,10,'|05 | Batik Air    | ID-6541   | 14.20 | 04/06/2022 | Rp. 1.920.100       +'
	  db 13,10,'+---+--------------+-----------+-------+------------+---------------------+','$'

  
pilih_n db 13,10, 'Silahkan masukkan no penerbangan yang akan anda pilih: $'
error db 13,10, 'Nomor yang anda masukkan salah, silahkan masukkan kembali $'
succes db 13,10, 'Selamat anda berhasil memilih maskapai yang anda inginkan $'

mulai:
mov ah,09h
lea dx,nama
int 21h
mov ah,0ah
lea dx,tampung_nama
int 21h
push dx

mov ah,09h
lea dx,hp
int 21h
mov ah,0ah
lea dx,tampung_hp
int 21h
push dx


mov ah,09
mov dx,offset daftar
int 21h
mov ah,09h
mov dx,offset lanjut
int 21h
mov ah,01h
int 21h
cmp al,'y'
jmp proses

mov ah,09h
mov dx,offset error
int 21h
int 20h

proses:
  mov ah,09h
  mov dx,offset pilih_n
  int 21h

mov ah,1
int 21h
mov bh,al
mov ah,1
int 21h
mov bl,al
cmp bh,'0'
cmp bl,'1'
je hasil1

cmp bh,'0'
cmp bl,'2'
je hasil2
cmp bh,'0'
cmp bl,'3'
je hasil3


cmp bh,'0'
cmp bl,'4'
je hasil4

cmp bh,'0'
cmp bl,'5'
je hasil5


;------------------------------------------------------
hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h
hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h
hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h
hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h
hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h
;-----------------------------------------------------------------------

teks1	 db 13,10,'Anda Memilih Lion Air'
	 db 13,10,'Dengan Nomor Penerbangan JT-925'
	 db 13,10,'Dengan Rute Penerbangan Yogyakarta-Pekanbaru'
	 db 13,10,'Free Bagasi 0kg'
	 db 13,10,'Total Harga yang harus Anda Bayar: Rp. 1.200.000'
	 db 13,10,'Terima Kasih $'

teks2	 db 13,10,'Anda Memilih Citilink'
	 db 13,10,'Dengan Nomor Penerbangan QG-601'
	 db 13,10,'Dengan Rute Penerbangan Yogyakarta-Pekanbaru'
	 db 13,10,'Free Bagasi 20kg'
	 db 13,10,'Total Harga yang harus Anda Bayar: Rp. 1.355.100'
	 db 13,10,'Terima Kasih $'

teks3	 db 13,10,'Anda Memilih Lion Air'
	 db 13,10,'Dengan Nomor Penerbangan JT-695'
	 db 13,10,'Dengan Rute Penerbangan Yogyakarta-Pekanbaru'
	 db 13,10,'Free Bagasi 0kg'
	 db 13,10,'Total Harga yang harus Anda Bayar: Rp. 1.050.000'
	 db 13,10,'Terima Kasih $'

teks4	 db 13,10,'Anda Memilih Super Air Jet'
	 db 13,10,'Dengan Nomor Penerbangan IN-661'
	 db 13,10,'Dengan Rute Penerbangan Yogyakarta-Pekanbaru'
	 db 13,10,'Free Bagasi 20kg'
	 db 13,10,'Total Harga yang harus Anda Bayar: Rp. 1.810.200'
	 db 13,10,'Terima Kasih $'

teks5	 db 13,10,'Anda Memilih Batik Air'
	 db 13,10,'Dengan Nomor Penerbangan ID-6541'
	 db 13,10,'Dengan Rute Penerbangan Yogyakarta-Pekanbaru'
	 db 13,10,'Free Bagasi 20kg'
	 db 13,10,'Total Harga yang harus Anda Bayar: Rp. 1.920.100'
	 db 13,10,'Terima Kasih $'

end start