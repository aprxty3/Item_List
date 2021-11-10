# Assignment Test PT Inspira Solutech

API List :
* Login : http://172.104.44.22/api/method/login?usr=Administrator&pwd=admin
* Barang : http://172.104.44.22/api/resource/Item?fields=["item_code", "item_name","image","normal_rate","promo_rate"]&filters=[["Item","item_group","=","Products"]]

## Koreksi API Login
 
Instruksinya usr sama pwd ada di dalam body request. Tapi pas hit endpoint dengan url + body request gagal. 
Ketika diubah usr sama pwd di include ke dalam 1 query dengan url API. Malah berhasil
Antara query parameter sama request body itu jelas2 beda.
Query ada di request header (termasuk url), sedangkan body request itu bagian lain dari sebuah request. 
di docs-nya jelas2 bilang kalau usr sama pwd di body dan berbentuk json.

## Koreksi API List Item
Di document test yg dikasih response jsonnya ada macam2
Tapi pas di hit response dari server itu object yg isinya array of object yg tiap objectnya cuma berisi key "name" dengan tipe valuenya string
Di docs soal ada image segala macem. Yang dimungkinkandari sisi front end bakal salah nyiapin model buat nampung response
